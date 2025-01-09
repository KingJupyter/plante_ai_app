import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.grid_view,
                color: _selectedIndex == 0 ? Colors.green : Colors.black,
              ),
              onPressed: () => _onItemTapped(0),
            ),
            const SizedBox(width: 60), // Space for the FAB
            IconButton(
              icon: Icon(
                Icons.checklist,
                color: _selectedIndex == 1 ? Colors.green : Colors.black,
              ),
              onPressed: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            // Action for FAB
          },
          shape: const CircleBorder(),
          backgroundColor: Colors.green,
          child:
              const Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
