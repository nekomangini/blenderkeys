import 'package:blenderkeys_v2/components/unity_banner_ad.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:blenderkeys_v2/utils/ad_manager.dart';
import 'package:blenderkeys_v2/utils/unity_ad_utils.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

// ################################################################## //
// put the init state in statefulWidget                               //
class RiggingBlender extends StatefulWidget {
  const RiggingBlender({Key? key}) : super(key: key);

  @override
  State<RiggingBlender> createState() => _RiggingBlenderState();
}

class _RiggingBlenderState extends State<RiggingBlender> {
  // ################################################################## //
  // load unity ads                                                     //
  final Map<String, bool> _adPlacements = {
    AdManager.interstitialVideoAdPlacementId: true,
    AdManager.rewardedVideoAdPlacementId: true,
  };

  void _initializeAds() {
    AdManager.initializeAds(
      onComplete: () {
        print('Initialization Complete');
        loadAds(_adPlacements, setState);
      },
      onFailed: (error, message) =>
          print('Initialization Failed: $error $message'),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UnityAds.init(
      gameId: '5127816',
      testMode: false,
      onComplete: () {
        print('init successful');
      },
      onFailed: (error, message) => print('init failed $error $message'),
    );
  }

  // ################################################################## //

  @override
  Widget build(BuildContext context) {
    return const RiggingAds();
  }
}

// ################################################################## //
class RiggingAds extends StatelessWidget {
  const RiggingAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ################################################################## //
    // content                                                            //
    final data = [
      {'key': 'Rigging(Armatures)', 'function': ''},
      {'key': 'E', 'function': 'Add a new bone'},
      {'key': 'Shift + D', 'function': 'Duplicate bone'},
      {'key': 'Shift + W', 'function': 'Bone settings'},
      {'key': 'Ctrl + R', 'function': 'Roll'},
      {'key': 'Alt + R', 'function': 'Clear roll'},
      {'key': 'Shift + N', 'function': 'Recalculate roll'},
      {'key': 'Ctrl + Alt + A', 'function': 'Align roll'},
      {'key': 'Alt + F', 'function': 'Switch bone direction'},
      {'key': 'Alt + M', 'function': 'Merge bones'},
      {'key': 'Ctrl + X', 'function': 'Dissolve bones'},
      {'key': 'Y', 'function': 'Split'},
      {'key': 'P', 'function': 'Separate'},
      {'key': '] and [', 'function': 'Scroll hierarchy'},
      {'key': 'Pose Mode', 'function': ''},
      {'key': 'I', 'function': 'Add keyframe'},
      {'key': 'Alt + G', 'function': 'Clear location'},
      {'key': 'Alt + R', 'function': 'Clear rotation'},
      {'key': 'Alt + S', 'function': 'Clear scale'},
      {'key': 'Ctrl + A', 'function': 'Apply pose'},
      {'key': 'Alt + P', 'function': 'Propagate pose'},
      {'key': 'Ctrl + E', 'function': 'Push pose from breakdown'},
      {'key': 'Alt + E', 'function': 'Relax pose to breakdown'},
      {'key': 'Shift + E', 'function': 'Pose breakdowner tool'},
      {'key': 'Ctrl + C', 'function': 'Copy pose'}
    ];
    List<DataRow> rows = data.map((item) {
      return DataRow(
        cells: <DataCell>[
          DataCell(Text(item['key']!)),
          DataCell(Text(item['function']!)),
        ],
      );
    }).toList();
    // ################################################################## //

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppbarBackgroundColor,
          title: const Text(
            riggingStringTitle,
            style: TextStyle(
              color: kAppbarTitleColor,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: kContentBackgroundColor,
        // ###################################################################### //
        // When space is not enough, the widget inside can scroll on the spindle. //
        // Use SingleChildScrollView Widget                                       //
        // ###################################################################### //
        body: SingleChildScrollView(
          child: Center(
            // ################################################################## //
            // DataTable widget is used instead of custom markdown tables         //
            // markdown loads slowly compared to DataTable widget                 //
            // ################################################################## //
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Key',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Function',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
              // ################################################################## //
              // show the content                                                   //
              // ################################################################## //
              rows: rows,
            ),
          ),
        ),
        // ################################################################## //
        // persistentFooterButtons widget is like a footer.                   //
        // bottomSheet widget can also be use.                                //
        // But to the widget needs to be in the bottom on all screen sizes.   //
        // use persistentFooterButtons widget instead                         //
        // ################################################################## //
        persistentFooterButtons: const [
          SizedBox(height: 50.0),
          UnityBannerAdWidget()
        ],
      ),
    );
  }
}
