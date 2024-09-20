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

  @override
  Widget build(BuildContext context) {
    final getPickupErrands = ref.watch(getPickupNotifierProvider);
    return getPickupErrands.when(
      data: (data) => data is List ? ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Column(
          children: [
            AvailableErrandContainer(
              errandStatus: "pickup",
              position: "position",
              date: data[index]["created_at"] ?? "",
              price: data[index]["budget"] ?? ""
            ),
            const SizedBox(height: 15,),
          ],
        ),) : Center(child: getPickupErrands.isLoading ?
            const CircularProgressIndicator() : TextButton(
            onPressed: () => ref.invalidate(getPickupNotifierProvider), child: const Text("reload"))),
      error: (error, stackTrace) => Text("Error - $error ${error.runtimeType}"),
      loading: () => const Text("loading")
    );
  }
}