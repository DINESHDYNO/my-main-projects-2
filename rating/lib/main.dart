import 'package:flutter/material.dart';

void main(){
  runApp(kumar());
}

class kumar extends StatelessWidget {
  const kumar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RatingBox(),
    );
  }
}


class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}
class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }
  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }
  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }void _setRatingAsFore() {
    setState(() {
      _rating = 4;
    });
  }void _setRatingAsFive() {
    setState(() {
      _rating = 5;
    });
  }
  Widget build(BuildContext context) {
    double _size = 20;
    print(_rating);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                    icon: (
                        _rating >= 1 ? Icon(
                          Icons.star,
                          size: _size,
                        ) : Icon(
                          Icons.star_border,
                          size: _size,
                        )
                    ),
                    color: Colors.red,
                    onPressed: _setRatingAsOne,
                    iconSize: _size,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                    icon: (
                        _rating >= 2 ?
                        Icon(
                          Icons.star,
                          size: _size,
                        )
                            : Icon(
                          Icons.star_border,
                          size: _size,
                        )
                    ),
                    color: Colors.orange,
                    onPressed: _setRatingAsTwo,
                    iconSize: _size,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                    icon: (
                        _rating >= 3 ?
                        Icon(
                          Icons.star,
                          size: _size,
                        )
                            : Icon(
                          Icons.star_border,
                          size: _size,
                        )
                    ),
                    color: Colors.green,
                    onPressed: _setRatingAsThree,
                    iconSize: _size,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                    icon: (
                        _rating >= 4 ?
                        Icon(
                          Icons.star,
                          size: _size,
                        )
                            : Icon(
                          Icons.star_border,
                          size: _size,
                        )
                    ),
                    color: Colors.yellow,
                    onPressed: _setRatingAsFore,
                    iconSize: _size,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                    icon: (
                        _rating >= 5 ?
                        Icon(
                          Icons.star,
                          size: _size,
                        )
                            : Icon(
                          Icons.star_border,
                          size: _size,
                        )
                    ),
                    color: Colors.blueAccent,
                    onPressed: _setRatingAsFive,
                    iconSize: _size,
                  ),
                ),

              ],
            ),
            SizedBox(height: 200,),
            Container(
              height: 220,
              width: MediaQuery.of(context).size.width*0.20,
              decoration: BoxDecoration(
                color: Colors.red,
              ),

            )
          ],
        ),
      ),
    );
  }
}

