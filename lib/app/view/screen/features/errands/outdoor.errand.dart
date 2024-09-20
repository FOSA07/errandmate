import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../viewmodel/provider/errands/getErrands/outdoor.dart';
import '../components/available.errand.dart';

class OutdoorErrands extends ConsumerStatefulWidget {
  const OutdoorErrands({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OutdoorErrandsState();
}

class _OutdoorErrandsState extends ConsumerState<OutdoorErrands> {

  final EasyRefreshController _controller = EasyRefreshController(controlFinishLoad: true);

  @override
  void initState() {
    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    final getOutdoorErrands = ref.watch(getOutdoorNotifierProvider);
    // ref.watch(getOutdoorNotifierProvider).isLoading ? _controller.callLoad() : _controller.finishLoad();
    
    return EasyRefresh(
      controller: _controller,
      onRefresh: () async => await ref.refresh(getOutdoorNotifierProvider.future),
      header: const ClassicHeader(
        hitOver: true,
        showText: false
      ),
      footer: const ClassicFooter(),
      child: getOutdoorErrands.when(
        data: (data) => data is List ? ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Column(
            children: [
              AvailableErrandContainer(
                errandStatus: "outdoor",
                position: data[index]["email"] ?? "",
                date: data[index]["created_at"] ?? "",
                price: data[index]["budget"] ?? ""
              ),
              const SizedBox(height: 15,),
            ],
          ),) : Center(child: getOutdoorErrands.isLoading ?
            const CircularProgressIndicator() : TextButton(
            onPressed: () => ref.invalidate(getOutdoorNotifierProvider), child: const Text("reload"))),
        error: (error, stackTrace) => Text("Error - $error ${error.runtimeType}"),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        )
      ),
    );
  }
}