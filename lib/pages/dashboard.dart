import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bodyHeight = constraints.maxHeight;
        return Column(
          children: [
            Container(
              height: bodyHeight / 2,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    height: bodyHeight / 18,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Consultation requests',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, int index) {
                            return ListTile(
                              leading: const CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey,
                              ),
                              title: const Text('User name'),
                              subtitle: const Text('date'),
                              focusColor: Colors.black12,
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.check),
                                      color: Colors.green,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.close),
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: bodyHeight / 20,
            ),
            InkWell(
              onTap: () {
                print('Upcoming consultations clicked');
              },
              child: Container(
                height: bodyHeight / 5,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Upcoming consultations',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: bodyHeight / 20,
            ),
            InkWell(
              onTap: () {
                print('Population clicked');
              },
              child: Container(
                height: bodyHeight / 5,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Population',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
