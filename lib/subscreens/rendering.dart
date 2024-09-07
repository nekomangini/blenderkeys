import 'package:blenderkeys_v2/components/unity_banner_ad.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:blenderkeys_v2/themes/text_styles.dart';
import 'package:blenderkeys_v2/utils/ad_manager.dart';
import 'package:blenderkeys_v2/utils/unity_ad_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RenderingBlender extends StatefulWidget {
  const RenderingBlender({super.key});

  @override
  State<RenderingBlender> createState() => _RenderingBlenderState();
}

class _RenderingBlenderState extends State<RenderingBlender> {
  // ################################################################## //
  // load unity ads                                                     //
  // ################################################################## //
  final Map<String, bool> _adPlacements = {
    AdManager.interstitialVideoAdPlacementId: true,
    AdManager.rewardedVideoAdPlacementId: true,
  };

  void _initializeAds() {
    AdManager.initializeAds(
      onComplete: () {
        if (kDebugMode) {
          print('Initialization Complete');
        }
        loadAds(_adPlacements, setState);
      },
      onFailed: (error, message) {
        if (kDebugMode) {
          print('Initialization Failed: $error $message');
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _initializeAds();
  }

  @override
  Widget build(BuildContext context) {
    return const RenderingAds();
  }
}

class RenderingAds extends StatelessWidget {
  const RenderingAds({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'key': 'F12', 'function': 'Render'},
      {'key': 'Ctrl + F12', 'function': 'Render animation'},
      {'key': 'Ctrl + F11', 'function': 'Playback rendered animation'},
      {'key': 'Ctrl + B', 'function': 'Set render region'},
      {'key': 'Ctrl + Alt + B', 'function': 'Clear render region'},
      {'key': 'J', 'function': 'Next render slot'},
      {'key': 'Alt + J', 'function': 'Previous render slot'},
      {'key': '1-8', 'function': 'Select render slot'},
      {'key': ' ', 'function': ' '},
    ];
    List<DataRow> rows = data.map((item) {
      return DataRow(
        cells: <DataCell>[
          DataCell(Text(
            item['key']!,
            style: dataRowTextStyle.copyWith(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(
            item['function']!,
            style: dataRowTextStyle,
          )),
        ],
      );
    }).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppbarBackgroundColor,
          title: const Text(
            renderingStringTitle,
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
          // ################################################################## //
          // Make the DataTable take up the full width of its parent container  //
          // using LayoutBuilder,ConstrainedBox widget                          //
          // ################################################################## //
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                // ################################################################## //
                // DataTable widget is used instead of custom markdown tables         //
                // markdown loads slowly compared to DataTable widget                 //
                // ################################################################## //
                child: DataTable(
                  // ################################################################## //
                  // EDIT: Added these properties to make the table more readable       //
                  // Increased spacing between columns:     columnSpacing               //
                  // Increased row height:                  dataRowMaxHeight            //
                  // ################################################################## //
                  columnSpacing: 70,
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
                  // show the content                                                   //
                  rows: rows,
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: const UnityBannerAdWidget(),
      ),
    );
  }
}
