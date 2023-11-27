import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_code_app/screens/about_page.dart';
import 'package:post_code_app/services/post_code_service.dart';
import 'package:post_code_app/styles/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';
  final PostCodeService _postCodeService = PostCodeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 4.0,
        title: Text(
          "Post Code!",
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter a city name',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final cityName = _controller.text;
                final response = await _postCodeService.fetchCityInfo(cityName);
                setState(() {
                  _response = response;
                });
              },
              child: Text('Find Post Code'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.montserrat(fontSize: 20),
                    children: _response.split('\n').map((line) {
                      var parts = line.split(': ');
                      return TextSpan(
                        children: [
                          TextSpan(
                            text: parts[0],
                            style: TextStyle(color: AppStyles.carcoal),
                          ),
                          TextSpan(
                            text: parts.length > 1 ? ': ${parts[1]}\n' : '\n',
                            style: TextStyle(color: AppStyles.celticblue),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 1) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AboutPage()));
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
