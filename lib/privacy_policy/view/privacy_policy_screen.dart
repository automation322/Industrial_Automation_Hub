import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../utils/display_html_data.dart';
import '../../utils/size_constants.dart';
import '../controller/privacy_policy_controller.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  String _ppResponse = "";
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
    _ppResponse = await PrivacyPolicyController.privacyPolicy();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Privacy Policy",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _loading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : DisplayHtmlData(htmlResponse: _ppResponse),
    );
  }
}

