import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_replica/Resources/auth_methods.dart';
import 'package:zoom_replica/Screens/Home_Screen.dart';
import 'package:zoom_replica/Screens/Login_Screen.dart';
import 'package:zoom_replica/Utils/colors.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Replica',
      theme: ThemeData.light(),
      routes: {
        '/login':(context) => LoginScreen(),
        '/home':(context) => HomeScreen(),

      },
      home:StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {

          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator(color: Colors.white,));
            }
          if(snapshot.hasData)
            {
              return HomeScreen();
            }
          return LoginScreen();
        },
      ),
    );
  }
}

