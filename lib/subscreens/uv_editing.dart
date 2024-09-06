import 'package:blenderkeys_v2/components/unity_banner_ad.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:blenderkeys_v2/themes/text_styles.dart';
import 'package:blenderkeys_v2/utils/ad_manager.dart';
import 'package:blenderkeys_v2/utils/unity_ad_utils.dart';
import 'package:flutter/material.dart';

// ################################################################## //
// put the init state in statefulWidget                               //
class UvEditBlender extends StatefulWidget {
  const UvEditBlender({Key? key}) : super(key: key);

  @override
  State<UvEditBlender> createState() => _UvEditBlenderState();
}

class _UvEditBlenderState extends State<UvEditBlender> {
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
    return const UvEditAds();
  }
}

// ################################################################## //
class UvEditAds extends StatelessWidget {
  const UvEditAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ################################################################## //
    // content                                                            //
    final data = [
      {'key': 'U', 'function': 'Unwrap'},
      {'key': 'Ctrl + E', 'function': 'Mark seam'},
      {'key': 'UV Editor', 'function': ''},
      {'key': 'Ctrl + L', 'function': 'Select island'},
      {'key': 'Alt + V', 'function': 'Stitch'},
      {'key': 'Shift + W', 'function': 'Align(menu)'},
      {'key': 'P', 'function': 'Pin'},
      {'key': 'Alt + P', 'function': 'Unpin'},
      {'key': 'Shift + P', 'function': 'Select pin'},
      {'key': 'H', 'function': 'Hide selected'},
      {'key': 'Alt + H', 'function': 'Reveal hidden'},
      {'key': 'Shift + H', 'function': 'Hide unselected'},
      {'key': 'M', 'function': 'Merge(menu)'},
      {'key': 'Ctrl + M', 'function': 'Mirror/Flip'},
      {'key': 'Alt + M', 'function': 'Split'},
      {'key': 'W', 'function': 'UV context menu'},
      {'key': 'Alt + R', 'function': 'Reload'},
      {'key': 'Y', 'function': 'Select split'},
      {'key': 'Image Editor', 'function': ''},
      {'key': 'Num1', 'function': 'View at 100%'},
      {'key': 'Shift + HOME', 'function': 'View to fit'},
      {'key': 'Alt + O', 'function': 'Open Image'},
      {'key': 'Alt + N', 'function': 'New image'},
      {'key': 'Alt + S', 'function': 'Save image'},
      {'key': 'Shift + Alt + S', 'function': 'Save image as'},
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
            uvEditStringTitle,
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
        // persistentFooterButtons: const [UnityBannerAdWidget()],
      ),
    );
  }
}
