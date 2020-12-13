import 'package:flutter/material.dart';

import 'package:set_state/set_state.dart';

class BottomSetting {
  factory BottomSetting(Brightness brightness, Function(Brightness v) func) =>
      _this ??= BottomSetting._(brightness, func);
  static BottomSetting _this;
  BottomSetting._(Brightness brightness, Function(Brightness v) func) {
    radio = GroupValue<Brightness>(brightness, func);
  }
  GroupValue radio;
  Column get radioButtons {
    return Column(children: [
      Text('Brightness'),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Light'),
          Radio(
            value: Brightness.light,
            groupValue: radio.groupValue,
            onChanged: (v) => radio.onChanged(v),
          ),
          Text('Dark'),
          Radio(
            value: Brightness.dark,
            groupValue: radio.groupValue,
            onChanged: (v) => radio.onChanged(v),
          ),
        ],
      ),
    ]);
  }
}

class BrightnessSetting {
  factory BrightnessSetting(Brightness brightness, Function(Brightness v) func) =>
      _this ??= BrightnessSetting._(brightness, func);
  static BrightnessSetting _this;
  BrightnessSetting._(Brightness brightness, Function(Brightness v) func) {
    radio = GroupValue<Brightness>(brightness, func);
  }
  GroupValue radio;
  Column get radioButtons {
    return Column(children: [
      Text('Brightness'),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Light'),
          Radio(
            value: Brightness.light,
            groupValue: radio.groupValue,
            onChanged: (v) => radio.onChanged(v),
          ),
          Text('Dark'),
          Radio(
            value: Brightness.dark,
            groupValue: radio.groupValue,
            onChanged: (v) => radio.onChanged(v),
          ),
        ],
      ),
    ]);
  }
}

class GroupValue<E> {
  GroupValue(this.groupValue, this.func) {
    // Retrieve the most recent SetState object instantiated.
    state = StateSet.of();
  }
  E groupValue;
  final Function(E v) func;
  StateSet state;

  void onChanged<T>(T v) => state?.setState(() {
    var value = v as E;
    groupValue = value;
    func(value);
  });
}