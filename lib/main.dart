import 'package:flutter/material.dart';
import 'leveleasy.dart';
import 'hard.dart';
import 'level-Normall.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

const  String doneby = "This simple game is done by Hussein Sheikh ALi ";
const String description = "The idea of this game is that the user will try to guess a random number with hints.";

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Guess Number',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.red, fontSize: 30),
          ),
          centerTitle: true,
        ),
        body:
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AddText(text: doneby),
              const AddText(text: description),
              Container(margin: const EdgeInsets.only(bottom: 20)), // Add spacing with Container
              const Menu(),
              Image.network(
                'https://t3.ftcdn.net/jpg/02/09/23/26/360_F_209232692_zKf4pxjFWAcc5TZF3BE3dhOmeKORra5g.jpg', // Replace with the URL of your image

              ),
              const Footer(text:"studentId=12131104"),


            ] ,
          ),

        ),backgroundColor: Colors.black,

      ),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  String selectedValue = 'easy'; // Default selected value

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Select level:',style: TextStyle(color: Colors.red,)),
        Container(margin: const EdgeInsets.only(bottom: 10)), // Add spacing with Container
        DropdownButton<String>(
          value: selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          items: <String>['easy', 'normall', 'hard']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style: const TextStyle(color: Colors.green),
              ),
            );
          }).toList(),
        ),
        ElevatedButton(

          onPressed: () {
            // Navigate to the second page
            if(selectedValue.toString().toLowerCase()=='easy'){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const easylvl()),
              );
            }
            if(selectedValue.toString().toLowerCase()=='normall'){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Normall()),
              );
            }
            if(selectedValue.toString().toLowerCase()=='hard'){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Hard()),
              );
            }
          },
          child: const Text('Click to play',style: TextStyle(color:Colors.green),),
        ),
      ],
    );
  }
}
class AddText extends StatelessWidget {
  final String text;

  const AddText({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.red,
      ),
    );
  }
}

class Footer extends StatelessWidget {
  final String text;

  const Footer({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        text,
        style:const  TextStyle(fontSize: 24.0,color: Colors.red),
      ),
    );
  }
}
