import 'package:flutter/material.dart';

import 'counter_app_appbar.dart';

class AppBarExample {
  factory AppBarExample(AppBarDrawer drawer) =>
      _this ??= AppBarExample._(drawer);

  AppBarExample._(AppBarDrawer drawer) {
    // ignore: prefer_initializing_formals
    this.drawer = drawer;
  }
  static AppBarExample _this;
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
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.search,
                size: 26.0,
              ),
            )),
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.linear_scale_outlined,
            size: 26,
          ),
        ),
      ];
    } else {
      actions = null;
    }

    /// flexibleSpace
    if (drawer.flexibleSpace) {
      flexibleSpace = const Center(
          child: Text('This is behind the Title',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              )));
    } else {
      flexibleSpace = null;
    }

    /// bottom
    if (drawer.bottom) {
      bottom = PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: Container(
          color: Colors.orange,
          height: 16,
        ),
      );
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
      shape = const RoundedRectangleBorder(
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

    /// iconTheme
    if (drawer.iconTheme) {
      iconTheme = const IconThemeData(
        color: Colors.lightGreenAccent,
        opacity: 6,
        size: 56,
      );
    } else {
      iconTheme = null;
    }

    /// actionsIconTheme
    if (drawer.actionsIconTheme) {
      actionsIconTheme = const IconThemeData(
        color: Colors.amber,
        opacity: 6,
        size: 56,
      );
    } else {
      actionsIconTheme = null;
    }

    /// textTheme
    if (drawer.textTheme) {
      textTheme = const TextTheme(
          headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14, fontFamily: 'Hind'));
    } else {
      textTheme = null;
    }

    /// primary
    primary = drawer.primary;

    /// centerTitle
    centerTitle = drawer.centerTitle;

    /// actionsIconTheme
    if (drawer.actionsIconTheme) {
      actionsIconTheme =
          const IconThemeData(size: 30, color: Colors.red, opacity: 10);
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
