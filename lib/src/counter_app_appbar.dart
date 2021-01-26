import 'package:flutter/material.dart';

import 'package:set_state/set_state.dart';

import 'package:counter_app_appbar/src/appbar_example.dart';

import 'package:counter_app_appbar/src/appbar_settings.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
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
            const Text(
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
        child: const Icon(Icons.add),
      ),
    );
  }

  int onPressed() => _counter++;
}

class AppBarDrawer {
  AppBarDrawer() : state = SetState.of<MyHomePageState>() {
    _example = AppBarExample(this);
  }

  final MyHomePageState state;
  AppBarExample _example;

  /// Called in a Widget's build function.
  void build(BuildContext context) {
    _example.buildAppMenu();
  }

  PreferredSizeWidget get appBar => _example.appBar;

  Widget get drawer => Drawer(
    child: ListView(
      children: <Widget>[
        _leading,
        _automaticallyImplyLeading,
        _title,
        _actions,
        _flexibleSpace,
        _bottom,
        _elevation,
        _shadowColor,
        _shape,
        _backgroundColor,
        _brightness,
        _iconTheme,
        _actionsIconTheme,
        _textTheme,
        _primary,
        _centerTitle,
        _excludeHeaderSemantics,
        _titleSpacing,
        _toolbarOpacity,
        _bottomOpacity,
        _toolbarHeight,
        _leadingWidth,
      ],
    ),
  );

  Widget get _leading => switchFunc('leading', leading, (v) => leading = v);

  Widget get _automaticallyImplyLeading => switchFunc(
      'automaticallyImplyLeading',
      automaticallyImplyLeading,
          (v) => automaticallyImplyLeading = v);

  Widget get _title => switchFunc('title', title, (v) => title = v);

  Widget get _actions => switchFunc('actions', actions, (v) => actions = v);

  Widget get _flexibleSpace =>
      switchFunc('flexibleSpace', flexibleSpace, (v) => flexibleSpace = v);

  Widget get _bottom => switchFunc('bottom', bottom, (v) => bottom = v);

  Widget get _elevation => sliderFunc(
    'elevation',
    elevation,
        (v) => elevation = v,
  );

  Widget get _shadowColor =>
      switchFunc('shadowColor', shadowColor, (v) => shadowColor = v);

  Widget get _shape => switchFunc('shape', shape, (v) => shape = v);

  Widget get _backgroundColor => switchFunc(
      'backgroundColor', backgroundColor, (v) => backgroundColor = v);

  Widget get _brightness {
    if (brightness == null) {
      final theme = Theme.of(state.context);
      final appBarTheme = AppBarTheme.of(state.context);
      brightness = appBarTheme.brightness ?? theme.primaryColorBrightness;
    }
    return BrightnessSetting(brightness, (v) => brightness = v).radioButtons;
  }

  Widget get _iconTheme =>
      switchFunc('iconTheme', iconTheme, (v) => iconTheme = v);

  Widget get _actionsIconTheme => switchFunc(
      'actionsIconTheme', actionsIconTheme, (v) => actionsIconTheme = v);

  Widget get _textTheme => switchFunc(
      'textTheme', textTheme, (v) => textTheme = v);

  Widget get _primary => switchFunc('primary', primary, (v) => primary = v);

  Widget get _centerTitle =>
      switchFunc('centerTitle', centerTitle, (v) => centerTitle = v);

  Widget get _excludeHeaderSemantics => switchFunc('excludeHeaderSemantics',
      excludeHeaderSemantics, (v) => excludeHeaderSemantics = v);

  Widget get _titleSpacing => sliderFunc(
    'titleSpacing',
    titleSpacing,
        (v) => titleSpacing = v,
    min: 0,
    max: 24,
    divisions: 5,
  );

  Widget get _toolbarOpacity => sliderFunc(
    'toolbarOpacity',
    toolbarOpacity,
        (v) => toolbarOpacity = v,
    min: 0,
    max: 1,
    divisions: 5,
  );

  Widget get _bottomOpacity => sliderFunc(
    'bottomOpacity',
    bottomOpacity,
        (v) => bottomOpacity = v,
    min: 0,
    max: 1,
    divisions: 5,
  );

  Widget get _toolbarHeight => sliderFunc(
    'toolbarHeight',
    toolbarHeight,
        (v) => toolbarHeight = v,
    min: 56,
    max: 106,
    divisions: 8,
  );

  Widget get _leadingWidth => sliderFunc(
    'leadingWidth',
    leadingWidth,
        (v) => leadingWidth = v,
    min: 56,
    max: 106,
    divisions: 8,
    round: true,
  );

  /// Return the Drawer icon as well as increment the counter.
  void onPressed() {
    automaticallyImplyLeading = true;
    _example.onTap();
    state.setState(() {});
  }

  // ignore: avoid_positional_boolean_parameters
  Widget switchFunc(String title, bool value, void Function(bool v) func) =>
      SwitchListTile(
        title: Text(title),
        value: value,
        onChanged: (v) {
          func(v);
          state.setState(() {});
        },
      );

  Widget sliderFunc(
      String title,
      double value,
      double Function(double v) func, {
        double min = 4.0,
        double max = 16.0,
        int divisions = 2,
        bool round = false,
      }) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        ),
        Slider(
          value: round ? value.roundToDouble() : value,
          min: min,
          max: max,
          divisions: divisions,
          label: round ? value.round().toString() : value.toString(),
          onChanged: (v) {
            func(v);
            state.setState(() {});
          },
        )
      ]);

  bool leading = false;
  bool automaticallyImplyLeading = true;
  bool title = true;
  bool actions = false;
  bool flexibleSpace = false;
  bool bottom = false;
  double elevation = 4;
  bool shadowColor = false;
  bool shape = false;
  bool backgroundColor = false;
  Brightness brightness;
  bool iconTheme = false;
  bool actionsIconTheme = false;
  bool textTheme = false;
  bool primary = true;
  bool centerTitle = false;
  bool excludeHeaderSemantics = false;
  double titleSpacing = 16;
  double toolbarOpacity = 1;
  double bottomOpacity = 1;
  double toolbarHeight = 56;
  double leadingWidth = 56;
}
