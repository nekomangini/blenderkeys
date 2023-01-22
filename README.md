# blender_keys

shortcut keys for blender

## Getting Started

This project is a to learn flutter application

### Add this to AndroidManifest.xml

uses-permission android:name="android.permission.INTERNET"
uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" 


### This code snippet show ads after 5 seconds upon opening a widget/activity


    bool _adShown = false;

    @override
    void initState() {
    // TODO: implement initState
    super.initState();

    UnityAds.init(
              gameId: '5127816',
              testMode: false,
              onComplete: () {
                print('init successful');
                // show ad 5 seconds after the widget is opened
                Timer(const Duration(seconds: 5), _showInterstitialAd);
              },
              onFailed: (error, message) => print('init failed $error $message'),
        );
        UnityBannerAd;
    }

    void _showInterstitialAd() {
        if (!_adShown) {
              UnityAds.load(placementId: 'Interstitial_Android').then((_) {
                    Future.delayed(Duration(seconds: 5), () {
                          UnityAds.showVideoAd(
                              placementId: 'Interstitial_Android',
                              onComplete: (String placementId) {
                                    print('Interstitial ad closed.');
                                    setState(() {
                                      _adShown = true;
                                    });
                              });
                    });
              });
        }
    }
