import 'package:blender_keys/strings/content_strings.dart';
import 'package:blender_keys/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UnityAds.init(
      gameId: '5127816',
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
          child: Center(
            child: DataTable(
              // ################################################################## //
              // DataTable widget is used instead of custom markdown tables         //
              // markdown loads slowly compared to DataTable widget                 //
              // ################################################################## //
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
