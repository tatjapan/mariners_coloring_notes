import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mariners_coloring_notes/model/faq_item.dart';
import 'package:mariners_coloring_notes/widgets/common_widget/bottom_footer.dart';
import 'package:mariners_coloring_notes/widgets/common_widget/custom_app_bar.dart';
import 'package:mariners_coloring_notes/widgets/common_widget/expantion_panel.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final _faqList = new List<FAQItem>();

  @override
  void initState() {
    _faqList.add(
      FAQItem(
        false,
        'Can I play this app for free?',
        'Yes! This app is free to play!',
      ),
    );
    _faqList.add(
      FAQItem(
        false,
        'Can I use my coloring book for commercial purposes?',
        'Coloring images are only allowed for personal use in the home.Please refrain from using them for commercial use or for outdoor postings.',
      ),
    );
    _faqList.add(
      FAQItem(
        false,
        'Can I save my finished coloring book?',
        'No, unfortunately you can not save it.The save function is currently under development.',
      ),
    );
    _faqList.add(
      FAQItem(
        false,
        'I found a bug and would like to report it.',
        'Please send a message to facebook.com/tatsuya.tsuri. If you\'re an engineer, you can create an Issue on Github.',
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _faqList[index].isExpanded = !_faqList[index].isExpanded;
                });
              },
              children: _faqList.map(createPanel).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomFooter(),
    );
  }
}
