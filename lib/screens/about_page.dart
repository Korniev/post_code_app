import 'package:flutter/material.dart';
import 'package:post_code_app/screens/home_page.dart';
import 'package:post_code_app/styles/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  Future<void> _launchURL() async {
    final url = Uri.parse('https://github.com/Korniev');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 4.0,
        title: Text(
          "About!",
          style: TextStyle(
            color: AppStyles.mindaro,
            letterSpacing: .5,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Hero(
                tag: 'image',
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(
                    'lib/image/me.jpg',
                  ),
                )),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Created by Yevhenii Korniev in 2023",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            InkWell(
              onTap: _launchURL,
              child: Text(
                "Visit my GitHub",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppStyles.celticblue,
                    decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));
          }
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.call_to_action),
              label: 'About',
              backgroundColor: AppStyles.celticblue),
        ],
      ),
    );
  }
}
