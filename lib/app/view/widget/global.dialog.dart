import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/serviceLocator/service.locator.dart';

mixin GlobalDialog {

  final _routes = locator<GoRouter>();

  void showAlertDialog({String message = "Oops! an error occured", bool success = false}) {
  showDialog(
    context: _routes.routerDelegate.navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: IntrinsicHeight(
          child: IntrinsicWidth(
            child: Container(
              
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 140, 199, 248),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                
              ),
              
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Column(
                    children: [
                      Icon(Icons.notifications, color: success ? Colors.green : Colors.red,),
                      const SizedBox(height: 15,),
                      Text(message)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Divider(
                    color: Colors.blue,
                      
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      // mainAxisAlignment: MainAxis,
                      children: [
                        const Expanded(
                          child: Center(child: Text('OK',)),
                        ),
                        Container(
                          height: 5,
                          width: 5,
                          color: Colors.blue,
                        ),
                        Expanded(
                          child: Center(child: InkWell(
                            onTap: () => context.pop(),
                            child: const Text('Cancel'))),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
}

// return AlertDialog(
//         title: Text('Session Expired'),
//         content: Text('Your session has expired. Please log in again.'),
//         actions: <Widget>[
//           TextButton(
//             child: Text('OK'),
//             onPressed: () {
              
//             },
//           ),
//         ],
//       );