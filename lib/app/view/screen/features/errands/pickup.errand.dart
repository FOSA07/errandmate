import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../viewmodel/provider/errands/getErrands/pickup.dart';
import '../components/available.errand.dart';

class PickupErrands extends ConsumerStatefulWidget {
  const PickupErrands({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PickupErrandsState();
}

class _PickupErrandsState extends ConsumerState<PickupErrands> {

  final EasyRefreshController _controller = EasyRefreshController(controlFinishLoad: true);

  @override
  Widget build(BuildContext context) {
    final getPickupErrands = ref.watch(getPickupNotifierProvider);
    return EasyRefresh(
      controller: _controller,
      onRefresh: () async => await ref.refresh(getPickupNotifierProvider.future),
      header: ClassicHeader(
        hitOver: true,
        showText: false,
        succeededIcon: getPickupErrands is List? const Icon(Icons.check_rounded) :const SizedBox() 
      ),
      footer: const ClassicFooter(),
      child: getPickupErrands.when(
        data: (data) => data is List ? ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Column(
            children: [
              AvailableErrandContainer(
                errandStatus: "pickup",
                position: data[index]["owner"]["email"] ?? "",
                date: data[index]["created_at"] ?? "",
                price: data[index]["budget"] ?? ""
              ),
              const SizedBox(height: 15,),
            ],
          ),) : Center(child: getPickupErrands.isLoading ?
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ) : TextButton(
              onPressed: () => ref.invalidate(getPickupNotifierProvider),
              style: const ButtonStyle(backgroundColor: 
                WidgetStatePropertyAll(Color.fromARGB(255, 208, 230, 249))),
              child: const Text("reload"),  
            )),
        error: (error, stackTrace) => Center(child: getPickupErrands.isLoading ?
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ) : TextButton(
              onPressed: () => ref.invalidate(getPickupNotifierProvider),
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