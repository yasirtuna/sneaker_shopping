import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/screen/SSDashBoardScreen.dart';
import 'package:sneaker_shopping_prokit/screen/SSForgotPasswordScreen.dart';
import 'package:sneaker_shopping_prokit/screen/SSRegisterScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SSSignInScreen extends StatefulWidget {
  @override
  _SSSignInScreenState createState() => _SSSignInScreenState();
}

class _SSSignInScreenState extends State<SSSignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _signIn() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      final AuthResponse response =
          await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.session != null) {
        SSDashBoardScreen().launch(context);
      } else {
        toast('Sign in failed');
      }
    } catch (error) {
      if (error is AuthException) {
        toast('Error: ${error.message}'); // Hata mesajını göstermek için
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
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
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
            SizedBox(height: 32, width: 16),
            Text("Sign In",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: boldTextStyle()),
            SizedBox(height: 8),
            Text("Please sign in to continue the app",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: primaryTextStyle()),
            SizedBox(height: 32),
            TextField(
              controller: emailController, // TextEditingController bağlandı
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14),
              decoration: sSInputDecoration(
                context: context,
                icon: Icon(Icons.email,
                    color: Colors.grey.withOpacity(0.4), size: 24),
                name: 'Email address',
              ),
            ),
            SizedBox(height: 16, width: 16),
            TextField(
              controller: passwordController, // TextEditingController bağlandı
              obscureText: true, // Şifreyi gizlemek için true yapıldı
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14),
              decoration: sSInputDecoration(
                context: context,
                icon: Icon(Icons.lock,
                    color: Colors.grey.withOpacity(0.4), size: 24),
                name: 'Password',
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text('Forgot Password?',
                    style: boldTextStyle(size: 16, color: Colors.red)),
                onPressed: () {
                  SSForgotPasswordScreen().launch(context);
                },
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  _signIn(); // Doğrudan fonksiyonu çağır
                },
                child: Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: appStore.isDarkModeOn
                        ? context.cardColor
                        : Color(0xff010101),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Icon(Icons.arrow_forward,
                      color: Color(0xfffcfdff), size: 24),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text("Don't have an account?",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: primaryTextStyle()),
            TextButton(
              onPressed: () {
                SSRegisterScreen().launch(context);
              },
              child: Text("Register", style: boldTextStyle(color: Colors.red)),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment(0.2, 0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.2)),
                    child: Image(
                        image: AssetImage(
                            "images/sneakerShopping/ic_facebook.png"),
                        height: 25,
                        width: 25,
                        fit: BoxFit.cover),
                  ),
                  SizedBox(width: 16),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.2)),
                    child: Image(
                        image:
                            AssetImage("images/sneakerShopping/ic_google.png"),
                        height: 25,
                        width: 25,
                        fit: BoxFit.contain),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
