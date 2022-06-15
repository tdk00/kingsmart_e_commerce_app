import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingsmart_online_app/helpers/config.dart';
import 'package:kingsmart_online_app/screens/login/start.dart';
import 'package:kingsmart_online_app/screens/main/logged_in_user.dart';
import 'package:kingsmart_online_app/screens/shopping_cart/shopping_cart_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // FirebaseMessaging.instance.subscribeToTopic("all");
  bool isLoggedIn = await Config.isLoggedIn();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp( isLoggedIn: isLoggedIn, ));
  });

}

class MyApp extends StatelessWidget {
  bool isLoggedIn;
  MyApp({required this.isLoggedIn});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/shoppingCartScreen': (context) => ShoppingCartScreen(),
      },
      title: 'Kingsmart App',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.green
          )
        ),
        primarySwatch: Colors.blue,
      ),
      home: isLoggedIn ? MyHomePage() : Start(),
    );
  }

}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LoggedInUser();
  }
}
