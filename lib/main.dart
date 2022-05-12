import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingsmart_online_app/pages/login/start.dart';
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
    int firstKey = Provider.of<StateData>(context).addToList(1);
    int secondKey = Provider.of<StateData>(context).addToList(2);
    print(firstKey);
    print(secondKey);

    Function increase = Provider.of<StateData>(context).increase;

    return Start();



    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text( Provider.of<StateData>(context).meselen[firstKey].count.toString()),
    //   ),
    //   body: Center(
    //     child: Column(children: [
    //       FloatingActionButton(
    //         onPressed: () {
    //           increase(secondKey);
    //         },
    //         tooltip: 'Increment',
    //         child: const Icon(Icons.add),
    //       ),
    //       Text( Provider.of<StateData>(context).meselen[secondKey].count.toString() )
    //     ],
    //     ),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}
