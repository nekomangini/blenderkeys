import 'package:blender_keys/strings/content_strings.dart';
import 'package:blender_keys/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

// ################################################################## //
class AnimationBlender extends StatefulWidget {
  const AnimationBlender({Key? key}) : super(key: key);

  @override
  State<AnimationBlender> createState() => _AnimationBlenderState();
}

class _AnimationBlenderState extends State<AnimationBlender> {
  // ################################################################## //
  // load unity ads                                                     //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UnityAds.init(
      gameId: '5127816', // 5127816
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
    return const AnimationAds();
  }
}

// ################################################################## //
class AnimationAds extends StatelessWidget {
  const AnimationAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ################################################################## //
    // content                                                            //
    final data = [
      {'key': 'ANIMATION GENERAL', 'function': ' '},
      {'key': 'SHIFT + LEFT/RIGHT ARROW', 'function': 'First/Last Frame'},
      {'key': 'UP/DOWN ARROW', 'function': 'Jump to Frame'},
      {'key': 'LEFT/Right ARROW', 'function': 'Next/Previous Frames'},
      {'key': 'SPACE', 'function': 'Play/Pause Playback'},
      {'key': 'CTRL + SHIFT + SPACE', 'function': 'Reverse Play'},
      {'key': 'ALT + MMB', 'function': 'Scroll Through Frames'},
      {'key': 'ANIMATION DOPESHEET', 'function': ' '},
      {'key': 'M', 'function': 'Add Marker'},
      {'key': 'CTRL + ALT + P', 'function': 'Auto Set Preview Range'},
      {
        'key': 'CTRL + B',
        'function': 'Bind Selected Camera to Selected Marker'
      },
      {'key': 'B', 'function': 'Border Box Select'},
      {'key': 'ALT + P', 'function': 'Clear Preview'},
      {'key': 'Ctrl + C', 'function': 'Copy Keyframe'},
      {'key': 'NumPad -', 'function': 'Decrease Timeline Length(Zoom out)'},
      {'key': 'X', 'function': 'Delete'},
      {'key': 'Shift + A', 'function': 'Deselect'},
      {'key': 'Shift + D', 'function': 'Duplicate Keyframe'},
      {'key': 'NumPad +', 'function': 'Increase Timeline Length(Zoom)'},
      {'key': 'I', 'function': 'Insert Keyframe'},
      {'key': 'Ctrl + I', 'function': 'Invert Selection'},
      {'key': 'CTRL + M', 'function': 'Mirror Keyframes'},
      {'key': 'Ctrl + V', 'function': 'Paste Keyframe'},
      {'key': 'A', 'function': 'Select All'},
      {'key': 'SHIFT + E', 'function': 'Set Keyframe Extrapolation'},
      {'key': 'T', 'function': 'Set Keyframe Interpolation'},
      {'key': 'V', 'function': 'Set Keyframe Handle Type'},
      {'key': 'P + LMB (hold and drag)', 'function': 'Set Preview Range'},
      {'key': 'Shift + S', 'function': 'Snap'},
      {'key': 'CTRL + TAB', 'function': 'Toggle Dopesheet/Graph Editor'},
      {'key': 'CTRL + T', 'function': 'Toggle Frames/Seconds'},
      {'key': 'HOME', 'function': 'Zoom to Fit Active Keyframes'},
      {'key': 'GRAPH EDITOR', 'function': ' '},
      {'key': 'RMB', 'function': 'F-Curve Context Menu'},
      {'key': 'TAB', 'function': 'Lock Selected Channel'},
      {'key': 'N', 'function': 'Properties And Modifiers'},
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
            animationStringTitle,
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
          Center(
            child: UnityBannerAd(
              placementId: 'Banner_Android',
            ),
          ),
        ],
      ),
    );
  }
}

// ################################################################## //
// unused code                                                        //
//                                                                    //
// Markdown(                                                          //
// // to prevent Exception caught by gesture set shrinkwrap to false  //
// shrinkWrap: false,                                                 //
// // make text selectable                                            //
// selectable: true,                                                  //
// padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),                //
// data: animationKeys,                                               //
// // to edit markdown styling                                        //
// styleSheet: MarkdownStyleSheet(                                    //
// h1: const TextStyle(                                               //
// fontSize: 30.0, fontWeight: FontWeight.bold),                      //
// h1Align: WrapAlignment.center),                                    //
// ),                                                                 //
// ################################################################## //
