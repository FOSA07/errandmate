import 'package:flutter/material.dart';

import '../../../../utils/constant/app.colors/app.colors.dart';

class AvailableErrandContainer extends StatelessWidget {
  final String errandStatus, position, date, price;
  const AvailableErrandContainer({super.key, 
    required this.errandStatus, 
    required this.position, 
    required this.date, 
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 237, 236, 236),
          width: 1,
          
        ),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: const CircleAvatar(),
            title: Text(
              errandStatus,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)
            ),
            subtitle: Text(
              position,
              style: Theme.of(context).textTheme.bodyMedium
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 237, 236, 236),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          date,
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '#$price',
                        style: Theme.of(context).textTheme.bodyMedium
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}