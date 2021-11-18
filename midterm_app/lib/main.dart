import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/controllers/card_controllers.dart';
import 'package:midterm_app/model/formModel.dart';

import 'package:midterm_app/pages/1login.dart';
import 'package:midterm_app/pages/2home.dart';
import 'package:midterm_app/pages/3profile.dart';
import 'package:midterm_app/pages/4fav.dart';
import 'package:midterm_app/pages/5search.dart';
import 'package:midterm_app/pages/6flashcard.dart';
import 'package:midterm_app/pages/7notification.dart';
import 'package:midterm_app/pages/8settings.dart';
import 'package:midterm_app/pages/9flash_card.dart';
import 'package:midterm_app/pages/editEmail.dart';
import 'package:midterm_app/pages/editFirstName.dart';
import 'package:midterm_app/pages/editLastName.dart';
import 'package:midterm_app/pages/editPassword.dart';
import 'package:midterm_app/pages/getstart.dart';
import 'package:midterm_app/pages/homesignup.dart';
import 'package:midterm_app/pages/login.dart';
import 'package:midterm_app/pages/signup.dart';
import 'package:midterm_app/services/flashcard_services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var services = FirebaseServices();
  var controller = CardController(services);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FormModel(),
        ),
      ],
      child: MyApp(
        controller: controller,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final CardController controller;
  MyApp({required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Nunito",
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/Getstart': (context) => GetstartPage(),
        '/Login': (context) => Login1Page(),
        '/Home': (context) => MyHomePage(controller: controller),
        '/Profile': (context) => ProfilePage(),
        '/Favorite': (context) => FavoritePage(),
        '/Search': (context) => SearchPage(),
        '/FlashCard': (context) => FlashCardPage(),
        '/Settings': (context) => SettingsPage(),
        '/Notification': (context) => NotificationPage(),
        '/3': (context) => EditFirstName(),
        '/4': (context) => EditLastName(),
        '/5': (context) => EditEmail(),
        '/6': (context) => EditPassword(),
        '/7': (context) => FlashCard(),
        '/8': (context) => HomeScreen(),
        '/9': (context) => SignupPage(),
        '/10': (context) => LoginPage()
      },
    );
  }
}

void main_old() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var services = FirebaseServices();
  var controller = CardController(services);

  runApp(CardApp(controller: controller));
}

class CardApp extends StatelessWidget {
  final CardController controller;
  CardApp({required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(controller: controller),
    );
  }
}
