import 'package:flutter/material.dart';
import'package:jumia_food/detailspage.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Order',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(255,133,0,1),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0,),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Row(
              children: <Widget>[
             Expanded(child:  Image.asset("assets/nina.png",
               ),
             ),
              ],
            ),
          ),
          SizedBox(height: 40.0,),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 45.0 ),
                child: Container(
                  height: MediaQuery.of(context).size.height-300   ,
             child: ListView(
               children:<Widget> [

                 _buildfooditem('assets/plate1.png',"dish 1","\$ 50.000"),
                 _buildfooditem('assets/plate2.png',"dish 2","\$ 70.000"),
                 _buildfooditem('assets/plate3.png',"dish 3","\$ 45.000"),
                 _buildfooditem('assets/plate4.png',"dish 4","\$ 80.000"),
                 _buildfooditem('assets/plate5.png',"dish 5","\$ 30.000"),
                 _buildfooditem('assets/plate6.png',"dish 6","\$ 25.000"),

               ],


             ),

                ),
              )
              ],
            ),
          )
        ],
      ),
    );
  }

Widget _buildfooditem(String imgpath,String foodname,String price){
  return Padding(
    padding:EdgeInsets.only(left:10.0,right:10.0,top: 10.0 ) ,
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context)=>DetailsPage(imgpath,
                   foodname,
                   price)
            )
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children:<Widget> [
           Container(
             child: Row(
               children:<Widget> [
                 Hero(tag: imgpath,


                     child: Image(
           image: AssetImage(imgpath),
           fit:BoxFit.cover,
           height: 75.0,
           width: 75.0,
                     ),
                 ),
             SizedBox(width: 10.0,),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget> [
                  Text(
                    foodname,
                    style: TextStyle(
                     fontFamily: "Montserrat" ,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),

                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontFamily: "Montserrat" ,
                      color: Colors.grey ,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              )
               ],
             ),
           ),
        IconButton(
            onPressed: () {},
            icon: Icon( Icons.add),
            color: Colors.black,
        )

         ],

      ),
    ),


  );

}
}