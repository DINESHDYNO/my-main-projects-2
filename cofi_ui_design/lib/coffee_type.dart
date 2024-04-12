import 'package:cofi_ui_design/main.dart';
import 'package:flutter/material.dart';

class coffeetype extends StatefulWidget {
  const coffeetype({super.key});

  @override
  State<coffeetype> createState() => _coffeetypeState();
}

class _coffeetypeState extends State<coffeetype> {
  var selected = 0;

  Widget buildcategoies() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: ['Cappuccio', 'Cold Brew', 'Espresso', 'Hod coffe']
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = key;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(
                          value,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: selected == key
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                        ),
                        decoration: BoxDecoration(
                          color: selected == key ? cgreen : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 8,
                              offset: const Offset(3, 5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .values
              .toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          buildcategoies(),
        ],
      ),
    );
  }
}
