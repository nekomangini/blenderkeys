import 'package:blenderkeys_v2/components/unity_banner_ad.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:blenderkeys_v2/themes/text_styles.dart';
import 'package:blenderkeys_v2/utils/ad_manager.dart';
import 'package:blenderkeys_v2/utils/unity_ad_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GeneralBlender extends StatefulWidget {
  const GeneralBlender({super.key});

  @override
  State<GeneralBlender> createState() => _GeneralBlenderState();
}

class _GeneralBlenderState extends State<GeneralBlender> {
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
    return const GeneralAds();
  }
}

class GeneralAds extends StatelessWidget {
  const GeneralAds({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'key': 'Shift + A', 'function': 'Add Object'},
      {
        'key': 'Shift + B',
        'function':
            'Allows you to specify a rectangular region by dragging with LMB. The view will then zoom in on this region'
      },
      {'key': 'Shift + F1-F12', 'function': 'Change the Workspace'},
      {
        'key': 'Home',
        'function': 'Changes the view so that you can see all objects'
      },
      {'key': 'Alt + D', 'function': 'Create a duplicate linked object/s'},
      {'key': 'X, DEL', 'function': 'Delete Object'},
      {
        'key': 'A + A, ALT + A',
        'function': 'Deselect all object/s that is currently selected'
      },
      {'key': 'Shift + Ctrl + MMB', 'function': 'Dolly view'},
      {
        'key': 'B + LMB (hold and drag)',
        'function':
            'Drag a box with the mouse and select all elements that are completely or partially in the box'
      },
      {
        'key': 'D + Left click (hold and drag)',
        'function': 'Draw free-hand strokes in the main window'
      },
      {
        'key': 'C',
        'function':
            'Draw over object/s by holding the left mouse button pressed to select them. Exit by pressing Esc'
      },
      {'key': 'Shift + D', 'function': 'Duplicate the selected object/s'},
      {
        'key': 'D + Right click (hold and drag)',
        'function': 'Erase previously created annotations'
      },
      {'key': 'H', 'function': 'Hide selected object/s'},
      {
        'key': 'Shift + H',
        'function': 'Hides all unselected objects of the scene'
      },
      {'key': 'Ctrl + I', 'function': 'Invert the current selection'},
      {'key': 'G', 'function': 'Move the selected object/s'},
      {
        'key': 'Ctrl + MMB (hold and drag)',
        'function':
            'Moves the view closer to, or further away from, the point of interest'
      },
      {
        'key': 'Shift + MMB (hold and drag)',
        'function': 'Moves the view up, down, left and right'
      },
      {'key': 'Numpad + 2', 'function': 'Orbit down in the 3D viewport'},
      {'key': 'Numpad + 4', 'function': 'Orbit left in the 3D viewport'},
      {'key': 'Numpad + 6', 'function': 'Orbit right in the 3D viewport'},
      {'key': 'Numpad + 8', 'function': 'Orbit up in the 3D viewport'},
      {'key': 'Q', 'function': 'Quick favorites menu'},
      {'key': 'F2', 'function': 'Rename Selected Object/s'},
      {'key': 'Alt + H', 'function': 'Reveals all hidden object/s'},
      {'key': 'R', 'function': 'Rotate the selected object/s'},
      {
        'key': 'R + R',
        'function':
            'Rotate the selected object/s on the X,Y, and Z axis simultaneously'
      },
      {
        'key': 'MMB (hold and drag)',
        'function': 'Rotate the view around the point of interest'
      },
      {'key': 'S', 'function': 'Scale the selected object/s'},
      {'key': 'F3', 'function': 'Search for operations'},
      {'key': 'A', 'function': 'Select all object/s in the 3D viewport'},
      {
        'key': 'Shift + G',
        'function': 'Select all objects belonging to a specific group'
      },
      {'key': 'Shift + L', 'function': 'Select linked object/s'},
      {
        'key': 'Ctrl + RMB (hold and drag)',
        'function': 'Select object/s by drawing a free-hand area'
      },
      {
        'key': 'LMB (hold and drag)',
        'function': 'Select object/s in the 3D viewport'
      },
      {'key': 'N', 'function': 'Sidebar'},
      {
        'key': 'Alt + Middle click (hold and drag)',
        'function': 'Switch between Orthographic views'
      },
      {
        'key': 'Numpad + 0',
        'function': 'Switch to the camera view in the 3D viewport'
      },
      {
        'key': 'Numpad + 1',
        'function': 'Switch to the front orthographic view in the 3D viewport'
      },
      {
        'key': 'Numpad + 9',
        'function':
            'Switch to the opposite side of the view(rotates 180° around the Z axis'
      },
      {
        'key': 'Numpad + 3',
        'function': 'Switch to the right orthographic view in the 3D viewport'
      },
      {
        'key': 'Numpad + 7',
        'function': 'Switch to top orthographic view in the 3D viewport'
      },
      {
        'key': 'Ctrl + Alt + Q',
        'function': 'Toggle between quadview and normal single 3D view'
      },
      {
        'key': 'Ctrl + Alt + Space',
        'function':
            'Toggle to fullscreen the area the mouse is currently hovering over'
      },
      {
        'key': 'Ctrl + Space',
        'function':
            'Toggle to maximize the area the mouse is currently hovering over'
      },
      {
        'key': 'Numpad + 5',
        'function':
            'Toggles between perspective view and orthographic view in the 3D viewport'
      },
      {
        'key': 'Numpad + /',
        'function':
            'Toggles between the local and global view, only the selected objects are visible in the viewport'
      },
      {'key': 'T', 'function': 'Toolbar'},
      {'key': 'Numpad+', 'function': 'Zoom in'},
      {
        'key': 'NumpadPeriod',
        'function': 'Zoom in or out to view everything that is selected'
      },
      {'key': 'Numpad-', 'function': 'Zoom out'},
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
          generalStringTitle,
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
