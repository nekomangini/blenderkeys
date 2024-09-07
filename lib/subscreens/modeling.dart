import 'package:blenderkeys_v2/components/unity_banner_ad.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:blenderkeys_v2/themes/text_styles.dart';
import 'package:blenderkeys_v2/utils/ad_manager.dart';
import 'package:blenderkeys_v2/utils/unity_ad_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ModelingBlender extends StatefulWidget {
  const ModelingBlender({super.key});

  @override
  State<ModelingBlender> createState() => _ModelingBlenderState();
}

class _ModelingBlenderState extends State<ModelingBlender> {
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
    return const ModelingAds();
  }
}

class ModelingAds extends StatelessWidget {
  const ModelingAds({super.key});

  @override
  Widget build(BuildContext context) {
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
      {'key': '1', 'function': 'Vertex mode'},
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
