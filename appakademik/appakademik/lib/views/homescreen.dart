import 'package:flutter/material.dart';
import 'mahasiswa_view01.dart';
import 'matakuliah_view.dart';
import 'jadwal_view.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.lightGreenAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Image.network(
                    'https://static.vecteezy.com/system/resources/thumbnails/004/843/959/small_2x/admin-line-icon-isolated-on-white-background-eps10-free-vector.jpg',
                    fit: BoxFit.fill, // Memenuhi seluruh area
                    width: 100,
                    height: 90,
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people_rounded),
              title: Text('Mahasiswa'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer sebelum pindah halaman
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MahasiswaView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_user_sharp),
              title: Text('Mata Kuliah'),
              onTap: () {
                //handle setting tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MatakuliahView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Jadwal Kuliah'),
              onTap: () {
                //handle about tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JadwalPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'PRAKTIKUM MOBILE SEMESTER 7/8',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
