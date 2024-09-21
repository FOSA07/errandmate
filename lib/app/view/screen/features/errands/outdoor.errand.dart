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
      header: ClassicHeader(
        hitOver: true,
        showText: false,
        succeededIcon: getOutdoorErrands is List? const Icon(Icons.check_rounded) :const SizedBox() 
      ),
      footer: const ClassicFooter(),
      child: getOutdoorErrands.when(
        data: (data) => data is List ? ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Column(
            children: [
              AvailableErrandContainer(
                errandStatus: "outdoor",
                position: data[index]["owner"]["email"] ?? "",
                date: data[index]["created_at"].toString().substring(0, data[index]["created_at"].toString().indexOf("T")) ?? "",
                price: data[index]["budget"] ?? ""
              ),
              const SizedBox(height: 15,),
            ],
          ),) : Center(child: getOutdoorErrands.isLoading ?
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ) : TextButton(
              onPressed: () => ref.invalidate(getOutdoorNotifierProvider),
              style: const ButtonStyle(backgroundColor: 
                WidgetStatePropertyAll(Color.fromARGB(255, 208, 230, 249))),
              child: const Text("reload"),  
            )),
        error: (error, stackTrace) => Center(child: getOutdoorErrands.isLoading ?
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ) : TextButton(
              onPressed: () => ref.invalidate(getOutdoorNotifierProvider),
              style: const ButtonStyle(backgroundColor: 
                WidgetStatePropertyAll(Color.fromARGB(255, 208, 230, 249))),
              child: const Text("reload"),  
            )),
        loading: () => const Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          )
        )
      ),
    );
  }
}