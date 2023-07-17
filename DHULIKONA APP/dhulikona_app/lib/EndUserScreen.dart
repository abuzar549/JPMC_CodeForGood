import 'dart:convert';

import 'package:dhulikona_app/stream_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:dhulikona_app/utils/toast.dart';

class EndUSerScreen extends StatefulWidget {
  const EndUSerScreen({super.key});

  @override
  State<EndUSerScreen> createState() => _EndUSerScreenState();
}

class _EndUSerScreenState extends State<EndUSerScreen> {
  String issue = "no water";
  bool status = false;
  String datetime = DateTime.now().toString();

  void send(String issue) async {
    try {
      Response response = await post(
        Uri.parse('http://192.168.29.105/grievance'),
        body: jsonEncode({
          'serialNumber': 1,
          'village': "Gurjan Kheri",
          'latitide': "",
          'longitutde': "",
          'issue': issue,
          'date': datetime,
          'time': datetime
        }),
        headers: {
          "content-type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        Utils().toastMessage('Thank You');
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "PLEASE REPORT TODAY'S STATUS",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "অনুগ্ৰহ কৰি আজিৰ স্থিতিৰ প্ৰতিবেদন দিয়ক",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  send('No Water');

                  if (status) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StreamScreen()));
                  }
                },
                child: Container(
                  height: 220,
                  child: Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/cfgdb-d6777.appspot.com/o/Water.png?alt=media&token=b38216b6-150c-4db7-8133-9ebcde21cb27')),
                ),
              ),
              Text(
                'পানী নাই',
                style: TextStyle(fontSize: 25),
              ),
              InkWell(
                onTap: () {
                  send('Contaminated Water');

                  if (status == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StreamScreen()));
                  }
                },
                child: Container(
                  height: 220,
                  child: Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/cfgdb-d6777.appspot.com/o/water-pollution.png?alt=media&token=b38781ba-c220-4855-b442-d72a7eecd75f')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  'লেতেৰা পানী',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
