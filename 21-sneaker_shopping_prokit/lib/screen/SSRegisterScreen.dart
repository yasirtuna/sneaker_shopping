import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/screen/SSSignInScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SSRegisterScreen extends StatefulWidget {
  @override
  _SSRegisterScreenState createState() => _SSRegisterScreenState();
}

class _SSRegisterScreenState extends State<SSRegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _signUp() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      final AuthResponse response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        toast('Registration successful!');
      } else {
        toast('Sign up failed');
      }
    } catch (error) {
      if (error is AuthException) {
        toast('Error: ${error.message}');
      } else {
        toast('An unexpected error occurred: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Color(0x00000000), width: 1),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 32),
            Text(
              "Register",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: boldTextStyle(size: 18),
            ),
            SizedBox(height: 8),
            Text(
              "Create your new account",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: primaryTextStyle(),
            ),
            SizedBox(height: 32),
            TextField(
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
              ),
              decoration: sSInputDecoration(
                context: context,
                name: 'User name',
                icon: Icon(Icons.person,
                    color: Colors.grey.withOpacity(0.4), size: 24),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14),
              decoration: sSInputDecoration(
                context: context,
                name: 'Mobile',
                icon: Icon(Icons.call,
                    color: Colors.grey.withOpacity(0.4), size: 24),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14),
              decoration: sSInputDecoration(
                context: context,
                name: 'Email address',
                icon: Icon(Icons.email,
                    color: Colors.grey.withOpacity(0.4), size: 24),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
              ),
              decoration: sSInputDecoration(
                context: context,
                name: 'Password',
                icon: Icon(Icons.lock,
                    color: Colors.grey.withOpacity(0.4), size: 24),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: _signUp,
                child: Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: appStore.isDarkModeOn
                        ? context.cardColor
                        : Color(0xff010101),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0x4df2e4e4), width: 1),
                  ),
                  child: Icon(Icons.arrow_forward,
                      color: Color(0xfffcfdff), size: 24),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Already have an account?",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: primaryTextStyle(),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: () {
                finish(context);
                SSSignInScreen().launch(context);
              },
              child: Text(
                "Sign in",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: boldTextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
