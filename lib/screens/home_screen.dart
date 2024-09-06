import 'package:blenderkeys_v2/components/home_screen_contents.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/subscreens/animation.dart';
import 'package:blenderkeys_v2/subscreens/general.dart';
import 'package:blenderkeys_v2/subscreens/geometry_nodes.dart';
import 'package:blenderkeys_v2/subscreens/grease_pencil.dart';
import 'package:blenderkeys_v2/subscreens/modeling.dart';
import 'package:blenderkeys_v2/subscreens/rendering.dart';
import 'package:blenderkeys_v2/subscreens/rigging.dart';
import 'package:blenderkeys_v2/subscreens/sculpting.dart';
import 'package:blenderkeys_v2/subscreens/shading.dart';
import 'package:blenderkeys_v2/subscreens/texture_paint.dart';
import 'package:blenderkeys_v2/subscreens/uv_editing.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBodyBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            // ################################################################ //
            // HomeScreenContents is a user created widgets //
            // that has page route, title text, icon and subtitle text property //
            HomeScreenContents(
              pageRoute: AnimationBlender(),
              subScreenTitle: animationStringTitle,
              customIcon: Icons.animation,
              subText: animationSub,
            ),
            HomeScreenContents(
              pageRoute: GeneralBlender(),
              subScreenTitle: generalStringTitle,
              customIcon: Icons.view_agenda,
              subText: generalSub,
            ),
            HomeScreenContents(
              pageRoute: GeoNodesBlender(),
              subScreenTitle: geoNodesStringTitle,
              customIcon: Icons.stadium,
              subText: geometrySub,
            ),
            HomeScreenContents(
              pageRoute: GreasePencilBlender(),
              subScreenTitle: greasePencilStringTitle,
              customIcon: Icons.draw,
              subText: greaseSub,
            ),
            HomeScreenContents(
              pageRoute: ModelingBlender(),
              subScreenTitle: modelingStringTitle,
              customIcon: Icons.monitor,
              subText: modelingSub,
            ),
            HomeScreenContents(
              pageRoute: RenderingBlender(),
              subScreenTitle: renderingStringTitle,
              customIcon: Icons.smart_screen,
              subText: renderingSub,
            ),
            HomeScreenContents(
              pageRoute: RiggingBlender(),
              subScreenTitle: riggingStringTitle,
              customIcon: Icons.skateboarding,
              subText: riggingSub,
            ),
            HomeScreenContents(
              pageRoute: SculptingBlender(),
              subScreenTitle: sculptingStringTitle,
              customIcon: Icons.satellite,
              subText: sculptingSub,
            ),
            HomeScreenContents(
              pageRoute: ShadingBlender(),
              subScreenTitle: shadingStringTitle,
              customIcon: Icons.roller_shades,
              subText: shadingSub,
            ),
            HomeScreenContents(
              pageRoute: TexturePaintBlender(),
              subScreenTitle: texturePainStringTitle,
              customIcon: Icons.format_paint,
              subText: texturepaintSub,
            ),
            HomeScreenContents(
              pageRoute: UvEditBlender(),
              subScreenTitle: uvEditStringTitle,
              customIcon: Icons.image,
              subText: uvSub,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
