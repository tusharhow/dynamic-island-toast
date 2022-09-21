import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../controllers/toast_controller.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ToastController>(
          init: ToastController(),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Transform.translate(
                    offset: const Offset(0, 10),
                    child: AnimatedContainer(
                      width: kDefaultWidth,
                      height: kDefaultHeight,
                      decoration: BoxDecoration(
                        color: controller.color,
                        borderRadius: controller.borderRadius,
                      ),
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                      child: Row(
                        children: [
                          Expanded(
                              child:
                                  controller.toastContent ?? const SizedBox.shrink())
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(150, 50)),
                              onPressed: () {
                                controller.showToast();
                                controller.update();
                              },
                              child: const Text(
                                "Popup Toast",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(150, 50)),
                              onPressed: () {
                                controller.isDismissed = true;
                                controller.dismissToast();
                                controller.update();
                              },
                              child: const Text(
                                "Dismiss Toast",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            );
          }),
    );
  }
}
