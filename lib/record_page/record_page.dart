import 'package:flutter/material.dart';
import 'record_page_appbar.dart';
import 'record_page_datail.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  RecordPageState createState() => RecordPageState();
}

class RecordPageState extends State<RecordPage> {
  DateTime selectedDate = DateTime.now();
  late int daysInMonth;

  @override
  void initState() {
    super.initState();
    updateDaysInMonth();
  }

  void updateDaysInMonth() {
    daysInMonth = DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
  }

  void onDaySelected(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
  }

  void _changeMonth(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
      updateDaysInMonth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: RecordAppBarPage(
          selectedDate: selectedDate,
          daysInMonth: daysInMonth,
          onDaySelected: onDaySelected,
          onMonthChange: _changeMonth,
        ),
      ),
      body: RecordPageDetail(selectedDate: selectedDate),
    );
  }
}
