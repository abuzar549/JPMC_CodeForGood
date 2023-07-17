import 'package:dhulikona_app/screen1.dart';
import 'package:dhulikona_app/utils/toast.dart';
import 'package:flutter/material.dart';

class CommitteePage extends StatefulWidget {
  const CommitteePage({super.key});

  @override
  State<CommitteePage> createState() => _CommitteePageState();
}

class _CommitteePageState extends State<CommitteePage> {
  bool status = false;
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Table(
                border: TableBorder.all(color: Colors.black),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      children: [
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(child: Text('Impurity')),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(child: Text('Quantity')),
                        ))
                      ]),
                  TableRow(children: [
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: Text('Chlorine')),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: TextFormField()),
                    ))
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: Text('Iron')),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: TextFormField()),
                    ))
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: Text('Zinc')),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: TextFormField()),
                    ))
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: Text('Sodium')),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: TextFormField()),
                    ))
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: Text('Magnesium')),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: TextFormField()),
                    ))
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: Text('Calcium')),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: TextFormField()),
                    ))
                  ]),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Utils().toastMessage('Submitted');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen1()));
                },
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Text(
                      'UPLOAD',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
