import 'package:blenderkeys_v2/components/unity_banner_ad.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:blenderkeys_v2/themes/text_styles.dart';
import 'package:blenderkeys_v2/utils/ad_manager.dart';
import 'package:blenderkeys_v2/utils/unity_ad_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SculptingBlender extends StatefulWidget {
  const SculptingBlender({super.key});

  @override
  State<SculptingBlender> createState() => _SculptingBlenderState();
}

class _SculptingBlenderState extends State<SculptingBlender> {
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
    return const SculptingAds();
  }
}

class SculptingAds extends StatelessWidget {
  const SculptingAds({super.key});

  @override
  Widget build(BuildContext context) {
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
