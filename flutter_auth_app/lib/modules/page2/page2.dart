import 'package:flutter/material.dart';
import 'package:flutter_auth_app/utils/services/rest_api_service.dart';

class Page2Screen extends StatefulWidget {
  const Page2Screen({key}) : super(key: key);

  @override
  _Page2ScreenState createState() => _Page2ScreenState();
}

class _Page2ScreenState extends State<Page2Screen> {
  String message = "";

  @override
  void initState() {
    super.initState();
    this.initPage();
  }

  void initPage() async {
    var response = await HttpService().get('/users/page2');

    if (response != null) {
      setState(() {
        this.message = response['message'];
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.message),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
