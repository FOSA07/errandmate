import 'package:errandmate/app/utils/constant/app.colors/app.colors.dart';
import 'package:errandmate/app/view/widget/action.button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'component/page.view.image.dart';
import 'component/page.view.indicator.dart';
import 'component/page.view.text.dart';

class OnBoard extends StatelessWidget {
  OnBoard({super.key});

  static final PageController _controller = PageController(
    initialPage: 0
  );
  final ValueNotifier _pageNumberTracker = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [         
          PageView(
            controller: _controller,
            onPageChanged: (value) {
              _pageNumberTracker.value = value;
            },
            children: List.generate(3, (index) => PageViewImage(pageNumber: index + 1),),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.transparent,
                        AppColors.black
                      ],
                      stops: const [0.0, 0.5]
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: _pageNumberTracker,
                          builder: (context, value, child) {
                            return Column(
                              children: [
                                Stack(
                                  children: List.generate(3, (index) => PageViewText(
                                    current: _pageNumberTracker.value == index,
                                    pageNumber: index + 1
                                  )),
                                ),
                                const SizedBox(height: 30,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(3, 
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: PageViewIndicator(
                                        current: _pageNumberTracker.value == index,
                                      ),
                                    ))
                                ),
                              ],
                            );
                          }
                        ),
                        const SizedBox(height: 25,),
                        AppActionButton(
                          text: 'Get Started',
                          // onPressed: () => context.go('/errandmate/auth'),
                          onPressed: () {
                            context.go('/auth');
                          },
                          isLoading: false,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}