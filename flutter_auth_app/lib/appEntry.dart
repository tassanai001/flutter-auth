import 'package:flutter/material.dart';

import 'modules/auth/login/login.dart';
import 'modules/home/home.dart';
import 'modules/page1/page1.dart';
import 'modules/page2/page2.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth',
      initialRoute: '/login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/page1': (context) => const Page1Screen(),
        '/page2': (context) => const Page2Screen(),
      },
    );
  }
}

// import 'package:flutter/material.dart';
//
// import 'config/environment-config.dart';
//
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new MyHomePage(title: 'Flavored flutter'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(widget.title),
//       ),
//       body: new Center(
//         child: new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new Text(
//               'Hello',
//               style: Theme
//                   .of(context)
//                   .textTheme
//                   .headline,
//             ),
//             new Text(EnvironmentConfig.helloMessage,
//               style: Theme
//                   .of(context)
//                   .textTheme
//                   .display1,
//             ),
//             EnvironmentConfig.helloIcon,
//           ],
//         ),
//       ),
//     );
//   }
// }
