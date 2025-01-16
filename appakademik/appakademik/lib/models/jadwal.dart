class Jadwal {
  final int? id;
  final String namaMataKuliah;
  final String tanggal;
  final String jam;
  final String ruangan;

  Jadwal(
      {this.id,
      required this.namaMataKuliah,
      required this.tanggal,
      required this.jam,
      required this.ruangan});

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    return Jadwal(
        id: json['id'],
        namaMataKuliah: json['nama_matakuliah'],
        tanggal: json['tanggal'],
        jam: json['jam'],
        ruangan: json['ruangan']);
  }

  Map<String, dynamic> toJson() {
    return {
      'nama_matakuliah': namaMataKuliah,
      'tanggal': tanggal,
      'jam': jam,
      'ruangan': ruangan,
    };
  }
}
