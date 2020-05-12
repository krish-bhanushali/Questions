import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/StoryBrain.dart';

void main() => runApp(QuestionMaster());

class QuestionMaster extends StatelessWidget {
Widget build(BuildContext context) {
  return MaterialApp(
    theme: ThemeData.dark(),
    home: QuestionChild(),

    debugShowCheckedModeBanner: false,
  );

}
}

class QuestionChild extends StatefulWidget {
  @override
  _QuestionChildState createState() => _QuestionChildState();
}

class _QuestionChildState extends State<QuestionChild> {


   //Created a Object of that class to access the List, we can implement that here too
  StoryBrain myBrain = StoryBrain();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/backgroundfinal.jpg"),
              fit: BoxFit.cover,
              
            ),),

          //Used Single child ScrollView since if orientation gets changed our choices don't get cut
          child: Container(
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: size.height *.30,
                ),

                //Question Container
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400].withOpacity(.45),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Text(myBrain.getStory(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "ArchivoBlack",
                    color: Colors.grey[900],
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                SizedBox(
                  height: size.height *.15,
                ),

                //BUTTON CUSTOM WIDGET DECLARED AT THE BOTTOM
                OptionButton(
                  buttonText: myBrain.getChoice1(),
                  press: (){
                    setState(() {
                      myBrain.nextStory(1);
                    });

                  },
                ),
                OptionButton(
                  press: (){
                    setState(() {
                      myBrain.nextStory(2);
                    });

                  },
                  buttonText: myBrain.getChoice2(),

                ),
                Visibility(
                  visible: myBrain.buttonShouldBeVisible(),
                  child: OptionButton(
                    press: (){
                      setState(() {
                        myBrain.nextStory(3);
                      });

                    },
                    buttonText: myBrain.getChoice3(),

                  ),
                ),
                Visibility(
                  visible: myBrain.buttonShouldBeVisible(),
                  child: OptionButton(
                    press: (){
                      setState(() {
                        myBrain.nextStory(4);
                      });

                    },
                    buttonText: myBrain.getChoice4(),

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final Function press;
  final String buttonText;

  const OptionButton({
    Key key, this.press, this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0,vertical: 5.0),
      decoration: BoxDecoration(

//          color: Colors.grey[900].withOpacity(.75),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(color: Colors.black, width: 3.0)),
      child: FlatButton(
          onPressed: press,

          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.grey[900],
              fontWeight: FontWeight.bold,
              fontSize: 18.0
            ),
          )),
    );
  }
}

