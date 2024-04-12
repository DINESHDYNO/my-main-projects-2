import 'package:flutter/material.dart';

class UserFullProfilePage extends StatefulWidget {
  const UserFullProfilePage({Key? key}) : super(key: key);

  @override
  State<UserFullProfilePage> createState() => _UserFullProfilePageState();
}

class _UserFullProfilePageState extends State<UserFullProfilePage> {
  String currentButton = 'Full Profile';
  bool showFullProfile = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF9F0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
               height: 64,
              width: size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/images/37.png",
                      scale: 2.8,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    "assets/images/76.png",
                    scale: 5,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ramya Kishnan',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 24),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'krish104@gmail.com',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 140,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/76.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 0,),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            const Color(0xFFEE4B5F).withOpacity(0.63),
                            const Color(0xFFEE4B5F).withOpacity(0.63),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10,),
                            const Text(
                              "31 yrs,5 ft,Never Married judasimm",
                              style: TextStyle(color: Colors.white,fontFamily: "SFPRODISPLAYMEDIUM"),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Iseraelites (Yisraelism)",
                              style: TextStyle(color: Colors.white,fontFamily: "SFPRODISPLAYMEDIUM"),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentButton = 'Full Profile';
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                      decoration: BoxDecoration(
                                        color: currentButton == 'Full Profile'
                                            ? Colors.white
                                            : Colors.transparent,
                                        borderRadius:
                                        BorderRadius.circular(100),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: Text(
                                        'Full Profile',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: currentButton == 'Full Profile'
                                              ? const Color(0xFFEE4B5F)
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentButton = 'Preference';
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                      decoration: BoxDecoration(
                                        color: currentButton == 'Preference'
                                            ? Colors.white
                                            : Colors.transparent,
                                        borderRadius:
                                        BorderRadius.circular(100),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: Text(
                                        'Preference',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: currentButton == 'Preference'
                                              ? const Color(0xFFEE4B5F)
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentButton = 'Other Profile';
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                      decoration: BoxDecoration(
                                        color: currentButton == 'Other Profile'
                                            ? Colors.white
                                            : Colors.transparent,
                                        borderRadius:
                                        BorderRadius.circular(100),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: Text(
                                        'Other Profile',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color:
                                          currentButton == 'Other Profile'
                                              ? const Color(0xFFEE4B5F)
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (currentButton == 'Full Profile') Container() else
              Container(),
            if (currentButton == 'Preference') const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Preference",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ) else
              Container(),
            if (currentButton == 'Other Profile') const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Gallery",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),))
            else Container(),
            if (currentButton == 'Full Profile')
              Expanded(
                child: ListView(
                  children: [
                    _buildExpansionTile(
                        "About",
                        "I Am Looking For A Partner Who Will Be A Friend, Willing To Stand By Me At Every Stage Of My Life... Should Be Well Qualified, Intelligent And Understanding By Nature.",
                        "assets/images/43  1.png"),
                    _buildExpansionTile(
                        "Basic Information",
                        "But we cannot see anything when the tile is expanded. This is because we need to give the children parameter in ExpansionTile. Whatever widget we pass to the",
                        "assets/images/44.png"),
                    _buildExpansionTile(
                        "Contact Detailes",
                        "But we cannot see anything when the tile is expanded. This is because we need to give the children parameter in ExpansionTile. Whatever widget we pass to the",
                        "assets/images/45.png"),
                    _buildExpansionTile(
                        "Astronomic Information",
                        "But we cannot see anything when the tile is expanded. This is because we need to give the children parameter in ExpansionTile. Whatever widget we pass to the",
                        "assets/images/46.png"),
                    _buildExpansionTile(
                        "Physical Apperance",
                        "But we cannot see anything when the tile is expanded. This is because we need to give the children parameter in ExpansionTile. Whatever widget we pass to the",
                        "assets/images/47.png"),
                    _buildExpansionTile(
                        "Life Style",
                        "But we cannot see anything when the tile is expanded. This is because we need to give the children parameter in ExpansionTile. Whatever widget we pass to the",
                        "assets/images/48.png"),
                    _buildExpansionTile(
                        "Career Details",
                        "But we cannot see anything when the tile is expanded. This is because we need to give the children parameter in ExpansionTile. Whatever widget we pass to the",
                        "assets/images/49.png"),
                    _buildExpansionTile(
                        "Hobbies & Interest",
                        "But we cannot see anything when the tile is expanded. This is because we need to give the children parameter in ExpansionTile. Whatever widget we pass to the",
                        "assets/images/50.png"),
                    _buildExpansionTile(
                        "Family Information",
                        "But we cannot see anything when the tile is expanded. This is because we need to give the children parameter in ExpansionTile. Whatever widget we pass to the",
                        "assets/images/51.png"),
                  ],
                ),
              )
            else
              Container(),
            if (currentButton == 'Preference')
              Expanded(
                  child: ListView(
                    children: [
                      _buliderPreference("Marital Status:","Never Married"),
                      _buliderPreference("Age:","29-32"),
                      _buliderPreference("Height:","175-0"),
                      _buliderPreference("Physical Status:","Not Updated"),
                      _buliderPreference("Mother Tongue:","Tamil"),
                      _buliderPreference("Religion:","Christian - Protestant"),
                      _buliderPreference("Caste:","Nadar"),
                      _buliderPreference("Education:","BDS"),
                      _buliderPreference("Occupation:","Manager"),
                      _buliderPreference("Country:","India"),
                      _buliderPreference("Eating Habits:","Non Vegetarian"),
                      _buliderPreference("Smoking Habits:","Non-Smoker"),
                      _buliderPreference("Drinking Habits:","Non-Drinker"),
                      _buliderPreference("Annual Income:","Rs. 2,00,001 And Above"),
                    ],
                  )
              )
            else
              Container(),
            if (currentButton == 'Other Profile')
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      height: 203,
                      width: 186,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/76.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              )
            else
              Container()
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile(String title, String content, String images) {
    return Container(
      margin: const EdgeInsets.only(left: 20,bottom: 10,right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ExpansionTile(
        textColor: Colors.black,
        title: Row(
          children: [
            Image.asset(images, scale: 3),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              content,
              style: const TextStyle(color: Colors.grey,fontFamily: "SFPRODISPLAYMEDIUM"),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
  Widget _buliderPreference(String question,String answer){
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(question,style: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM"),),
              ],
            ),
          ),
          const SizedBox(width: 50),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(answer,style: TextStyle(fontFamily: "SFPRODISPLAYMEDIUM"),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
