import 'package:blenderkeys_v2/components/unity_banner_ad.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:blenderkeys_v2/themes/text_styles.dart';
import 'package:blenderkeys_v2/utils/ad_manager.dart';
import 'package:blenderkeys_v2/utils/unity_ad_utils.dart';
import 'package:flutter/material.dart';

// ################################################################## //
// put the init state in statefulWidget                               //
class SculptingBlender extends StatefulWidget {
  const SculptingBlender({Key? key}) : super(key: key);

  @override
  State<SculptingBlender> createState() => _SculptingBlenderState();
}

class _SculptingBlenderState extends State<SculptingBlender> {
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
    return const SculptingAds();
  }
}

// ################################################################## //
class SculptingAds extends StatelessWidget {
  const SculptingAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ################################################################## //
    // content                                                            //
    final data = [
      {'key': 'Shift + SPACE', 'function': 'Brush selection'},
      {'key': 'F', 'function': 'Brush size'},
      {'key': 'Shift + F', 'function': 'Brush strength'},
      {'key': 'Ctrl + F', 'function': 'Brush angle'},
      {'key': 'E', 'function': 'Stroke method'},
      {'key': 'B', 'function': 'Mask'},
      {'key': 'M', 'function': 'Mask brush'},
      {'key': 'Alt + M', 'function': 'Clear mask'},
      {'key': 'Ctrl + I', 'function': 'Invert mask'},
      {'key': 'H', 'function': 'Face Sets Visibility'},
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
            sculptingStringTitle,
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
        persistentFooterButtons: const [UnityBannerAdWidget()],
      ),
    );
  }
}
