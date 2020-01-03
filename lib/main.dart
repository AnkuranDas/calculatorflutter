
import 'package:flutter/material.dart';
void main()
{
  runApp(myApp());
}
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int first,second;
  String texttodisplay="";
  String res;
  String operate;
  void btnclicked(String btntext){
    if(btntext=="C")
    {texttodisplay="";
    first=0;
    second=0;
    res="";
    } else if(btntext=="+"||btntext=="-"||btntext=="X"||btntext=="/"){
      first=int.parse(texttodisplay);
      res="";
      operate=btntext;
    }else if(btntext== "=")
      {
        second=int.parse(texttodisplay);
        if(operate=="+")
        {
          res=(first+second).toString();
        }
        else if(operate=="X")
        {
          res=(first*second).toString();
        }
         else if(operate=="/")
        {
          res=(first~/second).toString();
        }
        else if(operate=="-")
        {
          res=(first-second).toString();
        }
      }else {
        res=int.parse(texttodisplay+btntext).toString();
      }
      setState(() {
        texttodisplay=res;
      });
  }
  Widget custombutton(String btnval){
      return Expanded(
                child:MaterialButton(
                  onPressed: ()=>btnclicked(btnval),
                  child:Text(
                    "$btnval",
                    style: TextStyle(fontSize:30.0),
                  )
                )
              );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator"
        )
      ),
      body:Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text("$texttodisplay",
                style: TextStyle(
                  fontSize: 30.0
                )
                ),
              ),
            ),
          Row(
            children: <Widget>[
              custombutton("1"),
              custombutton("2"),
              custombutton("3"),
              custombutton("X")
              
              
            ],
          ),
          Row(
            children: <Widget>[
              custombutton("4"),
              custombutton("5"),
              custombutton("6"),
              custombutton("/")   
            ],
          ),
          Row(
            children: <Widget>[
              custombutton("7"),
              custombutton("8"),
              custombutton("9"),
              custombutton("+")
              
              
            ],
          ),
          Row(
            children: <Widget>[
              custombutton("C"),
              custombutton("0"),
              custombutton("-"),
              custombutton("=")
              
              
            ],
          )
        ],)
      )
      
    );
  }
}