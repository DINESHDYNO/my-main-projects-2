import 'package:cofi_ui_design/main.dart';
import 'package:flutter/material.dart';

class AddToCartCard extends StatelessWidget {
  const AddToCartCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      alignment: Alignment.center,
      height: 60,
      width: double.infinity,
      decoration:
          BoxDecoration(color: cgreen, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Add to cart     ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18)),
          SizedBox(
            height: 20,
            child: VerticalDivider(
              color: Colors.white,
              thickness: 2,
            ),
          ),
          Text('    \$ 14',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18)),
        ],
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  var selected = 0;

  Widget buildcategoies() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: ['Small', 'Medium', 'Large',]
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
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 8,
                                offset: const Offset(3, 5),
                              ),
                            ],
                            color: selected == key ? cgreen : Colors.white,
                            borderRadius: BorderRadius.circular(30)),
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
