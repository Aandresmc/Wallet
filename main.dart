import 'package:flutter/material.dart';
import './ui/App.dart';

void main()=>runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    home: App(),
  )
);