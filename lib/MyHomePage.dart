import 'package:flutter/material.dart';
import 'dart:async';

//permet la création du splashscreen au lancement de l'application
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  SplashScreenState createState() => SplashScreenState();
}

//splashscreen de 3 secondes avec le logo et un CircularProgressIndicator qui renvoie sur la page d'acceuil
class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Acceuil())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(194, 195, 197, 5),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 200),
              child: Image.asset(
                'Assets/Images/gametoy_logo.png',
                width: 350,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 350.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//page d'acceuil avec un menu de navigation et deux boutons qui renvoit soit sur la page statistique ou personnalisé
class Acceuil extends StatelessWidget {
  const Acceuil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        backgroundColor: const Color.fromRGBO(194, 195, 197, 5),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Center(
              child: DrawerHeader(
                child: Text(
                  'Menu',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.grey),
                ),
              ),
            ),
            Center(
              child: ListTile(
                title: const Text(
                  'Morpion',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/morpion');
                },
              ),
            ),
            Center(
              child: ListTile(
                title: const Text('Light Out',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey)),
                onTap: () {
                  Navigator.pushNamed(context, '/lightout');
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/Images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: null,
                    child: Image.asset(
                      'Assets/Images/gametoy_logo.png',
                      width: 350,
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(40)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/morpion');
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.black),
                  backgroundColor: Colors.grey,
                ),
                child: const Text('Jouer au Morpion',
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/lightout');
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.black),
                  backgroundColor: Colors.grey,
                ),
                child: const Text('Jouer au Light Out',
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
