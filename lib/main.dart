import 'package:flutter/material.dart';
import ''; // Sesuaikan dengan lokasi berkas homepage.dart kalian ges

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Ojek',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(), // Ganti dengan halaman awal yang Anda buat
    );
  }
}
