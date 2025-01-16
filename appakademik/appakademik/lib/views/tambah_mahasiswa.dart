import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/mahasiswa.dart';
import '../controllers/mahasiswa_controller.dart';

class TambahMahasiswaView extends StatelessWidget {
  final MahasiswaController controller = Get.find();

  final TextEditingController npmController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tempatLahirController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController sexController = TextEditingController();

  TambahMahasiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Mahasiswa"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: npmController,
              decoration: InputDecoration(labelText: "NPM"),
            ),
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: telpController,
              decoration: InputDecoration(labelText: "Telepon"),
            ),
            TextField(
              controller: alamatController,
              decoration: InputDecoration(labelText: "Alamat"),
            ),
            TextField(
              controller: tempatLahirController,
              decoration: InputDecoration(labelText: "Tempat Lahir"),
            ),
            TextField(
              controller: tanggalLahirController,
              decoration:
                  InputDecoration(labelText: "Tanggal Lahir (YYYY-MM-DD)"),
            ),
            TextField(
              controller: sexController,
              decoration: InputDecoration(labelText: "Jenis Kelamin (L/P)"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                final mahasiswa = Mahasiswa(
                  npm: npmController.text,
                  nama: namaController.text,
                  email: emailController.text,
                  telp: telpController.text,
                  tempatLahir: tempatLahirController.text,
                  tanggalLahir: tanggalLahirController.text,
                  sex: sexController.text,
                  alamat: alamatController.text,
                  photo: null, //url foto
                );
                controller.addMahasiswa(mahasiswa);
                Get.back(); //kembali ke halaman mahasiswa
              },
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
