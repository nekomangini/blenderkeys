import 'package:blenderkeys_v2/components/unity_banner_ad.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:blenderkeys_v2/themes/text_styles.dart';
import 'package:blenderkeys_v2/utils/ad_manager.dart';
import 'package:blenderkeys_v2/utils/unity_ad_utils.dart';
import 'package:flutter/material.dart';

// ################################################################## //
class AnimationBlender extends StatefulWidget {
  const AnimationBlender({super.key});

  @override
  State<AnimationBlender> createState() => _AnimationBlenderState();
}

class _AnimationBlenderState extends State<AnimationBlender> {
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

    _initializeAds();
  }

  // ################################################################## //

  @override
  Widget build(BuildContext context) {
    return const AnimationAds();
  }
}

// ################################################################## //
class AnimationAds extends StatelessWidget {
  const AnimationAds({super.key});

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
      {'key': ' ', 'function': ' '},
    ];
    List<DataRow> rows = data.map((item) {
      return DataRow(
        cells: <DataCell>[
          DataCell(
            Text(
              item['key']!,
              // Apply the custom text style to the 'key' column
              style: dataRowTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          DataCell(
            Text(
              item['function']!,
              // Apply the custom text style to the 'function' column
              style: dataRowTextStyle,
            ),
          ),
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
          // Make the DataTable take up the full width of its parent container using LayoutBuilder,ConstrainedBox widget
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                // ################################################################## //
                // DataTable widget is used instead of custom markdown tables         //
                // markdown loads slowly compared to DataTable widget                 //
                // ################################################################## //
                child: DataTable(
                  // EDIT: Added these properties to make the table more readable
                  // Increased spacing between columns
                  columnSpacing: 70,
                  // Increased row height
                  dataRowMaxHeight: 100,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Key',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: dataColumnFontSize),
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
              );
            },
          ),
        ),
        // ################################################################## //
        // persistentFooterButtons widget is like a footer.                   //
        // bottomSheet widget can also be use.                                //
        // But to the widget needs to be in the bottom on all screen sizes.   //
        // use persistentFooterButtons widget instead                         //
        // ################################################################## //
        bottomNavigationBar: UnityBannerAdWidget(),
        // persistentFooterButtons: const [ UnityBannerAdWidget(), ],
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
