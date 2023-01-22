import 'package:blender_keys/components/home_screen_contents.dart';
import 'package:blender_keys/strings/content_strings.dart';
import 'package:blender_keys/subscreens/animation.dart';
import 'package:blender_keys/subscreens/general.dart';
import 'package:blender_keys/subscreens/geometry_nodes.dart';
import 'package:blender_keys/subscreens/grease_pencil.dart';
import 'package:blender_keys/subscreens/modeling.dart';
import 'package:blender_keys/subscreens/rendering.dart';
import 'package:blender_keys/subscreens/rigging.dart';
import 'package:blender_keys/subscreens/sculpting.dart';
import 'package:blender_keys/subscreens/shading.dart';
import 'package:blender_keys/subscreens/texture_paint.dart';
import 'package:blender_keys/subscreens/uv_editing.dart';
import 'package:blender_keys/themes/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBodyBackgroundColor,
      body: ListView(
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
        ],
      ),
    );
  }
}
