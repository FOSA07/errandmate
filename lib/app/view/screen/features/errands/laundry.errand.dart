import 'package:easy_refresh/easy_refresh.dart';
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

  final EasyRefreshController _controller = EasyRefreshController(controlFinishLoad: true);

  @override
  Widget build(BuildContext context) {
    final getLaundryErrands = ref.watch(getLaundryNotifierProvider);
    return EasyRefresh(
      controller: _controller,
      onRefresh: () async => await ref.refresh(getLaundryNotifierProvider.future),
      header: ClassicHeader(
        hitOver: true,
        showText: false,
        succeededIcon: getLaundryErrands is List? const Icon(Icons.check_rounded) :const SizedBox() 
      ),
      footer: const ClassicFooter(),
      child: getLaundryErrands.when(
        data: (data) => data is List ? ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Column(
            children: [
              AvailableErrandContainer(
                errandStatus: "laundry",
                position: data[index]["owner"]["email"] ?? "",
                date: data[index]["created_at"] ?? "",
                price: data[index]["amount"] ?? ""
              ),
              const SizedBox(height: 15,)
            ],
          ),) : Center(child: getLaundryErrands.isLoading ?
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ) : TextButton(
              onPressed: () => ref.invalidate(getLaundryNotifierProvider),
              style: const ButtonStyle(backgroundColor: 
                WidgetStatePropertyAll(Color.fromARGB(255, 208, 230, 249))),
              child: const Text("reload"),  
            )),
        error: (error, stackTrace) => Center(child: getLaundryErrands.isLoading ?
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ) : TextButton(
              onPressed: () => ref.invalidate(getLaundryNotifierProvider),
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