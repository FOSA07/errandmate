import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../viewmodel/provider/errands/getErrands/laundry.dart';
import '../components/available.errand.dart';

class LaundryErrands extends ConsumerStatefulWidget {
  const LaundryErrands({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LaundryErrandsState();
}

class _LaundryErrandsState extends ConsumerState<LaundryErrands> {

  @override
  Widget build(BuildContext context) {
    final getLaundryErrands = ref.watch(getLaundryNotifierProvider);
    return getLaundryErrands.when(
      data: (data) => data is List ? ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Column(
          children: [
            AvailableErrandContainer(
              errandStatus: "laundry",
              position: "position",
              date: data[index]["created_at"] ?? "",
              price: data[index]["amount"] ?? ""
            ),
            const SizedBox(height: 15,)
          ],
        ),) : Center(child: getLaundryErrands.isLoading ?
            const CircularProgressIndicator() : TextButton(
            onPressed: () => ref.invalidate(getLaundryNotifierProvider), child: const Text("reload"))),
      error: (error, stackTrace) => Text("Error - $error ${error.runtimeType}"),
      loading: () => const Text("loading")
    );
  }
}