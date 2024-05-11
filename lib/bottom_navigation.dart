import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.note_add),
          label: '記録',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.summarize),
          label: 'まとめ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.forum),
          label: '相談',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up),
          label: '成長',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '設定',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: widget.onItemTapped,
    );
  }
}
