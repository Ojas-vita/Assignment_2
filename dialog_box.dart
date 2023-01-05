import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final Controller;
  VoidCallback onSave;
  DialogBox({
    super.key,
    required this.Controller,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: Controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                hintText: "Create New Task",
                hintStyle: TextStyle(color: Colors.redAccent),
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onSave,
                  child: Icon(
                    Icons.save,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.cancel,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
