import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'View/TSS_school.dart';
import 'View/school_log.dart';
import 'View/splashScreen.dart';
import 'View/teacher_Change.dart';
import 'View/teacher_Login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/TSS_school': (context) => const thornhill_inf(),
        '/teachersAuth': (context) => const TeacherLoginAUth(),
        '/changeAuthAnnouncement': (context) => const ChangeDatabase(),
      }
    )
  );
}
