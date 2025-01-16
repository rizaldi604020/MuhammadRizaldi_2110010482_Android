// import 'package:appakademik/views/homescreen.dart';

// import 'views/matakuliah_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'views/mahasiswa_view01.dart';
import 'views/homescreen.dart';

void main() {
  runApp(const Aplikasiku());
}

class Aplikasiku extends StatelessWidget {
  const Aplikasiku({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mahasiswa App',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: Homescreen(),
    );
  }
}
