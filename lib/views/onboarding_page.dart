import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen_with_getx/controllers/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatelessWidget {
   OnboardingPage({super.key});
   final _controller=OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onboardingPages.length,
                itemBuilder: (context,index){
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset(_controller.onboardingPages[index].imageAsset),
                  SizedBox(height: 32,),
                  Text(_controller.onboardingPages[index].title,style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height: 32,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: Text(_controller.onboardingPages[index].description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 18,
                    ),),
                  ),
                ],),
              );
            }),
          /*second portion start here*/
            Positioned(
              left: 20,
              bottom: 20,
              child: Row(children:List.generate(_controller.onboardingPages.length, (index) =>Obx(() =>
                  Container(
                    height: 12,
                    width: 12,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: _controller.selectedPageIndex.value==index?Colors.red:
                    Colors.grey
                        ,shape: BoxShape.circle),
                  ), ),
              ),
              ),
            ),
            /*second portion end here*/
            /*third portion start here*/
            Positioned(
              right: 20,
              bottom: 20,
              child:FloatingActionButton(
                onPressed: _controller.forwardAction,
                elevation: 0,
                child:
                    Obx(() =>
                Text(_controller.isLastPage?'Start':'Next'),),
              ),),
            /*third portion end here*/
          ],
        ),
      ),
    );
  }
}
