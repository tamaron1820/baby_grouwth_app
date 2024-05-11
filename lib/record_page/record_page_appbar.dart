import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordAppBarPage extends StatelessWidget implements PreferredSizeWidget {
  final DateTime selectedDate;
  final int daysInMonth;
  final ValueChanged<DateTime> onMonthChange;
  final ValueChanged<DateTime> onDaySelected;

  const RecordAppBarPage({
    Key? key,
    required this.selectedDate,
    required this.daysInMonth,
    required this.onMonthChange,
    required this.onDaySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 30,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => onMonthChange(
                        DateTime(selectedDate.year, selectedDate.month - 1)),
                    iconSize: 15,
                  ),
                ),
                Text(
                  DateFormat.yMMMM('ja_JP').format(selectedDate),
                  style: const TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 30,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () => onMonthChange(
                        DateTime(selectedDate.year, selectedDate.month + 1)),
                    iconSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: daysInMonth,
                itemBuilder: (context, index) {
                  DateTime day = DateTime(
                      selectedDate.year, selectedDate.month, index + 1);
                  return InkWell(
                    onTap: () => onDaySelected(day),
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 1}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
