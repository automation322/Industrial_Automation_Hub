import 'package:automation_hub/terms_and_conditions/view/terms_and_conditions.dart';
import 'package:flutter/material.dart';

import '../../privacy_policy/view/privacy_policy_screen.dart';
import '../../videos/view/videos_list_screen.dart';

Drawer customDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.250,
          // color: Colors.red,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    "assets/images/profile_pic.jpeg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "dhruvik",
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      fontSize: 14,
                      color: Colors.black,
                    ),
              ),
              Text(
                "dhruvikchovatiya013@gmaill.com",
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      fontSize: 14,
                      color: Colors.black,
                    ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VideosListScreen(),
                ));
              },
              leading: const Icon(Icons.video_collection),
              title: const Text("Videos"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TermsAndCondition(),
                ));
              },
              leading: const Icon(Icons.gavel),
              title: const Text("Terms & conditions"),
            ),
            ListTile(
              leading: const Icon(Icons.admin_panel_settings),
              title: const Text("Privacy policy"),
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text("About us"),
            )
          ],
        )
      ],
    ),
  );
}
