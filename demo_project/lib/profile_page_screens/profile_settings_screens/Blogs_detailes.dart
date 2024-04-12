import 'package:flutter/material.dart';

class BlogsDetails extends StatelessWidget {
  final String images;
  final String title;
  final String date;

  const BlogsDetails({
    Key? key,
    required this.images,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/38.png",
              color: Colors.black,
              scale: 3,
            ),
          ),
          title: const Text(
            "Blogs",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(images),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Image.asset("assets/images/15.png", scale: 3),
                  const SizedBox(width: 5),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF8D8D8D),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "With ever-evolving technologies, finding love online has seen greater acceptance in modern societies. People are more accepting towards looking for a partner online. But before making a move to E-Love, a question pops up in our head, ‘Is the person real and genuine?’ If you are nodding in agreement, then we have a solution for you – Verified Profiles! \n\nWe mean it when we say, we have your back on this! \n\nWe have an array of features that help you find the most genuine and authentic matches \n\n\n1. Mobile Verification: \n\nAuthenticating users over the phone is one of the most important factors as a single phone number belongs to single person, and therefore one of the most reliable piece of information. With this, we can be sure that the person in the profile is who they say they are. So, before you say your first Hello, we are right there checking it up for you.\n\n 2. Identification proof: \n\nEvery person has some Government recognized IDs which authenticate them as citizens of the country and is a proof of their demographic information. This form of verification is an important way to verify if the person is genuine!\n\n Now we don’t just deliver his details to you, but we make sure if the details provided by the person matches the details on their IDs. So, what you get to see is a verified profile! \n\n3. Shield of Verification: \n\nWith our shield of trust, we assure you that the profile is strictly checked by us. You can take our word on this one! . \n\nIf a member has the shield of trust unlocked, it means our team has screened their Government issued Identity Proof & Social Profiles.",
                style: TextStyle(
                  color: Color(0xFF8D8D8D),
                  fontSize: 14,
                  fontFamily: "SFPRODISPLAYMEDIUM"
                ),
              ),
            ),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
