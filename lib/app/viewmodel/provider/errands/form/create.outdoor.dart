import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create.outdoor.g.dart';

@Riverpod(keepAlive: true)
class CreateOutdoorFormNotifier extends _$CreateOutdoorFormNotifier {

  final _formkey = GlobalKey<FormState>();
  
  final TextEditingController _senderLocation = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _type = TextEditingController();
  final TextEditingController _budget = TextEditingController();

  @override
  Map<String, dynamic> build () {
    double? figure = double.tryParse(budgetCotroller.text.toString());
    return {
      "sender_location": senderLocationCotroller.text,
      "location": locationCotroller.text,
      "type": typeCotroller.text,
      "description": descriptionCotroller.text,
      "budget": figure
    };
  }

  get formKey => _formkey;

  TextEditingController get senderLocationCotroller => _senderLocation;
  TextEditingController get locationCotroller => _location;
  TextEditingController get descriptionCotroller => _description;
  TextEditingController get typeCotroller => _type;
  TextEditingController get budgetCotroller => _budget;
}
