import 'package:flutter/foundation.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class AdManager {
  // Get the game ID based on the platform
  static String get gameId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return '5691646'; // Replace with your actual Android game ID
      // return '5676107'; // Replace with your actual Android game ID
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return '5691647'; // Replace with your actual iOS game ID
      // return '5676106'; // Replace with your actual iOS game ID
    }
    return '';
  }

  // Banner ad placement ID
  static String get bannerAdPlacementId {
    return 'Banner_Android'; // Replace with your actual banner ad placement ID
  }

  // Interstitial video ad placement ID
  static String get interstitialVideoAdPlacementId {
    return 'Interstitial_Android'; // Replace with your actual interstitial ad placement ID
  }

  // Rewarded video ad placement ID
  static String get rewardedVideoAdPlacementId {
    return 'Rewarded_Android'; // Replace with your actual rewarded ad placement ID
  }

  // Initialize Unity Ads with the given callbacks
  static void initializeAds({
    required Function onComplete,
    required Function(UnityAdsInitializationError, String) onFailed,
  }) {
    UnityAds.init(
      gameId: gameId,
      testMode: true, // Set to false for production
      onComplete: onComplete,
      onFailed: onFailed,
    );
  }
}
