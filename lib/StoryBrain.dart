class Story{
  String storyTitle;
  String choice1;
  String choice2;
  String choice3;
  String choice4;
  Story({this.storyTitle ,this.choice1,this.choice2,this.choice3,this.choice4});
}



class StoryBrain{
  String result = "";
  List<Story> _storyData = [

    Story(
        storyTitle:
        'Are you experiencing any of the following symptoms?',
        choice1: 'Cough',
        choice2: 'Fever',
        choice3: 'Difficulty in Breathing',
        choice4: 'None of the above',



    ),
    Story(
        storyTitle: 'Have you travelled to anywhere in the containment area in the last 14 days',
        choice1: 'Yes',
        choice2: 'No'),
    Story(
        storyTitle:
        'Is your area in containment area/red zone?',
        choice1: 'Yes',
        choice2: 'No'),
    Story(
        storyTitle:
        'Are you fit to work without any kind of illness?',
        choice1: 'Yes',
        choice2: 'No'),

    //if YOU WANT TO ADD ANOTHER TEXT WITH ONE GO BACK BUTTON ADD ONE MORE STORY TITLE WITH CHOICE 1 , CREATE A FUNCTION LIKE BELOW BOOL
    //VISIBLE FOR CHOICE FOR 2, AND CALL IT USING VISIBILITY WIDGET
  ];

  //GET TEXTS TO THE MAIN PAGE
  String getStory(){
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1(){
    return _storyData[_storyNumber].choice1;
  }
  String getChoice2(){
    return _storyData[_storyNumber].choice2;
  }
  String getChoice3(){
    return _storyData[_storyNumber].choice3;
  }
  String getChoice4(){
    return _storyData[_storyNumber].choice4;
  }

  int _storyNumber = 0;

  //GOVERNING FUNCTION , ADD NAVIGATION HERE PASSING THE FINAL STRING, YOU MAY ALSO CALL THE OTHER METHOD IF YOU CREATE ONE MORE STRING
  void nextStory(int choiceNumber){
    if(_storyNumber == 0 && choiceNumber ==1){
      result = result + getChoice1();
      _storyNumber++;
    }
    else if(_storyNumber ==0 && choiceNumber==2){
      print('gothere');
      result = result + getChoice2();

      _storyNumber++;

    }
    else if(_storyNumber ==0 && choiceNumber==3){
      result = result + getChoice3();
      _storyNumber++;
    }
    else if(_storyNumber ==0 && choiceNumber==4){
      result = result + getChoice4();
      _storyNumber++;
    }
    else if(_storyNumber ==1 && choiceNumber==1){
      result = result + getChoice1();
      _storyNumber++;
    }
    else if(_storyNumber ==1 && choiceNumber==2){
      result = result + getChoice2();
      _storyNumber++;
    }
    else if(_storyNumber ==2 && choiceNumber==1){
      result = result + getChoice1();
      _storyNumber++;
    }
    else if(_storyNumber ==2 && choiceNumber==2){
      result = result + getChoice2();
      _storyNumber++;
    }
    else if(_storyNumber ==3 && choiceNumber==1){
      result = result + getChoice1();
      //ADD NAVIGATION ROUTE
    }
    else if(_storyNumber ==3 && choiceNumber==2){
      result = result + getChoice2();
      //ADD NAVIGATION ROUTE

    }
    else{
      //TEST
    }

  }
  String getFinalString(){
    return result;
  }
  bool buttonShouldBeVisible(){
    if(_storyNumber==0)
    {
      return true;
    }
    else{
      return false;
    }
  }
}





