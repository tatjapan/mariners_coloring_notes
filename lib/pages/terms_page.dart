//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:mariners_coloring_notes/services/app_localizations.dart';
//import 'package:mariners_coloring_notes/values/values.dart';
//import 'package:mariners_coloring_notes/widgets/common_widget/bottom_footer.dart';
//import 'package:mariners_coloring_notes/widgets/common_widget/custom_app_bar.dart';
//
//class TermsPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: CustomAppBar(),
//      body: SingleChildScrollView(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            SizedBox(
//              height: 20.0,
//            ),
//            Text(
//              AppLocalizations.of(context).translate('HTP_title1'),
//              style: TextStyle(
//                fontSize: 20.0,
//                color: AppColors.primaryTextColor,
//              ),
//            ),
//            Container(
//              margin: EdgeInsets.all(35.0),
//              child: Image.asset(
//                'assets/images/htp_1.gif',
//              ),
//            ),
//            SizedBox(
//              height: 20.0,
//            ),
//            Text(
//              AppLocalizations.of(context).translate('HTP_title1'),
//              style: TextStyle(
//                fontSize: 20.0,
//                color: AppColors.primaryTextColor,
//              ),
//            ),
//            Container(
//              margin: EdgeInsets.all(35.0),
//              child: Image.asset(
//                'assets/images/htp_2.gif',
//              ),
//            ),
//            SizedBox(
//              height: 20.0,
//            ),
//            FloatingActionButton.extended(
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//              backgroundColor: AppColors.primaryElement,
//              icon: Icon(Icons.home),
//              label: Text(
//                AppLocalizations.of(context).translate('back'),
//                style: TextStyle(color: Colors.white),
//              ),
//            ),
//            SizedBox(
//              height: 15.0,
//            ),
//          ],
//        ),
//      ),
//      bottomNavigationBar: BottomFooter(),
//    );
//  }
//}
