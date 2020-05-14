import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mariners_coloring_notes/model/faq_item.dart';
import 'package:mariners_coloring_notes/services/app_localizations.dart';

ExpansionPanel createPanel(FAQItem faqItem) {
  return ExpansionPanel(
    headerBuilder: (BuildContext context, bool isExpanded) {
      return Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: FaIcon(FontAwesomeIcons.questionCircle),
            ),
            Text(
              AppLocalizations.of(context).translate(faqItem.question),
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    },
    body: _ExpansionPanelBodyText(faqItem.answer),
    isExpanded: faqItem.isExpanded,
  );
}

class _ExpansionPanelBodyText extends StatelessWidget {
  _ExpansionPanelBodyText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: FaIcon(FontAwesomeIcons.lightbulb),
          ),
          Text(
            AppLocalizations.of(context).translate(text),
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
