import 'package:blenderkeys_v2/utils/ad_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class UnityBannerAdWidget extends StatelessWidget {
  const UnityBannerAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      // Adjust the height as per your needs
      height: 0,
      // width: double.infinity, // removed: changed into bottomNavigationBar widget
      child: UnityBannerAd(
        placementId: AdManager.bannerAdPlacementId,
        onLoad: (placementId) {
          if (kDebugMode) {
            print('Banner loaded: $placementId');
          }
        },
        onClick: (placementId) {
          if (kDebugMode) {
            print('Banner clicked: $placementId');
          }
        },
        onShown: (placementId) {
          if (kDebugMode) {
            print('Banner shown: $placementId');
          }
        },
        onFailed: (placementId, error, message) {
          if (kDebugMode) {
            print('Banner Ad $placementId failed: $error $message');
          }
        },
      ),
    );
  }
}
