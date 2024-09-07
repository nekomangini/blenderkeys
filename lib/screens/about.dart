import 'package:blenderkeys_v2/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// unused code
class Donate extends StatefulWidget {
  const Donate({Key? key}) : super(key: key);

  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri(scheme: "https", path: url);
    // to use youtube app when opening the link
    // final Uri uri = Uri(
    //   scheme: "vnd.youtube",
    //   host: "www.youtube.com",
    //   path: "/@nekomangini",
    // );
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Cannot launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          kBodyBackgroundColorAbout, // kBodyBackgroundColor kContentBackgroundColor
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const AboutCardWidget(
            cardTitle: "Nekomangini",
            cardIcon: Icons.person,
          ),
          const AboutCardWidget(
            cardTitle: 'Youtube Channel',
            cardIcon: Icons.play_circle,
            url: ('www.youtube.com/@nekomangini'),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: kAppbarBackgroundColor,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: SizedBox(
              height: 80,
              child: Center(
                child: ListTile(
                  leading: const Icon(
                    Icons.coffee,
                  ),
                  title: const Text(
                    'Buy me a coffee',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: kCardTextColor,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                  onTap: () {
                    _launchUrl('www.ko-fi.com/nekomangini5');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ################################################################## //
// custom widget created by me :)                                     //
class AboutCardWidget extends StatelessWidget {
  final String cardTitle;
  final IconData cardIcon;

  // ################################################################## //
  // optional property add ? after the data type                        //
  // Ex:                                                                //
  // IconData?                                                          //
  // ################################################################## //
  final String? url;

  const AboutCardWidget(
      {super.key, required this.cardTitle, required this.cardIcon, this.url});

  // ################################################################################## //
  // Update the _launchUrl function to accept a nullable string.                        //
  // You can do this by adding a ? after the String type in the function declaration:   //
  // ################################################################################## //
  Future<void> _launchUrl(String? url) async {
    // ################################################################## //
    // unused code                                                        //
    // code is transferred in Card widget                                  //
    // final Uri uri = Uri(scheme: "https", path: url);                   //
    //                                                                    //
    // ko-fi link                                                         //
    // final Uri uri2 = Uri(scheme: "https", path: url);                  //
    // ################################################################## //
    // youtube link
    // to use youtube app when opening the link use scheme: "vnd.youtube" //
    final Uri uri = Uri(
      scheme: "vnd.youtube",
      host: "www.youtube.com",
      path: "/@nekomangini",
    );
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Cannot launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: kAppbarBackgroundColor,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
      child: SizedBox(
        height: 75.0,
        child: Center(
          child: ListTile(
            leading: Icon(cardIcon),
            title: Text(
              cardTitle,
              style: const TextStyle(
                fontSize: 20.0,
                color: kCardTextColor,
                fontFamily: 'Source Sans Pro',
              ),
            ),
            onTap: url != null ? () => _launchUrl(url) : null,
          ),
        ),
      ),
    );
  }
}
