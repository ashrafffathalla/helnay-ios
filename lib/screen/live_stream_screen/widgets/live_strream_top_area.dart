import 'package:flutter/material.dart';
import 'package:project/utils/const_res.dart';
import '../../../utils/app_res.dart';
import '../../../utils/asset_res.dart';
import '../../../utils/color_res.dart';

class LiveStreamTopArea extends StatelessWidget {
  final VoidCallback onBackBtnTap;

  const LiveStreamTopArea({Key? key, required this.onBackBtnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 45, 18, 18),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                AppRes.liveStreamCap,
                style: TextStyle(fontSize: 17),
              ),
              Text(
                AppRes.application,
                style: TextStyle(
                  fontSize: 17,
                  color: ColorRes.black,
                  fontFamily: FontRes.bold,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: onBackBtnTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 37,
              width: 37,
              padding: const EdgeInsets.only(right: 3),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetRes.backButton),
                ),
              ),
              child: Center(
                child: Image.asset(
                  AssetRes.backArrow,
                  height: 14,
                  width: 7,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
