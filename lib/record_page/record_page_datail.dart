import 'package:flutter/material.dart';

class RecordPageDetail extends StatelessWidget {
  final DateTime selectedDate;

  const RecordPageDetail({Key? key, required this.selectedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Selected Date: ${selectedDate.toIso8601String()}',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
