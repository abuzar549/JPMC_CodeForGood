import 'package:dhulikona_app/screen1.dart';
import 'package:dhulikona_app/utils/toast.dart';
import 'package:dhulikona_app/utils/notifications.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  NotificationsServices notificationsServices = NotificationsServices();

  final _formKey = GlobalKey<FormState>();
  final streamcontroller = TextEditingController();
  bool status = false;
  String datetime = DateTime.now().toString();

  void send(String id) async {
    try {
      Response response = await post(
        Uri.parse('http://192.168.29.105/grievance'),
        body: jsonEncode({
          'serialNumber': id,
          'village': "Gurjan Kheri",
          'latitide': "",
          'longitutde': "",
          'issue': "",
          'date': datetime,
          'time': datetime
        }),
        headers: {
          "content-type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        Utils().toastMessage('Validated');
        setState(() {
          status = true;
        });
      } else {}
    } catch (e) {
      Utils().toastMessage(e.toString());
      setState(() {
        status = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationsServices.initialiseNotifications();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "DHULIKONA",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter your Scheme ID ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'আপোনাৰ আঁচনিৰ আইডি প্ৰবিষ্ট কৰক  ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: streamcontroller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Scheme ID',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(8))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Field cannot be Empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    notificationsServices.sendNotifications('DHULIKONA',
                        'Faced An Issue In The Water Supply Today? Report It Here!');
                    if (_formKey.currentState!.validate()) {
                      send(streamcontroller.toString());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Screen1()));
                    }
                  },
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(37)),
                    child: Center(
                        child: Text(
                      'CONTINUE',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
