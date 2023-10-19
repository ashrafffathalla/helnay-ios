import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_res.dart';
import '../../../utils/color_res.dart';
import '../../../utils/const_res.dart';

class BottomSelectedItemBar extends StatelessWidget {
  final VoidCallback onCancelBtnClick;
  final int selectedItemCount;
  final VoidCallback onItemDelete;

  const BottomSelectedItemBar(
      {Key? key,
      required this.onCancelBtnClick,
      required this.selectedItemCount,
      required this.onItemDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 0.5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          margin: const EdgeInsets.only(bottom: 7, right: 10, left: 10),
          width: Get.width,
          decoration: const BoxDecoration(color: ColorRes.white),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: onCancelBtnClick,
                  child:  Text(
                    AppRes.cancel,
                    style: TextStyle(
                        fontSize: 15,
                        color: ColorRes.grey24,
                        fontFamily: FontRes.semiBold),
                  ),
                ),
                const Spacer(),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Text(
                    '$selectedItemCount ',
                    key: ValueKey<int>(selectedItemCount),
                    style: const TextStyle(
                      fontFamily: FontRes.semiBold,
                      fontSize: 15,
                      color: ColorRes.grey24,
                    ),
                  ),
                ),
                const Text(
                  AppRes.selected,
                  style: TextStyle(
                      fontSize: 15,
                      color: ColorRes.grey24,
                      fontFamily: FontRes.semiBold),
                ),
                const Spacer(),
                InkWell(
                  onTap: onItemDelete,
                  child: const Icon(
                    Icons.delete,
                    color: ColorRes.orange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
