import 'package:flutter/material.dart';

abstract class Enum<T> {

  final T _value;

  const Enum(this._value);

  T get value => _value;
}

class Environment extends Enum<String> {

  const Environment(String value) : super(value);

  static const Environment DEVELOPMENT = Environment("");
  static const Environment PRODUCTION = Environment("");
}

final environment = Environment.DEVELOPMENT;

class Configs {

  static final language = Locale("en");

  static final kGoogleApiKey = "AIzaSyDN_tyt3qzw0OF_Gc8RvlWsvER4GKLHXLs";
}
