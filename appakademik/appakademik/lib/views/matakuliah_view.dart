import 'package:flutter/material.dart';
import '../controllers/matakuliah_controller.dart';
import '../models/mata_kuliah.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class MatakuliahView extends StatefulWidget {
  @override
  _MatakuliahViewState createState() => _MatakuliahViewState();
}

class _MatakuliahViewState extends State<MatakuliahView> {
  late Future<List<MataKuliah>> futureMataKuliah;

  @override
  void initState() {
    super.initState();
    futureMataKuliah = ApiService().fetchMataKuliah();
  }

  Future<void> generatePdf(List<MataKuliah> mataKuliahs) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Laporan Matakuliah', style: pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 20), // Pemisah vertikal
              pw.Table.fromTextArray(
                headers: ['Kode', 'Matakuliah', 'SKS', 'Semester'],
                data: mataKuliahs.map((mataKuliah) {
                  return [
                    mataKuliah.kode,
                    mataKuliah.matakuliah,
                    mataKuliah.sks.toString(),
                    mataKuliah.semester.toString()
                  ];
                }).toList(),
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  Future<void> _showForm(BuildContext context, {MataKuliah? matakuliah}) async {
    final kodeController = TextEditingController(text: matakuliah?.kode);
    final matakuliahController =
        TextEditingController(text: matakuliah?.matakuliah);
    final sksController = TextEditingController(
        text: matakuliah != null ? matakuliah.sks.toString() : '');
    final semesterController = TextEditingController(
        text: matakuliah != null ? matakuliah.semester.toString() : '');

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
              matakuliah == null ? 'Tambah Mata Kuliah' : 'Ubah Mata Kuliah'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: kodeController,
                decoration: InputDecoration(labelText: 'Kode'),
              ),
              TextField(
                controller: matakuliahController,
                decoration: InputDecoration(labelText: 'Nama Mata Kuliah'),
              ),
              TextField(
                controller: sksController,
                decoration: InputDecoration(labelText: 'SKS'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: semesterController,
                decoration: InputDecoration(labelText: 'Semester'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (matakuliah == null) {
                  // Tambah Data
                  ApiService()
                      .createMataKuliah(MataKuliah(
                    id: 0,
                    kode: kodeController.text,
                    matakuliah: matakuliahController.text,
                    sks: int.parse(sksController.text),
                    semester: int.parse(semesterController.text),
                  ))
                      .then((_) {
                    Navigator.of(context).pop();
                    setState(() {
                      futureMataKuliah = ApiService().fetchMataKuliah();
                    });
                  });
                } else {
                  // Ubah Data
                  ApiService()
                      .updateMataKuliah(
                          matakuliah.id,
                          MataKuliah(
                            id: matakuliah.id,
                            kode: kodeController.text,
                            matakuliah: matakuliahController.text,
                            sks: int.parse(sksController.text),
                            semester: int.parse(semesterController.text),
                          ))
                      .then((_) {
                    Navigator.of(context).pop();
                    setState(() {
                      futureMataKuliah = ApiService().fetchMataKuliah();
                    });
                  });
                }
              },
              child: Text(matakuliah == null ? 'Tambah' : 'Ubah'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            )
          ],
        );
      },
    );
  }

  Future<void> _deleteMataKuliah(int id) async {
    await ApiService().deleteMataKuliah(id);
    setState(() {
      futureMataKuliah = ApiService().fetchMataKuliah(); //refresh data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matakuliah'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showForm(context),
          ),
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () async {
              List<MataKuliah> mataKuliahs = await futureMataKuliah;
              await generatePdf(mataKuliahs);
            },
          )
        ],
      ),
      body: FutureBuilder<List<MataKuliah>>(
        future: futureMataKuliah,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('ID Mata Kuliah Kosong'));
          }

          List<MataKuliah> mataKuliahs = snapshot.data!;
          return ListView.builder(
            itemCount: mataKuliahs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(mataKuliahs[index].matakuliah),
                subtitle: Text(
                    'Kode: ${mataKuliahs[index].kode}, SKS: ${mataKuliahs[index].sks}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () =>
                          _showForm(context, matakuliah: mataKuliahs[index]),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteMataKuliah(mataKuliahs[index].id);
                      },
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
