import 'package:blenderkeys_v2/components/unity_banner_ad.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:blenderkeys_v2/themes/text_styles.dart';
import 'package:blenderkeys_v2/utils/ad_manager.dart';
import 'package:blenderkeys_v2/utils/unity_ad_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShadingBlender extends StatefulWidget {
  const ShadingBlender({super.key});

  @override
  State<ShadingBlender> createState() => _ShadingBlenderState();
}

class _ShadingBlenderState extends State<ShadingBlender> {
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
    return const ShadingAds();
  }
}

class ShadingAds extends StatelessWidget {
  const ShadingAds({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'key': 'Nodes', 'function': ''},
      {'key': 'Ctrl + RMB (hold and  drag)', 'function': 'Cut node connection'},
      {'key': 'F', 'function': 'Connect selected nodes'},
      {'key': 'Ctrl + X', 'function': 'Delete nodes(keeping connection)'},
      {
        'key': 'Ctrl + Shift + D',
        'function': 'Duplicate nodes(keeping connection)'
      },
      {'key': 'M', 'function': 'Mute selected node'},
      {'key': 'Ctrl + G', 'function': 'Create group'},
      {'key': 'Ctrl + Alt + G', 'function': 'Ungroup selected'},
      {'key': 'TAB', 'function': 'Enter/Exit group'},
      {'key': 'N', 'function': 'Properties'},
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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // remove back arrow keys
        backgroundColor: kAppbarBackgroundColor,
        title: const Text(
          shadingStringTitle,
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
    );
  }
}
