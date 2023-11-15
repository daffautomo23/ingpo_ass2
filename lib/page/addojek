import 'package:flutter/material.dart';

import '';
//sesuaikan dengan databases kalian ges

class AddTukangOjekPage extends StatelessWidget {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nomorPolisiController = TextEditingController();

  void _simpanDataKeDatabase() async {
    String nama = namaController.text;
    String nomorPolisi = nomorPolisiController.text;

    if (nama.isNotEmpty && nomorPolisi.isNotEmpty) {
      DatabaseHelper databaseHelper = DatabaseHelper();

      // Get the current timestamp as ID (You might want to use a more robust way to generate IDs)
      int id = DateTime.now().millisecondsSinceEpoch;

      await databaseHelper.insertTukangOjek(id.toString(), nama, nomorPolisi);
      
    } else {
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah  Ojek'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: nomorPolisiController,
              decoration: InputDecoration(
                labelText: 'Nomor Polisi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _simpanDataKeDatabase,
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
