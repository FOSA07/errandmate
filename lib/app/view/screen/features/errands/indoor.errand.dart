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
      header: ClassicHeader(
        hitOver: true,
        showText: false,
        succeededIcon: getIndoorErrands is List? const Icon(Icons.check_rounded) :const SizedBox() 
      ),
      footer: const ClassicFooter(),
      child: getIndoorErrands.when(
        data: (data) => data is List ? ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Column(
            children: [
              AvailableErrandContainer(
                errandStatus: "indoor",
                position: data[index]["owner"]["email"] ?? "",
                date: data[index]["created_at"] ?? "",
                price: data[index]["budget"] ?? ""
              ),
              const SizedBox(height: 15,),
            ],
          ),) : Center(child: getIndoorErrands.isLoading ?
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ) : TextButton(
              onPressed: () => ref.invalidate(getIndoorNotifierProvider),
              // style: const ButtonStyle(backgroundColor: 
              //   WidgetStatePropertyAll(Color.fromARGB(255, 208, 230, 249))),
              child: const Text("reload"),  
            )),
        error: (error, stackTrace) => Center(child: getIndoorErrands.isLoading ?
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ) : TextButton(
              onPressed: () => ref.invalidate(getIndoorNotifierProvider),
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