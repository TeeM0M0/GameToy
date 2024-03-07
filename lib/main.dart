import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'morpionPage.dart';
import 'lightoutPage.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameToy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(194, 195, 197, 5),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromRGBO(194, 195, 197, 5),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Accueil'),
      routes: <String, WidgetBuilder>{
        '/acceuil': (BuildContext context) => const Acceuil(),
        '/morpion': (BuildContext context) => const Morpion(),
        '/lightout': (BuildContext context) => const Lightout(),
      },
    );
  }
}
