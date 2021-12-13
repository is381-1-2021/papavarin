import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/controllers/calculator_controller.dart';
import 'package:midterm_app/controllers/card_controllers.dart';
import 'package:midterm_app/model/formModel.dart';

import 'package:midterm_app/pages/1login.dart';
import 'package:midterm_app/pages/2home.dart';
import 'package:midterm_app/pages/calculator.dart';
import 'package:midterm_app/pages/history.dart';
import 'package:midterm_app/pages/history1.dart';
import 'package:midterm_app/pages/home2.dart';
import 'package:midterm_app/pages/3profile.dart';
import 'package:midterm_app/pages/4fav.dart';
import 'package:midterm_app/pages/5search.dart';
import 'package:midterm_app/pages/6flashcard.dart';
import 'package:midterm_app/pages/7notification.dart';
import 'package:midterm_app/pages/8settings.dart';
import 'package:midterm_app/pages/9flash_card.dart';
import 'package:midterm_app/pages/createflashcard.dart';
import 'package:midterm_app/pages/editEmail.dart';
import 'package:midterm_app/pages/editFirstName.dart';
import 'package:midterm_app/pages/editLastName.dart';
import 'package:midterm_app/pages/editPassword.dart';
import 'package:midterm_app/pages/flashcardqa_page.dart';
import 'package:midterm_app/pages/listfc_page.dart';
import 'package:midterm_app/pages/login.dart';
import 'package:midterm_app/pages/stackofcard_model.dart';
import 'package:midterm_app/pages/stackofcard_page.dart';
import 'package:midterm_app/pages/welcome.dart';
import 'package:midterm_app/services/flashcard_services.dart';

import 'package:provider/provider.dart';

import 'model/calculator_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // FirebaseFirestore.instance.collection("fc_cards").add({
  //   "name": "English101",
  //   "subject": "English",
  // }).then((value) {
  //   print(value.id);
  //   FirebaseFirestore.instance
  //       .collection("fc_cards")
  //       .doc(value.id)
  //       .collection("fc_flashcardqa")
  //       .add({"answer": "สวัสดี", "question": "hellow"});
  // });

  var services = FirebaseServices();
  var controller = CardController(services);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CalculatorModel(),
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
      home: CalculatorPage(),
      routes: {
        '/Login': (context) => LoginPage(),
        '/Home': (context) => MyHomePage3(),
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
        '/8': (context) => FlashcardqaPage(),
        '/9': (context) => ListfcPage(),
        '/10': (context) => CreateCardPage(),
        '/11': (context) => StackofcardPage(),
        '/12': (context) => MyHomePage1(),
        '/13': (context) => CalculatorPage(),
        '/14': (context) => HistoryPage(),
        '/15': (context) => HistoPage(),
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
