import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../viewmodel/provider/errands/getErrands/indoor.dart';
import '../components/available.errand.dart';

class IndoorErrands extends ConsumerStatefulWidget {
  const IndoorErrands({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IndoorErrandsState();
}

class _IndoorErrandsState extends ConsumerState<IndoorErrands> {

  final EasyRefreshController _controller = EasyRefreshController(controlFinishLoad: true);

  @override
  Widget build(BuildContext context) {
    final getIndoorErrands = ref.watch(getIndoorNotifierProvider);

    return EasyRefresh(
      controller: _controller,
      onRefresh: () async => await ref.refresh(getIndoorNotifierProvider.future),
      header: const ClassicHeader(
        hitOver: true,
        showText: false,
        succeededIcon: AnimatedOpacity(opacity: 0, duration: Duration(seconds: 1))
      ),
      footer: const ClassicFooter(),
      child: getIndoorErrands.when(
        data: (data) => data is List ? ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Column(
            children: [
              AvailableErrandContainer(
                errandStatus: "indoor",
                position: "position",
                date: data[index]["created_at"] ?? "",
                price: data[index]["budget"] ?? ""
              ),
              const SizedBox(height: 15,),
            ],
          ),) : Center(child: getIndoorErrands.isLoading ?
            const CircularProgressIndicator() : TextButton(
            onPressed: () => ref.invalidate(getIndoorNotifierProvider), child: const Text("reload"))),
        error: (error, stackTrace) => Text("Error - $error ${error.runtimeType}"),
        loading: () => const CircularProgressIndicator()
      ),
    );
  }
}