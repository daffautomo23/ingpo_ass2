import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '';
import '';
// import page kalian ges

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _sortByName = false; // default sorting mode by jumlahOrder

  final List<Map<String, dynamic>> dummyData = [
    {'nama': 'a', 'jumlahOrder': 1, 'omzet': 2000},
    {'nama': 'b', 'jumlahOrder': 2, 'omzet': 5000},
    {'nama': 'c', 'jumlahOrder': 3, 'omzet': 14000},
    //databasesnya diganti ges
    // List of dummy data, you'll replace this with actual data fetched from the database
  ];

  @override
  void initState() {
    super.initState();
    _loadSortingMode();
  }

  Future<void> _loadSortingMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _sortByName = prefs.getBool('sortByName') ?? false;
    });
  }

  Future<void> _toggleSortingMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _sortByName = !_sortByName;
      prefs.setBool('sortByName', _sortByName);
    });
  }

  List<Map<String, dynamic>> _sortData(List<Map<String, dynamic>> data) {
    if (_sortByName) {
      data.sort((a, b) => a['nama'].compareTo(b['nama']));
    } else {
      data.sort((a, b) => a['jumlahOrder'].compareTo(b['jumlahOrder']));
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sortedData = _sortData(dummyData);

    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: ListView.builder(
        itemCount: sortedData.length,
        itemBuilder: (context, index) {
          final tukangOjek = sortedData[index];
          return ListTile(
            title: Text(tukangOjek['nama']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jumlah Order: ${tukangOjek['jumlahOrder']}'),
                Text('Omzet: ${tukangOjek['omzet']}'),
              ],
            ),
            // Implement logic for handling tap on each item
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTukangOjekPage(),
                ),
              );
            },
            tooltip: 'Tambah Tukang Ojek',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTransaksiPage(),
                ),
              );
            },
            tooltip: 'Tambah Transaksi',
            child: Icon(Icons.add_shopping_cart),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _toggleSortingMode();
            },
            child: Text('Ubah Urutan'),
          ),
        ],
      ),
    );
  }
}
