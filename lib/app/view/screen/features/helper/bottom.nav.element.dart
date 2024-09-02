import 'package:flutter/material.dart';

import '../../../../utils/constant/app.images/app.images.dart';
import '../home.dart';

enum NavElement {

  home(icon: AppImages.home, name: "Home", widget: Home()),
  errands(icon: AppImages.group, name: "Errands", widget: Home()),
  messaage(icon: AppImages.message, name: "Settings", widget: SizedBox()),
  profile(icon: AppImages.profile, name: "Profile", widget: Home());

  final String icon;
  final String name;
  final Widget widget;

  const NavElement({required this.icon, required this.name, required this.widget});

  static List<NavElement> get value => NavElement.values.toList();

  Map<String, Object> toMap() {
    return {
      'icon': icon,
      'name': name,
      'widget': widget,
    };
  }
  
}