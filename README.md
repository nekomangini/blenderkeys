# blender_keys
![Screenshot_20230801_194452](https://github.com/nekomangini/blenderkeys/assets/28682974/ae92129d-519f-4574-be00-53baec93d25e)
![Screenshot_20230801_194419](https://github.com/nekomangini/blenderkeys/assets/28682974/fc60a449-17ff-4485-913d-fd8e9fe48d86)
![Screenshot_20230801_194411](https://github.com/nekomangini/blenderkeys/assets/28682974/b55be693-1808-41cb-b26b-4e798224b570)
![Screenshot_20230801_194408](https://github.com/nekomangini/blenderkeys/assets/28682974/eb7360d0-8831-4be5-967b-765809e12a8f)

shortcut keys for blender

## Getting Started

This project is a project to learn flutter application

### Add this to AndroidManifest.xml

    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

### Change the minSdkVersion in build.gradle

    minSdkVersion 19

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
