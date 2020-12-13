import 'package:flutter/material.dart';

import 'package:set_state/set_state.dart';

import 'package:counter_app_appbar/src/appbar_drawer.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends SetState<MyHomePage> {
  MyHomePageState() : super() {
    appDrawer = AppBarDrawer();
  }

  int _counter = 0;
  AppBarDrawer appDrawer;

  /// A GlobalKey allows you access to the the ScaffoldState
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    appDrawer.build(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: appDrawer.appBar,
      drawer: appDrawer.drawer,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          // The menu icon has disappeared. Bring it back.
          if (!appDrawer.leading && !appDrawer.automaticallyImplyLeading) {
            appDrawer.onPressed();
          } else {
            onPressed();
          }
        }),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  int onPressed() => _counter++;
}
