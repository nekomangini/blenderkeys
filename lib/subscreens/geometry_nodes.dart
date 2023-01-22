import 'package:blender_keys/strings/content_strings.dart';
import 'package:blender_keys/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

// ################################################################## //
// put the init state in statefulWidget                               //
class GeoNodesBlender extends StatefulWidget {
  const GeoNodesBlender({Key? key}) : super(key: key);

  @override
  State<GeoNodesBlender> createState() => _GeoNodesBlenderState();
}

class _GeoNodesBlenderState extends State<GeoNodesBlender> {
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
    return const GeoNodesAds();
  }
}

// ################################################################## //
class GeoNodesAds extends StatelessWidget {
  const GeoNodesAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ################################################################## //
    // content                                                            //
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
