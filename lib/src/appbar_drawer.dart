import 'package:flutter/material.dart';

import 'counter_app_appbar.dart';

import 'appbar_settings.dart';

import 'package:set_state/set_state.dart';

class AppBarDrawer {
  AppBarDrawer() : state = SetState.of<MyHomePageState>() {
    _example = _AppBarExample(this);
  }
//  ThemeData theme;
//  AppBarTheme appBarTheme;
  final MyHomePageState state;
  _AppBarExample _example;

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

  Widget get _primary => switchFunc('primary', primary, (v) => primary = v);

  Widget get _centerTitle =>
      switchFunc('centerTitle', centerTitle, (v) => centerTitle = v);

  Widget get _excludeHeaderSemantics => switchFunc('excludeHeaderSemantics',
      excludeHeaderSemantics, (v) => excludeHeaderSemantics = v);

  Widget get _titleSpacing => sliderFunc(
        'titleSpacing',
        titleSpacing,
        (v) => titleSpacing = v,
        min: 0.0,
        max: 24.0,
        divisions: 5,
      );

  Widget get _toolbarOpacity => sliderFunc(
        'toolbarOpacity',
        toolbarOpacity,
        (v) => toolbarOpacity = v,
        min: 0.0,
        max: 1.0,
        divisions: 5,
      );

  Widget get _bottomOpacity => sliderFunc(
        'bottomOpacity',
        bottomOpacity,
        (v) => bottomOpacity = v,
        min: 0.0,
        max: 1.0,
        divisions: 5,
      );

  Widget get _toolbarHeight => sliderFunc(
        'toolbarHeight',
        toolbarHeight,
        (v) => toolbarHeight = v,
        min: 56.0,
        max: 106.0,
        divisions: 8,
      );

  Widget get _leadingWidth => sliderFunc(
        'leadingWidth',
        leadingWidth,
        (v) => leadingWidth = v,
        min: 56.0,
        max: 106.0,
        divisions: 8,
        round: true,
      );

  /// Return the Drawer icon as well as increment the counter.
  void onPressed() {
    automaticallyImplyLeading = true;
    _example.onTap();
    state.setState(() {});
  }

  Widget switchFunc(String title, bool value, Function(bool v) func) =>
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
    Function(double v) func, {
    min = 4.0,
    max = 16.0,
    divisions = 2,
    bool round = false,
  }) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
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
  double toolbarHeight = 56.0;
  double leadingWidth = 56.0;
}

class _AppBarExample {
  factory _AppBarExample(AppBarDrawer drawer) =>
      _this ??= _AppBarExample._(drawer);

  _AppBarExample._(AppBarDrawer drawer) {
    this.drawer = drawer;
  }
  static _AppBarExample _this;
  AppBarDrawer drawer;

  /// Build the menu.
  void buildAppMenu() {
    /// leading
    if (drawer.leading) {
      leading = IconButton(
        icon: const Icon(Icons.local_pizza_outlined),
        // This is the actual code to open your drawer by the way.
        onPressed: () => drawer.state.scaffoldKey.currentState.openDrawer(),
        tooltip: MaterialLocalizations.of(
                drawer.state.scaffoldKey.currentState.context)
            .openAppDrawerTooltip,
      );
    } else {
      leading = null;
    }

    /// automaticallyImplyLeading
    automaticallyImplyLeading = drawer.automaticallyImplyLeading;

    /// title
    if (drawer.title) {
      title = Text(drawer?.state?.widget?.title ?? '');
    } else {
      title = null;
    }

    /// actions
    if (drawer.actions) {
      actions = [
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: onTap,
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            )),
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(
            Icons.linear_scale_outlined,
            size: 26.0,
          ),
        ),
      ];
    } else {
      actions = null;
    }

    /// flexibleSpace
    if (drawer.flexibleSpace) {
      flexibleSpace = Center(
          child: Text("This is behind the Title",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              )));
    } else {
      flexibleSpace = null;
    }

    /// bottom
    if (drawer.bottom) {
      bottom = PreferredSize(
          child: Container(
            color: Colors.orange,
            height: 16.0,
          ),
          preferredSize: Size.fromHeight(4.0));
    } else {
      bottom = null;
    }

    /// elevation
    if (drawer.elevation > 0) {
      elevation = drawer.elevation;
    } else {
      elevation = null;
    }

    /// shadowColor
    if (drawer.shadowColor) {
      shadowColor = Colors.deepOrange;
    } else {
      shadowColor = null;
    }

    /// shape
    if (drawer.shape) {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      );
    } else {
      shape = null;
    }

    /// backgroundColor
    if (drawer.backgroundColor) {
      backgroundColor = Colors.greenAccent;
    } else {
      backgroundColor = null;
    }

    /// brightness
    brightness = drawer.brightness;

    /// primary
    primary = drawer.primary;

    /// centerTitle
    centerTitle = drawer.centerTitle;

    /// actionsIconTheme
    if (drawer.actionsIconTheme) {
      actionsIconTheme =
          IconThemeData(size: 30, color: Colors.red, opacity: 10);
    } else {
      actionsIconTheme = null;
    }

    /// titleSpacing
    titleSpacing = drawer.titleSpacing;

    /// toolbarOpacity
    toolbarOpacity = drawer.toolbarOpacity;

    /// bottomOpacity
    bottomOpacity = drawer.bottomOpacity;

    /// toolbarHeight
    toolbarHeight = drawer.toolbarHeight;

    /// leadingWidth
    leadingWidth = drawer.leadingWidth;
  }

  /// onTap()
  void onTap() => drawer.state.setState(drawer.state.onPressed);

  /// appBar getter
  PreferredSizeWidget get appBar => AppBar(
        key: key ?? UniqueKey(),
        leading: leading,
        automaticallyImplyLeading: automaticallyImplyLeading ?? true,
        title: title,
        actions: actions,
        flexibleSpace: flexibleSpace,
        bottom: bottom,
        elevation: elevation,
        shadowColor: shadowColor,
        shape: shape,
        backgroundColor: backgroundColor,
        brightness: brightness,
        iconTheme: iconTheme,
        actionsIconTheme: actionsIconTheme,
        textTheme: textTheme,
        primary: primary ?? true,
        centerTitle: centerTitle,
        excludeHeaderSemantics: excludeHeaderSemantics ?? false,
        titleSpacing: titleSpacing ?? NavigationToolbar.kMiddleSpacing,
        toolbarOpacity: toolbarOpacity ?? 1.0,
        bottomOpacity: bottomOpacity ?? 1.0,
        toolbarHeight: toolbarHeight,
        leadingWidth: leadingWidth,
      );

  Key key;
  Widget leading;
  bool automaticallyImplyLeading;
  Widget title;
  List<Widget> actions;
  Widget flexibleSpace;
  PreferredSizeWidget bottom;
  double elevation;
  Color shadowColor;
  ShapeBorder shape;
  Color backgroundColor;
  Brightness brightness;
  IconThemeData iconTheme;
  IconThemeData actionsIconTheme;
  TextTheme textTheme;
  bool primary;
  bool centerTitle;
  bool excludeHeaderSemantics;
  double titleSpacing;
  double toolbarOpacity;
  double bottomOpacity;
  double toolbarHeight;
  double leadingWidth;
}
