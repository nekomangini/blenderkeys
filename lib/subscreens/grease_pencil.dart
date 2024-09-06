import 'package:blenderkeys_v2/components/unity_banner_ad.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:blenderkeys_v2/themes/text_styles.dart';
import 'package:blenderkeys_v2/utils/ad_manager.dart';
import 'package:blenderkeys_v2/utils/unity_ad_utils.dart';
import 'package:flutter/material.dart';

// ################################################################## //
// put the init state in statefulWidget                               //
class GreasePencilBlender extends StatefulWidget {
  const GreasePencilBlender({Key? key}) : super(key: key);

  @override
  State<GreasePencilBlender> createState() => _GreasePencilBlenderState();
}

class _GreasePencilBlenderState extends State<GreasePencilBlender> {
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
    return const GreasePencilAds();
  }
}

// ################################################################## //
class GreasePencilAds extends StatelessWidget {
  const GreasePencilAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ################################################################## //
    // content                                                            //
    final data = [
      {'key': 'Draw Mode', 'function': ''},
      {'key': 'F', 'function': 'Brush Radius'},
      {'key': 'Shift + F', 'function': 'Brush Strength'},
      {'key': 'Y', 'function': 'Change active layer'},
      {'key': 'U', 'function': 'Change active material'},
      {'key': 'Hold Ctrl + Draw', 'function': 'Erase'},
      {'key': 'H', 'function': 'Hide active layer'},
      {'key': 'Shift + H', 'function': 'Hide inactive layers'},
      {'key': 'I', 'function': 'Insert frame'},
      {'key': 'Shift + Ctrl + E', 'function': 'Interpolate sequence'},
      {'key': 'Hold Ctrl + Alt + RMB', 'function': 'Lasso erase'},
      {'key': 'Hold Shift + Draw', 'function': 'Stabilize stroke'},
      {'key': 'Hold Alt + Draw', 'function': 'Straight lines'},
      {'key': 'Alt + H', 'function': 'Unhide everything'},
      {'key': 'Timeline', 'function': ''},
      {'key': 'Shift + D', 'function': 'Duplicate keyframe/s'},
      {'key': 'Shift + Right Arrow Key', 'function': 'End of the timeline'},
      {'key': 'E', 'function': 'Extend'},
      {'key': 'TAB', 'function': 'Lock active layer'},
      {'key': 'Ctrl + M', 'function': 'Mirror'},
      {'key': 'G', 'function': 'Move keyframe/s'},
      {'key': 'Up/Down Arrow Keys', 'function': 'Next keyframe'},
      {'key': 'Shift + R', 'function': 'Repeat last action'},
      {'key': 'S', 'function': 'Scale keyframe/s'},
      {'key': 'Shift + T', 'function': 'Slide'},
      {'key': 'Shift + Left Arrow Key', 'function': 'Start of the timeline'},
      {'key': 'Edit & Object Mode', 'function': ''},
      {'key': 'Y', 'function': 'Change active layer'},
      {'key': '1/2/3', 'function': 'Change selection mode'},
      {'key': 'F', 'function': 'Close strokes'},
      {'key': 'W', 'function': 'Context Menu'},
      {'key': 'Ctrl + C', 'function': 'Copy'},
      {'key': 'X', 'function': 'Delete'},
      {'key': 'Shift + D', 'function': 'Duplicate'},
      {'key': 'Alt + D', 'function': 'Duplicate Linked'},
      {'key': 'E', 'function': 'Extend'},
      {'key': 'Shift + Ctrl + E', 'function': 'Interpolate sequence'},
      {'key': 'Ctrl + J', 'function': 'Join strokes'},
      {'key': 'Ctrl + M', 'function': 'Mirror'},
      {'key': 'M', 'function': 'Move to another layer'},
      {'key': 'Ctrl + V', 'function': 'Paste'},
      {'key': 'O', 'function': 'Proportional edit'},
      {'key': 'Q', 'function': 'Quick favorites'},
      {'key': 'Shift + R', 'function': 'Repeat last action'},
      {'key': 'Shift + G', 'function': 'Select grouped'},
      {'key': 'Ctrl + Numpad-', 'function': 'Select less points'},
      {'key': 'Ctrl + Numpad+', 'function': 'Select more points'},
      {'key': 'P', 'function': 'Separate points'},
      {'key': 'Shift + TAB', 'function': 'Snapping'},
      {'key': 'V', 'function': 'Split strokes'},
      {'key': 'Alt + S', 'function': 'Stroke radius'},
      {'key': 'Sculpt Mode', 'function': ''},
      {'key': 'Hold Ctrl + draw', 'function': 'Reverse direction'},
      {'key': 'Shift + LMB', 'function': 'Smooth'},
      {'key': 'Selection', 'function': ''},
      {'key': 'B', 'function': 'Box select'},
      {'key': 'C', 'function': 'Circle select'},
      {'key': 'Alt + A', 'function': 'De-select all'},
      {'key': 'H', 'function': 'Hide'},
      {'key': 'Shift + H', 'function': 'Hide unselected'},
      {'key': 'Ctrl + I', 'function': 'Invert selection'},
      {'key': 'Ctrl + L', 'function': 'Link/Transfer Data'},
      {'key': 'Shift + L, L', 'function': 'Select Linked'},
      {'key': 'A', 'function': 'Select all'},
      {'key': 'Shift + G', 'function': 'Select group'},
      {'key': 'Alt + H', 'function': 'Unhide'},
      {'key': 'Transform', 'function': ''},
      {'key': 'Ctrl + A', 'function': 'Apply transformation'},
      {'key': 'Alt + G', 'function': 'Clear location'},
      {'key': 'Alt + R', 'function': 'Clear location'},
      {'key': 'Alt + S', 'function': 'Clear scale'},
      {'key': 'R', 'function': 'Rotate'},
      {'key': 'S', 'function': 'Scale'},
      {'key': 'G', 'function': 'Move'},
      {'key': 'Misc', 'function': ''},
      {'key': 'Ctrl + F2', 'function': 'Batch rename object'},
      {'key': 'F2', 'function': 'Rename object'},
      {'key': 'BACKSPACE', 'function': 'Reset menu value'},
      {'key': 'F3', 'function': 'Search'},
      {'key': ' ', 'function': ' '},
    ];
    List<DataRow> rows = data.map((item) {
      return DataRow(
        cells: <DataCell>[
          DataCell(Text(
            item['key']!,
            // Apply the custom text style to the 'key' column
            style: dataRowTextStyle.copyWith(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(
            item['function']!,
            // Apply the custom text style to the 'function' column
            style: dataRowTextStyle,
          )),
        ],
      );
    }).toList();
    // ################################################################## //

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppbarBackgroundColor,
          title: const Text(
            greasePencilStringTitle,
            style: TextStyle(
              color: kAppbarTitleColor,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: kContentBackgroundColor,
        body: SingleChildScrollView(
          // ###################################################################### //
          // When space is not enough, the widget inside can scroll on the spindle. //
          // Use SingleChildScrollView Widget                                       //
          // ###################################################################### //
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
        persistentFooterButtons: const [UnityBannerAdWidget()],
      ),
    );
  }
}
