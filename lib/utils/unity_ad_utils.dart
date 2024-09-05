import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

// Load all ads specified in the placements map
void loadAds(Map<String, bool> placements, StateSetter setState) {
  for (var placementId in placements.keys) {
    _loadAd(placementId, placements, setState);
  }
}

// Load a specific ad by its placement ID
void _loadAd(
    String placementId, Map<String, bool> placements, StateSetter setState) {
  UnityAds.load(
    placementId: placementId,
    onComplete: (placementId) {
      print('Load Complete $placementId');
      setState(() {
        placements[placementId] = true; // Mark ad as loaded
      });
    },
    onFailed: (placementId, error, message) =>
        print('Load Failed $placementId: $error $message'),
  );
}

// Show a specific ad by its placement ID
void showAd(
    String placementId, Map<String, bool> placements, StateSetter setState) {
  setState(() {
    placements[placementId] = false; // Mark ad as not loaded
  });
  UnityAds.showVideoAd(
    placementId: placementId,
    onComplete: (placementId) {
      print('Video Ad $placementId completed');
      _loadAd(
          placementId, placements, setState); // Reload the ad after showing it
    },
    onFailed: (placementId, error, message) {
      print('Video Ad $placementId failed: $error $message');
      _loadAd(placementId, placements, setState); // Reload the ad if it fails
    },
    onStart: (placementId) => print('Video Ad $placementId started'),
    onClick: (placementId) => print('Video Ad $placementId click'),
    onSkipped: (placementId) {
      print('Video Ad $placementId skipped');
      _loadAd(
          placementId, placements, setState); // Reload the ad if it's skipped
    },
  );
}