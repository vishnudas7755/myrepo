import 'package:test/items.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  List<Names> items = List.empty(growable: true);
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 2),
              Card(
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'Add something',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          String name = nameController.text.trim();
                          if (name.isNotEmpty) {
                            setState(() {
                              nameController.text = '';
                              items.add(Names(name: name));
                            });
                          }
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ))),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) => getRow(index),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              items[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: SizedBox(
          width: 40,
          child: Row(
            children: [
              InkWell(
                onTap: (() {
                  //
                  setState(() {
                    items.removeAt(index);
                  });
                }),
                child: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
