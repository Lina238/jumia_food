import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {

  final heroTag;
  final foodName;
  final foodPrice;

  DetailsPage(this.heroTag, this.foodName, this.foodPrice);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>{

  var selectedCard = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Details',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18.0,
              color: Colors.white
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 82,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                ),
                Positioned (
                    top: 75.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45.0),
                            topRight: Radius.circular(45.0)
                        ),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height - 100,
                      width: MediaQuery.of(context).size.width,
                    )
                ),
                Positioned(
                  top: 30,
                  left: (MediaQuery.of(context).size.width / 2) - 100,
                  child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.heroTag),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  ),
                  height: 200,
                  width: 200,
                ),
                Positioned(
                  top: 250,
                  left: 25,
                  right: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.foodName,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.foodPrice,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                color: Colors.grey
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 1.0,
                            color: Colors.grey,
                          ),
                          Container(
                            width: 125,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Color.fromRGBO(255,133,0,1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: Color.fromRGBO(255,133,0,1),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                ),
                                Text( '1',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 15
                                  ),
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color:Color.fromRGBO(255,133,0,1),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildIfoCard('hignt', '300c', 'G'),
                            SizedBox(width: 10,),
                            _buildIfoCard('low', '400c', 'G'),
                            SizedBox(width: 10,),
                            _buildIfoCard('asdasd', '300c', 'G'),
                            SizedBox(width: 10,),
                            _buildIfoCard('ada', '300c', 'G'),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ]
      ),
    );
  }

  Widget _buildIfoCard(String cardTitle,String info, String unit){

    return InkWell(
      onTap: (){
        SelectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardTitle == selectedCard ? Color.fromRGBO(255,133,0,1) : Colors.white,
          border: Border.all(
              color: cardTitle == selectedCard ? Colors.transparent : Colors.grey.withOpacity(0.3),
              style: BorderStyle.solid,
              width: 0.75
          ),
        ),
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              cardTitle,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: cardTitle == selectedCard ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    info,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: cardTitle == selectedCard ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    unit,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: cardTitle == selectedCard ? Colors.white : Colors.black,
                    ),
                  )


                ],
              ),


            ),

          ],
        ),
      ),
    );
  }

  SelectCard(cardTitle){
    setState(() {
      selectedCard = cardTitle;
    });
  }
}