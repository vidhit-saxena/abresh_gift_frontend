import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ManageAccountScreen extends StatefulWidget {
  @override
  _ManageAccountScreenState createState() => _ManageAccountScreenState();
}

class _ManageAccountScreenState extends State<ManageAccountScreen> {
  String id = '6718a4cb03284cd5df3e307c'; // Replace with actual account ID
  Map<String, dynamic> account = {};
  final _formKey = GlobalKey<FormState>();

  Future<void> fetchAccount() async {
    final response = await http.get(Uri.parse('http://192.168.1.3:5000/api/account/$id'));
    if (response.statusCode == 200) {
      setState(() {
        account = json.decode(response.body);
      });
    } else {
      // Error handling
    }
  }

  Future<void> updateAccount(Map<String, dynamic> updatedData) async {
    final response = await http.put(
      Uri.parse('http://192.168.1.3:5000/api/account/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updatedData),
    );
    if (response.statusCode == 200) {
      // Success handling
    } else {
      // Error handling
    }
  }

  Future<void> deleteAccount() async {
    final response = await http.delete(Uri.parse('http://192.168.1.3:5000/api/account/$id'));
    if (response.statusCode == 200) {
      // Success handling
    } else {
      // Error handling
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Account'),
      ),
      body: account.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    // Name Input
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          initialValue: account['name'],
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) => account['name'] = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    // Email Input
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          initialValue: account['email'],
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) => account['email'] = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    // Phone Number Input
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          initialValue: account['phoneNumber'],
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) => account['phoneNumber'] = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    // Address Input
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          initialValue: account['address'],
                          decoration: InputDecoration(
                            labelText: 'Address',
                            prefixIcon: Icon(Icons.home),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) => account['address'] = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Update Button
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          updateAccount(account);
                        }
                      },
                      icon: Icon(Icons.update),
                      label: Text('Update Account'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    // Delete Button
                    OutlinedButton.icon(
                      onPressed: deleteAccount,
                      icon: Icon(Icons.delete, color: Colors.red),
                      label: Text('Delete Account', style: TextStyle(color: Colors.red)),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        side: BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ManageAccountScreen extends StatefulWidget {
//   @override
//   _ManageAccountScreenState createState() => _ManageAccountScreenState();
// }

// class _ManageAccountScreenState extends State<ManageAccountScreen> {
//   // String id = 'account_id'; // Replace with actual account ID
//   String id = '6718a4cb03284cd5df3e307c'; // Replace with actual account ID
//   Map<String, dynamic> account = {};

//   Future<void> fetchAccount() async {
//     final response = await http.get(Uri.parse('http://192.168.1.3:5000/api/account/$id'));
//     if (response.statusCode == 200) {
//       setState(() {
//         account = json.decode(response.body);
//       });
//     } else {
//       // Error handling
//     }
//   }

//   Future<void> updateAccount(Map<String, dynamic> updatedData) async {
//     final response = await http.put(
//       Uri.parse('http://192.168.1.3:5000/api/account/$id'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(updatedData),
//     );
//     if (response.statusCode == 200) {
//       // Success handling
//     } else {
//       // Error handling
//     }
//   }

//   Future<void> deleteAccount() async {
//     final response = await http.delete(Uri.parse('http://192.168.1.3:5000/api/account/$id'));
//     if (response.statusCode == 200) {
//       // Success handling
//     } else {
//       // Error handling
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchAccount();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Manage Account'),
//       ),
//       body: account.isNotEmpty
//           ? Column(
//               children: [
//                 TextField(
//                   controller: TextEditingController(text: account['name']),
//                   decoration: InputDecoration(labelText: 'Name'),
//                   onChanged: (value) => account['name'] = value,
//                 ),
//                 TextField(
//                   controller: TextEditingController(text: account['email']),
//                   decoration: InputDecoration(labelText: 'Email'),
//                   onChanged: (value) => account['email'] = value,
//                 ),
//                 ElevatedButton(
//                   onPressed: () => updateAccount(account),
//                   child: Text('Update Account'),
//                 ),
//                 ElevatedButton(
//                   onPressed: deleteAccount,
//                   child: Text('Delete Account'),
//                 ),
//               ],
//             )
//           : Center(child: CircularProgressIndicator()),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class ManageAccountScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Manage Account')),
//       body: const Center(child: Text('Account management goes here')),
//     );
//   }
// }