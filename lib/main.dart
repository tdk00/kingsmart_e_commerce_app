import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingsmart_online_app/screens/login/start.dart';
import 'package:kingsmart_online_app/state_data.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ChangeNotifierProvider<StateData>(
        create: (BuildContext context) {
          return StateData();
        },
        child: MyApp()));
  });

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.green
          )
        ),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Start();
  }
}
