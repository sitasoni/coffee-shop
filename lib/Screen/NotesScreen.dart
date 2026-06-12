import 'package:coffee_shop/Widget/CustomStyle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();

  final TextEditingController _title = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();
}

class _NotesScreenState extends State<NotesScreen> {
  var title = TextEditingController();
  var dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 40,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, size: 25),
                  ),
                  Text("Notes", style: customStyle().copyWith(fontSize: 21)),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.add, size: 25, color: Colors.white),
                  ),
                ],
              ),
            ),

            // Divider(thickness: 1, color: Colors.grey),
            SizedBox(height: 50),

            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title", style: customStyle()),
                  TextFormField(
                    // validator: ,
                    controller: widget._title,
                    decoration: InputDecoration(
                      hintText: "Enter Title",
                      // border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 20),

                  Text("Description", style: customStyle()),
                  TextFormField(
                    // validator: ,
                    controller: widget._desc,
                    decoration: InputDecoration(
                      hintText: "Enter Description",
                      // border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 20),

                  Text("Date", style: customStyle()),
                  TextFormField(
                    controller: widget._date,
                    decoration: InputDecoration(
                      hintText: "Date",
                      suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030),
                          );

                          if (date != null) {
                            print("Date : ${date.day}");
                          }
                        },
                        icon: Icon(Icons.date_range),
                      ),
                      // border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 20),

                  Text("Time", style: customStyle()),
                  TextFormField(
                    controller: widget._time,
                    decoration: InputDecoration(
                      hintText: "Time",
                      suffixIcon: IconButton(
                        onPressed: () async {
                          TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            initialEntryMode: TimePickerEntryMode.input,
                          );
                        },
                        icon: Icon(Icons.timelapse),
                      ),
                      // border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 30),

                  // Text('Time : ${dateTime}', style: customStyle(),),
                  Text(
                    'Time : ${DateFormat('jms').format(dateTime)}',
                    style: customStyle(),
                  ),

                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        print("test");
                        setState(() {
                          dateTime = DateTime.now();
                        });
                      },
                      child: Text("Add to List"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
