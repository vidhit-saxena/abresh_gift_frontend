import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ManageAddressScreen extends StatefulWidget {
  @override
  _ManageAddressScreenState createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> {
  List addresses = [];
  final String apiUrl = "http://192.168.1.6:5000/api/addresses";

  @override
  void initState() {
    super.initState();
    fetchAddresses();
  }

  fetchAddresses() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      setState(() {
        addresses = json.decode(response.body);
      });
    }
  }

  deleteAddress(String id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));
    if (response.statusCode == 200) {
      fetchAddresses(); // Refresh the list after deletion
    }
  }

  addAddress(String name, String street, String city, String zip) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "name": name,
        "street": street,
        "city": city,
        "zip": zip,
      }),
    );
    if (response.statusCode == 201) {
      fetchAddresses(); // Refresh the list after adding
    }
  }

  showDeleteConfirmationDialog(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Address'),
          content: Text('Are you sure you want to delete this address?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                deleteAddress(id);
                Navigator.pop(context); // Close dialog after delete
              },
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Addresses'),
      ),
      body: addresses.isEmpty
          ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          ) // Show loader when list is empty
          : ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final address = addresses[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(address['name']),
                    subtitle: Text(
                        '${address['street']}, ${address['city']}, ${address['zip']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        showDeleteConfirmationDialog(context, address['_id']);
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String name = '', street = '', city = '', zip = '';
              return AlertDialog(
                title: Text('Add Address'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: 'Name'),
                      onChanged: (val) => name = val,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Street'),
                      onChanged: (val) => street = val,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'City'),
                      onChanged: (val) => city = val,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Zip Code'),
                      onChanged: (val) => zip = val,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog without adding
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      addAddress(name, street, city, zip);
                      Navigator.pop(context); // Close dialog after adding
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class ManageAddressScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Manage Addresses')),
//       body: const Center(child: Text('Addresses management goes here')),
//     );
//   }
// }