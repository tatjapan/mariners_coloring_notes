import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mariners_coloring_notes/model/coloring_image.dart';
import 'package:mariners_coloring_notes/pages/faq_page.dart';
import 'package:mariners_coloring_notes/pages/privacy_policy_page.dart';
import 'package:mariners_coloring_notes/pages/terms_page.dart';
import 'package:mariners_coloring_notes/services/app_localizations.dart';
import 'package:mariners_coloring_notes/values/colors.dart';
import 'package:mariners_coloring_notes/widgets/common_widget/bottom_footer.dart';
import 'package:mariners_coloring_notes/widgets/common_widget/custom_app_bar.dart';
import 'package:mariners_coloring_notes/widgets/grid_image_item.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
//      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: _buildContent(context),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(
                AppLocalizations.of(context).translate('app_title'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.secondaryElement,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return FAQPage();
                    },
                  ),
                );
              },
              leading: FaIcon(FontAwesomeIcons.questionCircle),
              title: Text(
                'FAQ',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                launch(
                    'https://docs.google.com/document/d/14VIiTGPOiyp-vdA407599zlkZk3wCFu_gYA7mKx_u34/edit?usp=sharing');
//                Navigator.of(context).push(
//                  MaterialPageRoute(
//                    builder: (context) {
//                      return TermsPage();
//                    },
//                  ),
//                );
              },
              leading: FaIcon(FontAwesomeIcons.balanceScale),
              title: Text(
                'Terms',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                launch(
                    'https://docs.google.com/document/d/1aKfFi1whSnYSNsM7MlCQEfMFRw2eIQCAsRmwp4uf30s/edit?usp=sharing');
//                Navigator.of(context).push(
//                  MaterialPageRoute(
//                    builder: (context) {
//                      return PrivacyPolicyPage();
//                    },
//                  ),
//                );
              },
              leading: FaIcon(FontAwesomeIcons.userShield),
              title: Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(
              height: 65.0,
            ),
            Divider(
              thickness: 2.0,
              color: Colors.black45,
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
              ),
              alignment: Alignment.center,
              child: Text(
                'Follow me on',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  child: FaIcon(FontAwesomeIcons.facebookSquare),
                  onTap: () =>
                      launch('https://www.facebook.com/tatsuya.tsuri/'),
                ),
                InkWell(
                  child: FaIcon(FontAwesomeIcons.instagram),
                  onTap: () => launch('https://www.instagram.com/tsureezy/'),
                ),
                InkWell(
                  child: FaIcon(FontAwesomeIcons.github),
                  onTap: () => launch('https://github.com/tatjapan'),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomFooter(),
    );
  }
}

Widget _buildContent(BuildContext context) {
  return GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 15,
    crossAxisSpacing: 15,
    padding: EdgeInsets.all(10),
    childAspectRatio: 1,
    children: coloringImageList
        .map<Widget>(
          (coloringImage) => GridImageItem(
            coloringImage: coloringImage,
          ),
        )
        .toList(),
  );
}
