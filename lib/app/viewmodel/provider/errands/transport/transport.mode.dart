import 'package:dartz/dartz.dart';
import 'package:errandmate/app/data/controller/transport.mode.controller.dart';
import 'package:errandmate/app/model/tranport.mode.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transport.mode.g.dart';

@Riverpod(keepAlive: true)
class TransportModeNotifier extends _$TransportModeNotifier {
  List<TransportMode> _transaportModes = [];

  Future<void> fetchtransaportModes() async {
    state = const AsyncLoading();
    final response = await TransaportModesController().fetchTransaportModes();

    response.fold(
      (failure) {
        state = AsyncValue.error(Left(failure), StackTrace.current);
      },
      (data) {
        settransaportModes = data;
        state = AsyncValue.data(AsyncValue.data(Right(data)));
      },
    );
  }

  @override
  FutureOr<AsyncValue> build() {
    return Future(
      () => const AsyncValue.data(''),
    );
  }

  set settransaportModes(List<TransportMode> transaportModes) {
    _transaportModes = transaportModes;
  }

  List<TransportMode> get gettransaportModes => _transaportModes;

  resettransaportModes() {
    _transaportModes = [];
  }
}
