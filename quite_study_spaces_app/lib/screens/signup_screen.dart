import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/main.dart';
import 'package:quite_study_spaces_app/services/auth_service.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
import 'package:quite_study_spaces_app/widgets/background.dart';

class SignupScreen extends StatefulWidget {
  final AuthService authService;

  const SignupScreen({super.key, required this.authService});

  @override
  State<SignupScreen> createState() {
    return _SignupScreen();
  }
}

class _SignupScreen extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, child) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: state.logOut,
            ),
            title: Text("Quiet Study Spaces"),
            actions: [],
          ),
          body: Stack(children: [
            const backgroundWidget(),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), 
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: darkgreen,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), 
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: darkgreen,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                  ),
                ),
                SizedBox(height: 40),
                OutlinedButton(
                  onPressed: () async {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      //https://api.flutter.dev/flutter/material/ScaffoldMessenger-class.html
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Please Enter a Valid Email and Password."),
                        duration: Duration(seconds: 2),
                      ));
                    }

                    final result = await widget.authService.signUp(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );

                    if (result == 'Sucess') {
                      state.goToHomeScreen();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result!),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 8),
                TextButton(
                  onPressed: state.logOut, child: Text("Cancel"),)
              ],
            ))
          ]));
    });
  }
}
