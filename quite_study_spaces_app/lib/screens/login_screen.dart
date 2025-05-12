import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/services/auth_service.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiet Study Spaces"),
        actions: [],
      ),
      body: Consumer<ScreenState>(builder: (context, state, child) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 400,
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                if(_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please Enter a Valid Email and Password."),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }

                final authService = AuthService();
                final result = await authService.logIn(
                  email: _emailController.text, 
                  password: _passwordController.text,
                );

                if (result == 'Sucess'){
                  state.goToHomeScreen();
                } else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(result!),
                      duration: Duration(seconds: 2),
                      ),
                  );
                }
              },
              child: Text('Log In'),
            ),
            Text('Not a user?'),
            ElevatedButton(
              onPressed: state.goToSignUp,
              child: Text("Sign Up"),
            ),
            ElevatedButton(onPressed: state.goToHomeScreen, child: Text("Test")),
          ],
        ));
      }),
    );
  }
}
