import 'package:flutter/material.dart';
import '../../../../utils/ui_helper.dart';
import '../../../models/spotlight_best_top_food.dart';


class TrendingSearchPage extends StatelessWidget {

  final List<SpotlightBestTopFood> foods = [
    ...SpotlightBestTopFood.getPopularAllRestaurants(),
    ...SpotlightBestTopFood.getPopularAllRestaurants()
  ];

  TrendingSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      height: 130.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: foods.length,
        itemBuilder: (context, index) => InkWell(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    foods[index].image,
                    height: 80.0,
                    width: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
                UIHelper.verticalSpaceExtraSmall(),
                Text(
                  foods[index].name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.grey[700]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
