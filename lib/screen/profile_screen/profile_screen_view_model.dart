import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_res.dart';
import '../../../utils/asset_res.dart';
import '../../../utils/color_res.dart';
import '../../../utils/const_res.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api_provider/api_provider.dart';
import '../../common/widgets/snack_bar_widget.dart';
import '../../model/user/registration_user.dart';
import '../edit_profile_screen/edit_profile_screen.dart';
import '../notification_screen/notification_screen.dart';
import '../options_screen/options_screen.dart';
import '../search_screen/search_screen.dart';
import '../user_detail_screen/user_detail_screen.dart';

class ProfileScreenViewModel extends BaseViewModel {
  RegistrationUserData? userData;
  bool isLoading = false;
  int currentImageIndex = 0;
  late PageController pageController;

  void init() {
    pageController = PageController(initialPage: 0, viewportFraction: 1.01)
      ..addListener(() {
        onMainImageChange();
      });
    profileScreenApiCall();
    // getDataFromPrefs();
  }

  void profileScreenApiCall() async {
    isLoading = true;
    ApiProvider().getProfile(userID: ConstRes.aUserId).then((value) {
      userData = value?.data;
      isLoading = false;
      notifyListeners();
    });
  }

  void onEditProfileTap() {
    userData?.isBlock == 1
        ? SnackBarWidget().snackBarWidget(AppRes.userBlock)
        : Get.to(() => const EditProfileScreen())?.then((value) {
            profileScreenApiCall();
            notifyListeners();
          });
  }

  void _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch ';
  }

  bool isSocialBtnVisible(String? socialLink) {
    if (socialLink != null) {
      return socialLink.contains("http://") || socialLink.contains("https://");
    } else {
      return false;
    }
  }

  void onInstagramTap() {
    userData?.isBlock == 1
        ? SnackBarWidget().snackBarWidget(AppRes.userBlock)
        : _launchUrl(userData?.instagram ?? '');
  }

  void onFBTap() {
    userData?.isBlock == 1
        ? SnackBarWidget().snackBarWidget(AppRes.userBlock)
        : _launchUrl(userData?.facebook ?? '');
  }

  void onYoutubeTap() {
    userData?.isBlock == 1
        ? SnackBarWidget().snackBarWidget(AppRes.userBlock)
        : _launchUrl(userData?.youtube ?? '');
  }

  void onSearchBtnTap() {
    userData?.isBlock == 1
        ? SnackBarWidget().snackBarWidget(AppRes.userBlock)
        : Get.to(() => const SearchScreen());
  }

  void onMainImageChange() {
    if (pageController.page!.round() != currentImageIndex) {
      currentImageIndex = pageController.page!.round();
      notifyListeners();
    }
  }

  void onNotificationTap() {
    userData?.isBlock == 1
        ? SnackBarWidget().snackBarWidget(AppRes.userBlock)
        : Get.to(() => const NotificationScreen());
  }

  void onImageTap() {
    userData?.isBlock == 1
        ? SnackBarWidget().snackBarWidget(AppRes.userBlock)
        : Get.to(() => const UserDetailScreen(), arguments: userData);
  }

  void onMoreBtnTap() {
    Get.to(() => const OptionScreen());
  }
}
