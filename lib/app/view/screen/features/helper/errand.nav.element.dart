import 'package:flutter/material.dart';

import '../errands/indoor.errand.dart';
import '../errands/laundry.errand.dart';
import '../errands/outdoor.errand.dart';
import '../errands/pickup.errand.dart';

enum ErrandNavElement {
  pickup(text: 'pickup', widget: PickupErrands()),
  laundary(text: 'laundry', widget: LaundryErrands()),
  indoor(text: 'indoor', widget: IndoorErrands()),
  outdoor(text: 'outdoor', widget: OutdoorErrands());

  final Widget widget;
  final String text;

  const ErrandNavElement({required this.widget, required this.text});

  static List<ErrandNavElement> get value => ErrandNavElement.values.toList();

}