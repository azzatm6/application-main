import 'package:application1/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();

}
class _HomeState extends State<Home> {

  final _formkey = GlobalKey<FormState>();
  final xcontroller = TextEditingController();
  final ycontroller = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  CollectionReference Values = FirebaseFirestore.instance.collection('Values');

  @override
  void initState() {
    super.initState();

  }
  void dispose() {
    xcontroller.dispose();
    ycontroller.dispose();
    super.dispose();
  }
Widget buildx() {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'X Value',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextFormField(
          controller: xcontroller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter number';
            }
            return null;
          },

          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.numbers,
                color: Color(0xff145DA0),
              ),
              hintText: 'Enter X Value',
              hintStyle: TextStyle(
                color: Colors.black38,
              )),
        ),
      )
    ],
  );
}
Widget buildy() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Y Value',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextFormField(
          controller: ycontroller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter number';
            }
            return null;
          },
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.numbers,
                color: Color(0xff145DA0),
              ),
              hintText: 'Enter Y Value',
              hintStyle: TextStyle(
                color: Colors.black38,
              )),
        ),
      )
    ],
  );
}
Widget builddoneBtn(context) {

  return Container(

    alignment: Alignment.center,
    child: ElevatedButton(
      onPressed: ()async{
       await Values.add({'XValue': xcontroller.text, 'YValue': ycontroller.text}).then((value) =>  ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: Text('Values added')),
       ));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(27))),
      ),
      child: Text(
        'Done',
        style: TextStyle(
          color: Colors.blue[900],
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
Widget buildLogoutBtn(context){
  return Container(
    alignment: Alignment.center,
    child:
    TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return Login();
        }));
      },

      child: Text(
        'Logout',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,

        ),
      ),
    ),
  );

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: AnnotatedRegion<SystemUiOverlayStyle>(

        value: SystemUiOverlayStyle.light,

        child: GestureDetector(
          child: Stack(

            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x668AB6F9),
                          Color(0x99C13979),
                          Color(0xcc5C2C90),
                          Color(0xff2A2E74),
                        ]
                    )
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: 30,
                    vertical: 25,

                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/images/7.png',height: 200,width: 200,),
                      SizedBox(height: 30,),
                      buildx(),
                      SizedBox(height: 10),
                      buildy(),
                      SizedBox(height: 15),
                      builddoneBtn(context),
                      SizedBox(height: 100),
                      buildLogoutBtn(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

