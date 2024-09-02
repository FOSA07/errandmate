import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notification.bar.dart';

class HomeAppBar extends ConsumerWidget {
  final String name;
  const HomeAppBar(this.name, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color.fromARGB(255, 208, 230, 249),
        ),
      ),
      title: Text(
        'Welcome Back',
        style: Theme.of(context).textTheme.displayMedium,
      ),
      subtitle: Text(
        name,
        
      ),
      trailing: const NotificationComponent()
    );
  }
}