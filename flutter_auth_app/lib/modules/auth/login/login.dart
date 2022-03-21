import 'package:flutter/material.dart';
import 'package:flutter_auth_app/utils/services/rest_api_service.dart';

import 'login.model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernamecontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();
  AuthModel authModel = new AuthModel();
  bool isSuccess = true;

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      _usernamecontroller = TextEditingController();
      _passwordcontroller = TextEditingController();
    }

    @override
    void dispose() {
      _usernamecontroller.dispose();
      _passwordcontroller.dispose();
      super.dispose();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: const FlutterLogo(size: 150.0),
              ),
              TextField(
                controller: _usernamecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              this.isSuccess == false
                  ? SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'You did not sign in correctly or you account is temporality disabled.',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      this.isSuccess = true;
                    });

                    this.authModel.username = _usernamecontroller.value.text;
                    this.authModel.password = _passwordcontroller.value.text;

                    if (this.authModel.username != "" &&
                        this.authModel.password != "") {
                      HttpServiceResponse response =
                          await HttpService().auth('/users/authenticate', this.authModel);

                      if (response.success) {
                        Navigator.pushNamed(context, '/page1');
                        return;
                      }

                      setState(() {
                        this.isSuccess = response.success;
                      });
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
