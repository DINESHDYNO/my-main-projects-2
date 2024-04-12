import 'package:flutter/material.dart';
import '../../../models/spotlight_best_top_food.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/ui_helper.dart';
import '../../../widgets/custom_divider_view.dart';
import '../../../widgets/mobile/search_food_list_item_view.dart';
import '../swiggy/trending search page.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String _selectedTabText = 'KITCHENS';
  List<dynamic> categories = ['KITCHENS', 'DISHES'];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        _selectedTabText = categories[_tabController!.index];
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.only(top: 2.0, bottom: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon:const  Icon(Icons.search,color: Colors.black,),
                          hintText: 'Search for kitchens and food',
                          hintStyle:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: Colors.grey,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpaceMedium(),
                    IconButton(
                      icon: const Icon(Icons.mic),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpaceExtraSmall(),
              TabBar(
                physics:const NeverScrollableScrollPhysics(),
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                controller: _tabController,
                indicatorColor: darkOrange,
                labelStyle: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 17.0, color: darkOrange,fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                Theme.of(context).textTheme.subtitle2!.copyWith(
                  fontSize: 17.0,
                  color: Colors.grey[200],
                  fontWeight: FontWeight.w400
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: categories.map((category) => Tab(text: category)).toList(),
              ),
              UIHelper.verticalSpaceSmall(),
              const CustomDividerView(dividerHeight: 8.0),
              UIHelper.verticalSpaceMedium(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                    'TRENDING $_selectedTabText',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 15.0,fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _SearchListView(selectedTabText: _selectedTabText),
                    _SearchListView(selectedTabText: _selectedTabText),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchListView extends StatelessWidget {
  final String selectedTabText; // Add this line
  final List<SpotlightBestTopFood> foods = [
    ...SpotlightBestTopFood.getPopularAllRestaurants(),
    ...SpotlightBestTopFood.getPopularAllRestaurants()
  ];

  // Add this constructor
  _SearchListView({required this.selectedTabText});

  @override
  Widget build(BuildContext context) {
    foods.shuffle();
    return ListView(
      physics:const BouncingScrollPhysics(),
     // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TrendingSearchPage(),
        const CustomDividerView(dividerHeight: 8.0),
        UIHelper.verticalSpaceSmall(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'POPULAR $selectedTabText', // Use the parameter here
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        ),
        UIHelper.verticalSpaceSmall(),
        Expanded(
          child: ListView.builder(
            physics:const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: foods.length,
            itemBuilder: (context, index) => SearchFoodListItemView(
              food: foods[index],
            ),
          ),
        ),
      ],
    );
  }
}
