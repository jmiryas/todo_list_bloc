import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddEditTodoScreen extends StatelessWidget {
  final String title;

  const AddEditTodoScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.grey.shade600,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.task,
                    color: Colors.grey.shade600,
                  ),
                  hintText: "Enter task ...",
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(30.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(30.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(30.0))),
            ),
            const SizedBox(
              height: 20.0,
            ),
            DateTimePicker(
              initialValue: '',
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              onChanged: (val) {
                print(val);
              },
              validator: (val) {
                print(val);
                return null;
              },
              onSaved: (val) {
                print(val);
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.date_range_outlined,
                    color: Colors.grey.shade600,
                  ),
                  hintText: "Select date time ...",
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(30.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(30.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(30.0))),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40.0)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                            child: SizedBox(
                              width: width,
                              child: ColorPicker(
                                enableAlpha: false,
                                pickerColor: const Color(0xff443a49),
                                onColorChanged: (color) {},
                                showLabel: true,
                                pickerAreaHeightPercent: 0.8,
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: const Text("Select Color"))
          ],
        ),
      ),
    );
  }
}
