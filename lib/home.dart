import 'dart:math';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String a = '';
  String b = '';
  String sign = '';
  String result = '';



    List numbers = ['0', '1', '2','3','4','5','6','7','8','9'];
  List signs = ['^','/','*','+','-'];
  //
  _buttonPress (String text) {
    if(text=='C')
      {
        clear();
      }
    if(text=='AC'){
      clearAll();
    }

    if(numbers.contains(text) && sign == '') {
      a += text;
    }

    if(a!='' && signs.contains(text) && b=='')
      {
        sign = text;
      }
    if(numbers.contains(text) && sign != '') {
      b += text;
    }
    if(a!='' && signs.contains(text) && b!=''){
      calculate();
      sign= text;
    }
    if(text=='=')
      {
        calculate();
      }
  }
  clear(){
    if(a!=''&& sign==''&&b=='')
    {
      a=a.substring(0,a.length-1);
    }
    if(a!=''&& sign!=''&&b=='')
    {
      sign='';
    }
    if(a!=''&& sign!=''&&b!='')
    {
      b=b.substring(0,b.length-1);
    }
    result='';
  }
  clearAll(){
    a='';
    b='';
    sign='';
    result='';
  }
  calculate(){
    double num1 = 0;
    double num2 = 0;
    int num3=0;
    int num4=0;

    double calc = 0;

    if(sign=='+') {
      num1 = double.parse(a);
      num2 = double.parse(b);
      calc= (num1+num2);
      a=calc.toString();
      sign='';
      b='';

    }
    if(sign=='-') {
      num1 = double.parse(a);
      num2 = double.parse(b);
      calc= (num1-num2);
      a=calc.toString();
      sign='';
      b='';
    }
    if(sign=='*') {
      num1 = double.parse(a);
      num2 = double.parse(b);
      calc= (num1*num2);
      a=calc.toString();
      sign='';
      b='';
    }
    if(sign=='/') {
      if(b!='0') {
        num1 = double.parse(a);
        num2 = double.parse(b);
        calc = (num1 / num2);
        a = calc.toStringAsFixed(2);
        sign = '';
        b = '';
      }
    }
    if(sign=='^') {
      num3 = int.parse(a);
      num4 = int.parse(b);

      a=pow(num3,num4).toString();
      sign='';
      b='';
    }

    if (a.endsWith('.0')){
        a=a.replaceAll('.0', '');
    }
  }
  @override
  Widget build(BuildContext context) {
    final blueButton = ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 24,fontWeight: FontWeight.w900)),
        backgroundColor: MaterialStateProperty.all(Color(0xFF52C9DC)),
        foregroundColor: MaterialStateProperty.all(Colors.white70),

        fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width*0.2, MediaQuery.of(context).size.height*0.1)),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.03)
    ))
    );
    final whiteButton = ButtonStyle(
      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      backgroundColor: MaterialStateProperty.all(Color(0xFF1E2435)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
        fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width*0.2, MediaQuery.of(context).size.height*0.1)),
      padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.03)
      ))
    );

    return Scaffold(
      backgroundColor: Color(0xFF1A1B28),
      appBar: AppBar(
        backgroundColor: Color(0xFF52C9DC),
        title: Text('lab 1 - Calculator'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.05),
                        child: Text(style:TextStyle(fontSize: 36, color: Colors.white,), '$a $sign $b'),
                      ),

                    ],
                  )


                ],
              )


            ),

           Expanded(
            flex: 20,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('C');});},onLongPress:() {setState(() {_buttonPress('AC');});}, style: ElevatedButton.styleFrom(
                      textStyle: (TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      backgroundColor: (Color(0xFF52C9DC)),
                      foregroundColor: (Colors.white),
                      fixedSize: (Size(MediaQuery.of(context).size.width*0.45, MediaQuery.of(context).size.height*0.1)),
                      padding: (EdgeInsets.all(0)),
                      shape: (RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.03)
                      )),
                    ), child:  Text('C'),
                    ),
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('^');});}, style: blueButton, child:  Text('^')),
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('/');});}, style: blueButton, child:  Text('/')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('7');});}, style: whiteButton, child:  Text('7'),),
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('8');});} , style: whiteButton, child:  Text('8'),),
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('9');});}, style: whiteButton, child:  Text('9'),),
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('*');});}, style: blueButton, child:  Text('*')),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('4');});} , style: whiteButton, child:  Text('4'),),
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('5');});}, style: whiteButton, child:  Text('5'),),
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('6');});}, style: whiteButton, child:  Text('6'),),
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('-');});}, style: blueButton, child:  Text('–')),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('1');});}, style: whiteButton, child:  Text('1'),),
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('2');});}, style: whiteButton, child:  Text('2'),),
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('3');});}, style: whiteButton, child:  Text('3'),),
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('+');});}, style: blueButton, child:  Text('+')),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('0');});}, style: ElevatedButton.styleFrom(
                      textStyle: (TextStyle(fontSize: 24)),
                      backgroundColor: (Color(0xFF1E2435)),
                      foregroundColor: (Colors.white),
                        fixedSize: (Size(MediaQuery.of(context).size.width*0.68, MediaQuery.of(context).size.height*0.1)),
                        padding: (EdgeInsets.all(0)),
                        shape: (RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.03)
                        ))
                    ), child:  Text('0'),),
                    ElevatedButton(onPressed: () {setState(() {_buttonPress('=');});}, style: blueButton, child:  Text('=')),
                  ],
                ),
            ],)
    ),


          ],
        ),
      ),
      );
  }

}
