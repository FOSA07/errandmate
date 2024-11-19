import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/controller/wallet/deposit.dart';
import '../../../view/miscellaneous/global.dialog.dart';

part 'deposit.g.dart';

@Riverpod(keepAlive: true)
class DepositNotifier extends _$DepositNotifier with GlobalDialog{

  Future pay ({
    required String amount,
  }) async {

    try{

      state = const AsyncLoading();
      final initiatePayment = await DepositController().initializePayment(amount: amount);

      initiatePayment.fold(
        (failure) {
          state = AsyncValue.error(failure, StackTrace.current);
          showAlertDialog(
            // message: "Payment failed!",
            message: failure.message,
          );
        }, 
        (success) async {
          final pay = await DepositController().makePayment(amount: amount, id: success.data["data"]["id"]);

          pay.fold(
            (failure){
              state = AsyncValue.error(failure, StackTrace.current);
              showAlertDialog(
                // message: "Payment failed!",
                message: failure.message,
              );
            },
            (chargeResponse) async {
              if (chargeResponse.success!) {
                // Payment successful
                print("Payment successful! Transaction ref: ${chargeResponse.txRef}");
                final validate = await DepositController().validatePayment(chargeResponse.txRef!);

                state = AsyncValue.data(validate);

                validate.fold(
                  (failure) => showAlertDialog(
                    // message: "Payment failed!",
                    message: failure.message,
                  ),
                  (success) => showAlertDialog(
                    message: 'Payment successful!',
                    success: true,
                    // buttonText: 'Proceed',
                    // onClose: () => goto('/features'),
                  )
                );
                
              } else {
                // Payment failed
                print("Payment failed!");
                state = AsyncValue.data("Payment failure");
                showAlertDialog(
                  message: "Payment failed!",
                );
              }
            }
          );
        });
      
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      showAlertDialog(
        message: "Payment failed!",
      );
    }
  }

  @override
  FutureOr build () => state;
}