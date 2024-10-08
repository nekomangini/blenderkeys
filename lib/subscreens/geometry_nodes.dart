import 'package:blenderkeys_v2/components/unity_banner_ad.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:blenderkeys_v2/themes/text_styles.dart';
import 'package:blenderkeys_v2/utils/ad_manager.dart';
import 'package:blenderkeys_v2/utils/unity_ad_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GeoNodesBlender extends StatefulWidget {
  const GeoNodesBlender({super.key});

  @override
  State<GeoNodesBlender> createState() => _GeoNodesBlenderState();
}

class _GeoNodesBlenderState extends State<GeoNodesBlender> {
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
    return const GeoNodesAds();
  }
}

class GeoNodesAds extends StatelessWidget {
  const GeoNodesAds({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'key': 'Shift + A', 'function': 'Add a new node '},
      {'key': 'H ', 'function': 'Collapse a noden'},
      {'key': 'Ctrl + Shift + LMB  ', 'function': 'Connect node to the viewer'},
      {'key': 'Ctrl + G ', 'function': 'Create a node group'},
      {
        'key': 'Ctrl + RMB (hold and drag)',
        'function': 'Cut a node connection'
      },
      {'key': 'X', 'function': 'Delete a node '},
      {'key': 'Ctrl + X', 'function': 'Delete a node with a reconnect'},
      {'key': 'M', 'function': 'Disable a node'},
      {'key': 'Shift + D', 'function': 'Duplicate a node'},
      {'key': 'TAB', 'function': 'Enter or Exit a node group'},
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
          geoNodesStringTitle,
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
