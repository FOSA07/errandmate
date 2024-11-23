
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create.pickup.form.g.dart';

@Riverpod(keepAlive: true)
class CreatePickupFormNotifier extends _$CreatePickupFormNotifier {

  final _formkey = GlobalKey<FormState>();
  
  final TextEditingController _packageLocation = TextEditingController();
  final TextEditingController _packageDestination = TextEditingController();
  final TextEditingController _packageDescription = TextEditingController();
  final TextEditingController _distance = TextEditingController();
  final TextEditingController _transportMode = TextEditingController();
  final TextEditingController _receiverContact = TextEditingController();

  @override
  Map<String, dynamic> build () {
    return {
        "package_location": _packageLocation.text,
        "package_destination": _packageDestination.text,
        "package_description": _packageDescription.text,
        "distance" : distanceCotroller.text,
        "transport_mode": transportModeCotroller.text,
        "receiver_contact": "+234${receiverContactCotroller.text}"
    };
  }

  get formKey => _formkey;

  TextEditingController get packageLocationCotroller => _packageLocation;
  TextEditingController get packageDestinationCotroller => _packageDestination;
  TextEditingController get packageDescriptionCotroller => _packageDescription;
  TextEditingController get distanceCotroller => _distance;
  TextEditingController get transportModeCotroller => _transportMode;
  TextEditingController get receiverContactCotroller => _receiverContact;
}