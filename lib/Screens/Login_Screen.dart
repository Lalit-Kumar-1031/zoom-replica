import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:zoom_replica/Resources/auth_methods.dart';
import 'package:zoom_replica/widgets/Custom_Button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods=AuthMethods();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.blueAccent,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Start or join a meeting',style: TextStyle(fontSize: 24,color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 38.0),
              child: Image.asset('assets/images/onboarding.jpg'),
            ),
            CustomButton(text: 'Google Sign In', onpress: ()async{
             bool res= await _authMethods.SignInWithGoogle(context);
              if(res) {
                Navigator.pushNamed(context, '/home');

                }
            }),
          ],
        ),
      ),
    );
  }
}
