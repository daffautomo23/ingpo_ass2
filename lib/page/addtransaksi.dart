
import 'package:flutter/material.dart';

class AddTransaksiPage extends StatelessWidget {
  final List<String> tukangOjekList = ['a', 'b', 'c']; // sesuaikan dengan data kalian ges
  final TextEditingController hargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Transaksi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              items: tukangOjekList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Implement logic when a tukang ojek is selected
              },
              decoration: InputDecoration(
                labelText: 'Tukang Ojek',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: hargaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Harga',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement logic for saving transaction to the database
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

