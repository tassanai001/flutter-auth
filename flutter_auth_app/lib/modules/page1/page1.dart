import 'package:flutter/material.dart';
import 'package:flutter_auth_app/utils/services/rest_api_service.dart';

import 'page1.model.dart';

class Page1Screen extends StatefulWidget {
  const Page1Screen({key}) : super(key: key);

  @override
  _Page1ScreenState createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page1Screen> {
  String message = "";

  @override
  void initState() {
    super.initState();
    this.initPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initPage() async {
    var response = await HttpService().get('/users/page1');

    if (response != null) {
      setState(() {
        this.message = response['message'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.message),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page2');
              },
              child: const Text('Go To Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}
