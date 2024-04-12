
import 'package:flutter/material.dart';

class breakfast_lunch_dinner extends StatefulWidget {
  const breakfast_lunch_dinner({super.key});

  @override
  State<breakfast_lunch_dinner> createState() => _breakfast_lunch_dinnerState();
}

class _breakfast_lunch_dinnerState extends State<breakfast_lunch_dinner> {
  var selected = 0;
  Color color=Color(0xFF2ecc71);
  Widget buildcategoies() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: ['Breakfast', 'Lunch', 'Dinner', 'Snacks']
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
                      color: selected == key ? color : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: selected == key ? color: color,
                        width: 2,
                      ),

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
