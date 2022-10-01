import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';

class ToastController extends GetxController {
  Widget? toastContent;
  final Color color = Colors.black;
  final BorderRadiusGeometry borderRadius = BorderRadius.circular(30);
  bool isDismissed = false;

  void dismissToast() {
    kDefaultWidth = 110;
    kDefaultHeight = 33;
    toastContent = null;
    update();
  }

  void showToast() {
    kDefaultWidth = Get.width;
    kDefaultHeight = 140;

    Future.delayed(const Duration(milliseconds: 500), () {
      toastContent = Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/poster.jpg",
              height: 110,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Live Concert",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Rock Music",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/images/eqo.png",
            width: Get.width * 0.2,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      );
      update();
    });
    update();

    Future.delayed(const Duration(seconds: 5), () {
      kDefaultWidth = Get.width / 1.5;
      kDefaultHeight = 55;
      toastContent = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: () {
            isDismissed = false;
            Future.delayed(const Duration(milliseconds: 500), () {
              showToast();
            });
            update();
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/images/eqo.png",
                  height: 45,
                  width: Get.width * 0.2,
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "Live Concert",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      update();
    });
  }
}
