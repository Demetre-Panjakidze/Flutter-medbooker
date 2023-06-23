import 'package:flutter/material.dart';

class MbDrawer extends StatefulWidget {
  const MbDrawer({super.key});

  @override
  State<MbDrawer> createState() => _MbDrawerState();
}

class _MbDrawerState extends State<MbDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Navigation')),
          InkWell(
            child: const ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
            ),
            onTap: () {},
          ),
          InkWell(
            child: const ListTile(
              leading: Icon(Icons.medical_services_outlined),
              title: Text('Doctors'),
            ),
            onTap: () {},
          ),
          InkWell(
            child: const ListTile(
              leading: Icon(Icons.arrow_upward_rounded),
              title: Text('Upcoming Consultations'),
            ),
            onTap: () {},
          ),
          InkWell(
            child: const ListTile(
              leading: Icon(Icons.healing_outlined),
              title: Text('Health Records'),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
