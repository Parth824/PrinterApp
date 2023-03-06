import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:printer_my/printer_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {
      'title': "Cabury Dairy Milk",
      'price': 15,
      'qty': 2,
    },
    {
      'title': "Cabury Dairy Milk",
      'price': 15,
      'qty': 2,
    },
    {
      'title': "Cabury Dairy Milk",
      'price': 15,
      'qty': 2,
    },
    {
      'title': "Cabury Dairy Milk",
      'price': 15,
      'qty': 2,
    }
  ];
  final f = NumberFormat("\$###,###.00", "en_us");
  @override
  Widget build(BuildContext context) {
    int _total = 0;
    _total = data.map((e) => e['price'] * e['qty']).reduce(
          (value, element) => value + element,
        );
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter - Thermal Printer"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    data[index]['title'].toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                      "${f.format(data[index]['price'])} x ${data[index]['qty']} "),
                  trailing:
                      Text(f.format(data[index]['price'] * data[index]['qty'])),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  "Total : ${f.format(_total)}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrintPage(data),
                        ),
                      );
                    },
                    icon: Icon(Icons.print),
                    label: Text("Print"),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  
}
