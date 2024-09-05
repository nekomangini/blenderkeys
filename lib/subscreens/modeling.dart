import 'package:blenderkeys_v2/components/unity_banner_ad.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:blenderkeys_v2/utils/ad_manager.dart';
import 'package:blenderkeys_v2/utils/unity_ad_utils.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

// ################################################################## //
// put the init state in statefulWidget                               //
class ModelingBlender extends StatefulWidget {
  const ModelingBlender({Key? key}) : super(key: key);

  @override
  State<ModelingBlender> createState() => _ModelingBlenderState();
}

class _ModelingBlenderState extends State<ModelingBlender> {
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
    return const ModelingAds();
  }
}

// ################################################################## //
class ModelingAds extends StatelessWidget {
  const ModelingAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ################################################################## //
    // content                                                            //
    final data = [
      {'key': 'Edit Mode', 'function': ''},
      {'key': 'Ctrl + B', 'function': 'Add bevel to selection'},
      {'key': 'Ctrl + Shift + B', 'function': 'Add bevel to vertex selection'},
      {
        'key': 'Scroll Wheel After Ctrl + R',
        'function': 'Add loop cut divisions'
      },
      {'key': 'Shift + W', 'function': 'Bend'},
      {'key': 'ESC', 'function': 'Cancel transformation in progress'},
      {'key': 'P', 'function': 'Create separate object out of selection'},
      {'key': '2', 'function': 'Edge mode'},
      {'key': 'TAB', 'function': 'Enter/Exit Edit Mode'},
      {'key': 'E', 'function': 'Extrude geometry'},
      {'key': '3', 'function': 'Face mode'},
      {'key': 'F', 'function': 'Fill face'},
      {'key': 'Alt + V', 'function': 'Fill rip'},
      {'key': 'I', 'function': 'Inset faces to selection'},
      {'key': 'Ctrl + Shift + N', 'function': 'Invert normals'},
      {'key': 'J', 'function': 'Join Selected Vertices'},
      {'key': 'K', 'function': 'Knife'},
      {'key': 'Ctrl + R', 'function': 'Loop cut'},
      {'key': 'M', 'function': 'Merge selection'},
      {'key': 'O', 'function': 'Proportional editing'},
      {'key': 'Shift + N', 'function': 'Recalculate normals'},
      {'key': 'V', 'function': 'Rip geometry'},
      {'key': 'Ctrl + L, L', 'function': 'Select connected geometry'},
      {'key': 'Y', 'function': 'Split geometry'},
      {
        'key': 'Shift + O',
        'function': 'Toggle through proportional editing falloff profiles'
      },
      {'key': 'G + G', 'function': 'Vertex and Edge slide'},
      {'key': '1', 'function': 'Vertex mode'}
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
            modelingStringTitle,
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
        persistentFooterButtons: const [
          SizedBox(height: 50.0),
          UnityBannerAdWidget()
        ],
        // ################################################################## //
        // persistentFooterButtons widget is like a footer.                   //
        // bottomSheet widget can also be use.                                //
        // But to the widget needs to be in the bottom on all screen sizes.   //
        // use persistentFooterButtons widget instead                         //
        // ################################################################## //
      ),
    );
  }
}
