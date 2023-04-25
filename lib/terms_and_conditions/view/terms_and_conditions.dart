import 'package:automation_hub/terms_and_conditions/controller/terms_and_conditions.dart';
import 'package:automation_hub/utils/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  String _tcResponse = "";
  bool _loading = false;
  @override
  void initState() {
    callApi();
    super.initState();
  }

  Future callApi() async {
    setState(() {
      _loading = true;
    });
    _tcResponse = await TermsAndConditionsController.termsAndCondition();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Terms & Conditions",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.white,
              padding: EdgeInsets.all(SizeConstants.appPadding),
              child: SingleChildScrollView(child: HtmlWidget(_tcResponse)),
            ),
    );
  }
}
