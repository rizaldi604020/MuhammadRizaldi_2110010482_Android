import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/mahasiswa_controller.dart';

class MahasiswaView extends StatelessWidget {
  MahasiswaView({super.key});
  final MahasiswaController controller = Get.put(MahasiswaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Mahasiswa"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              // Memastikan list mahasiswa telah terisi
              if (controller.mahasiswaList.isEmpty) {
                return Center(child: Text("Tidak ada data mahasiswa"));
              }

              return ListView.builder(
                itemCount: controller.mahasiswaList.length,
                itemBuilder: (context, index) {
                  final mahasiswa = controller.mahasiswaList[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mahasiswa.nama,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("NPM: ${mahasiswa.npm}"),
                          Text("Email: ${mahasiswa.email}"),
                          Text("Tempat Lahir: ${mahasiswa.tempatLahir}"),
                          Text("Tanggal Lahir: ${mahasiswa.tanggalLahir}"),
                          Text(
                              "Jenis Kelamin: ${mahasiswa.sex == 'Laki-Laki' ? 'Laki-Laki' : 'Perempuan'}"),
                          SizedBox(height: 10),
                          OverflowBar(
                            alignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: Text('Hapus'),
                                onPressed: () {
                                  controller.deleteMahasiswa(mahasiswa.id!);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
