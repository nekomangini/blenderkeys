import 'package:blender_keys/strings/content_strings.dart';
import 'package:blender_keys/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

// ################################################################## //
// put the init state in statefulWidget                               //
class ShadingBlender extends StatefulWidget {
  const ShadingBlender({Key? key}) : super(key: key);

  @override
  State<ShadingBlender> createState() => _ShadingBlenderState();
}

class _ShadingBlenderState extends State<ShadingBlender> {
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
    return const ShadingAds();
  }
}

// ################################################################## //
class ShadingAds extends StatelessWidget {
  const ShadingAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ################################################################## //
    // content                                                            //
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
          child: Center(
            // ################################################################## //
            // DataTable widget is used instead of custom markdown tables         //
            // markdown loads slowly compared to DataTable widget                 //
            // ################################################################## //
            child: DataTable(
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
