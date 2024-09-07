import 'package:blenderkeys_v2/themes/color.dart';
import 'package:flutter/material.dart';

// ################################################################ //
// this is the widget that is being use in the home_screen.dart     //
// ################################################################ //

class HomeScreenContents extends StatelessWidget {
  final Widget pageRoute;
  final String subScreenTitle;
  final IconData customIcon;
  final String subText;

  const HomeScreenContents(
      {super.key,
      required this.pageRoute,
      required this.subScreenTitle,
      required this.customIcon,
      required this.subText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        leading: Icon(customIcon),
        title: Text(subScreenTitle),
        subtitle: Text(subText),
        // ################################################################ //
        // trailing: const Icon(Icons.favorite_border_sharp),               //
        // ################################################################ //
        tileColor: kAppbarBackgroundColor,
        onTap: () {
          // ################################################################ //
          // unused code                                                      //
          // Navigator.of(context)                                            //
          //     .push(MaterialPageRoute(builder: (context) => pageRoute));   //
          // Navigator.push(context, FadeRoute(pageRoute));                   //
          //                                                                  //
          // fade animation                                                   //
          // Navigator.of(context).push(                                      //
          //   PageRouteBuilder(                                              //
          //     pageBuilder: (context, animation, secondaryAnimation) =>     //
          //         pageRoute,                                               //
          //     transitionsBuilder:                                          //
          //         (context, animation, secondaryAnimation, child) {        //
          //       return FadeTransition(                                     //
          //         opacity: animation,                                      //
          //         child: child,                                            //
          //       );                                                         //
          //     },                                                           //
          //     transitionDuration: const Duration(milliseconds: 500),       //
          //   ),                                                             //
          // );                                                               //
          // ################################################################ //

          // scale animation
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  pageRoute,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      ScaleTransition(
                scale: Tween<double>(
                  begin: 3,
                  end: 1,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInBack,
                  ),
                ),
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
// ########################################################################## //
// unused code                                                                //
//                                                                            //
// class FadeRoute extends PageRouteBuilder {                                 //
//   final Widget page;                                                       //
//                                                                            //
//   FadeRoute(this.page)                                                     //
//       : super(                                                             //
//           pageBuilder: (BuildContext context, Animation<double> animation, //
//                   Animation<double> secondaryAnimation) =>                 //
//               page,                                                        //
//           transitionsBuilder: (                                            //
//             BuildContext context,                                          //
//             Animation<double> animation,                                   //
//             Animation<double> secondaryAnimation,                          //
//             Widget child,                                                  //
//           ) =>                                                             //
//               FadeTransition(                                              //
//             opacity: animation,                                            //
//             child: page,                                                   //
//           ),                                                               //
//         );                                                                 //
// }                                                                          //
// ########################################################################## //
