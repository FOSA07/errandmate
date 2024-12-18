import 'package:dartz/dartz.dart';

import 'package:dio/src/response.dart';

import 'package:errandmate/app/core/exception/exception.dart';
import 'package:flutterwave_standard_smart/flutterwave.dart';
import 'package:go_router/go_router.dart';

import '../../../../network/dio/dio.client.dart';
import '../../../../utils/serviceLocator/service.locator.dart';
import '../wallet.dart';

class DepositService extends Wallet {
  
  @override
  Future<Either<Failure, Response>> initializePayment(String amount) async {
    
    try{
      var response = await DioClient().post(
        '/payments/initiate',
        data: {"amount": amount},
      );

      return response;

    } catch (e) {
      return Left(Failure("An error occured", exception: e));
    }
  }

  @override
  Future<Either<Failure, Response>> validatePayment(String ref) async {
    try{
      var response = await DioClient().post(
        '/payments/initiate',
        data: {"ref": ref},
      );

      return response;

    } catch (e) {
      return Left(Failure("An error occured", exception: e));
    }
  }

  @override
  Future<Either<Failure, ChargeResponse>> makePayment({required String amount, required String id}) async {
    try{
      final Flutterwave flutterwave = Flutterwave(
        context: locator<GoRouter>().routerDelegate.navigatorKey.currentContext!,
        publicKey: "FLWPUBK_TEST-a0d57e5ac717e5498f3cf0955db62a8a-X",
        txRef: id, 
        amount: amount, 
        customer: Customer(
          email: "faletioluwaseyisam@gmail.com",
          name: "John",
          phoneNumber: ""
        ), 
        paymentOptions: "card, payattitude, barter, bank transfer, ussd", 
        customization: Customization(
          title: "Errandmate",
          description: "",
          logo: ""
        ), 
        redirectUrl: "facebook.com", 
        isTestMode: true, 
        currency: "NGN"
      );

      final ChargeResponse response = await flutterwave.charge();

      if (response.success!) {
        // Payment successful
        return Right(response);
      } else {
        // Payment failed
        return Left(Failure("Payment failed!"));
      }
    } catch (e) {
      return Left(Failure("An error occured", exception: e));
    }
  }
}