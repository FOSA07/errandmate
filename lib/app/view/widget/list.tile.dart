import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  final String iconPath, title, subtitle;
  final Widget? trailingWidget;
  const AppListTile({super.key, 
    required this.iconPath, 
    required this.title, 
    required this.subtitle,
    this.trailingWidget
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const CircleAvatar(),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)
      ),
      subtitle: Text(
        subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyMedium
      ),
      trailing: trailingWidget ?? const Icon(Icons.arrow_forward_ios, size: 20,),
    );
  }
}