import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
        backgroundColor: const Color.fromARGB(255, 212, 134, 224),
        foregroundColor: const Color.fromARGB(255, 86, 3, 86),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Student Data"),
                content: Column(
                  children: [
                    TextFormField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 230, 137, 253),
                        filled: true,
                        label: Text(
                          "Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: phonenumbercontroller,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 230, 136, 253),
                        filled: true,
                        label: Text(
                          "Phone Number",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 230, 131, 255),
                        filled: true,
                        label: Text(
                          "Email",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        screen(
                          username: namecontroller.text,
                          email: emailcontroller.text,
                          phonenumber: phonenumbercontroller.text,
                          context: context,
                        );
                      },
                      child: Text(
                        "Add Student Data",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: const Color.fromARGB(255, 218, 124, 231),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: fetchstudent(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(color: Colors.amber),
            );
          }
          final studentdata = snapshot.data!.docs;
          return ListView.builder(itemCount: studentdata.length,
            itemBuilder: (context, Index) {
              return ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                    IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                  ],
                ),
                title: Text(studentdata[Index]['Name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(studentdata[Index]['Email']),
                    Text(studentdata[Index]['phonenumber']),
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
