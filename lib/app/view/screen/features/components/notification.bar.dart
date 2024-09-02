import 'package:flutter/material.dart';

class NotificationComponent extends StatelessWidget {
  const NotificationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          color: const Color.fromARGB(255, 219, 219, 219),
          width: 1,
        ),
      ),
      child: const Center(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Positioned(
              top: 4,
              right: 3,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Colors.blue,
              ),
            ),
            Icon(Icons.notifications_none, color: Color.fromARGB(255, 155, 155, 155),),
          ],
        ),
      ),
    );
  }
}