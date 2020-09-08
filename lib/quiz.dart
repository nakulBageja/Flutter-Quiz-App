import 'dart:math';

import 'package:Assignment1_FlutterQuizApp/summary.dart';
import 'package:flutter/material.dart';
import 'models/questions.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
//Question Index
  int questionIndex = 0;

  //answer given
  String answer = "";

  //result
  String result = "";
  int resultCount = 0;

  int i = 0;

  //This function is executed at start of the app
  @override
  void initState() {
    randomQuestionGenerator();
    questionIndex = 0;
    answer = "";
    result = "";
    resultCount = 0;
    super.initState();
  }

  //10 Questions + image question
  List<Question> questions = [
    Question("Who was the first Indian woman in Space?", "Kalpana Chawla", [
      'Kalpana Chawla',
      'Sunita Williams',
      'Koneru Humpy',
      'None of the above'
    ]),
    Question("Who was the first Indian in space?", "Rakesh Sharma", [
      'Ravish Malhotra',
      'Vikram Ambalal',
      'Rakesh Sharma',
      'Nagapathi Bhat'
    ]),
    Question(
        "Who was the first Man to Climb Mount Everest Without Oxygen?",
        "Phu Dorji",
        ['Junko Tabei', 'Reinhold Messner', 'Peter Habeler', 'Phu Dorji']),
    Question("Who wrote the Indian National Anthem", "Rabindranath Tagore", [
      'Bakim Chandra Chatterji',
      'Rabindranath Tagore',
      'Swami Vivekanand',
      'None of the above'
    ]),
    Question("Who was the first Indian Scientist to win a Nobel Prize?",
        "CV Raman", [
      'CV Raman',
      'Amartya Sen',
      'Hargobind Khorana',
      'Subramanian Chrandrashekar'
    ]),
    Question("Who is the first Indian to win a Nobel Prize?",
        "Rabindranath Tagore", [
      'Rabindranath Tagore',
      'CV Raman',
      'Mother Theresa',
      'Hargobind Khorana'
    ]),
    Question(
        "Who was the first Indian woman to win the Miss World Title?",
        "Reita Faria",
        ['Aishwarya Rai', 'Sushmita Sen', 'Reita Faria', 'Diya Mirza']),
    Question("Who was the first President of India?", "Dr. Rajendra Prasad", [
      'Abdul Kalam ',
      'Lal Bahadur Shastri',
      'Dr. Rajendra Prasad',
      'Zakir Hussain'
    ]),
    Question(
        "Who was the first Indian to win the Booker Prize?", "Arundhati Roy", [
      'Dhan Gopal Mukerji',
      'Nirad C. Chaudhuri',
      'Arundhati Roy',
      'Aravind Adiga'
    ]),
    Question("Who built the Jama Masjid?", "Shah Jahan",
        ['Jahangir', 'Akbar', 'Imam Bukhari', 'Shah Jahan']),
  ];
  Question imageQuestion =
      new Question("Which one is Narendra Modi?", "4", ["1", "2", "3", "4"]);

  //List to store the random questions (0 -3)
  List<int> randomQuestionGenerated = new List(4);

  //buttonsWidget helper function
  Widget buttonsWidget() {
    int index = questionIndex + 1;
    if (index == 4) {
      return imageButtons();
    }
    if (index == 1) {
      return flatButtons(randomQuestionGenerated[0]);
    } else if (index == 2) {
      return checkBoxes(randomQuestionGenerated[1]);
    } else if (index == 3) {
      return radioButtons(randomQuestionGenerated[2]);
    } else {
      return listview(randomQuestionGenerated[3]);
    }
  }

  //flat button renedering
  Widget flatButtons(int index) {
    print(index);
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blue,
                  onPressed: () {
                    answer = questions[index].options[0];
                    checkanswer();
                  },
                  child: Text(
                    questions[index].options[0],
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.black,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blue,
                  onPressed: () {
                    answer = questions[index].options[1];
                    checkanswer();
                  },
                  child: Text(
                    questions[index].options[1],
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blue,
                  onPressed: () {
                    answer = questions[index].options[2];
                    checkanswer();
                  },
                  child: Text(
                    questions[index].options[2],
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blue,
                  onPressed: () {
                    answer = questions[index].options[3];
                    checkanswer();
                  },
                  child: Text(
                    questions[index].options[3],
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

//checkboxes renedering
  Widget checkBoxes(int index) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: false,
                  onChanged: (bool value) {
                    answer = questions[index].options[0];
                    checkanswer();
                  },
                ),
                Text(questions[index].options[0]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: false,
                  onChanged: (bool value) {
                    answer = questions[index].options[1];
                    checkanswer();
                  },
                ),
                Text(questions[index].options[1])
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: false,
                  onChanged: (bool value) {
                    answer = questions[index].options[2];
                    checkanswer();
                  },
                ),
                Text(questions[index].options[2])
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: false,
                  onChanged: (bool value) {
                    answer = questions[index].options[3];
                    checkanswer();
                  },
                ),
                Text(questions[index].options[3]),
              ],
            ),
          )
        ],
      ),
    );
  }

//radio buttons renedering
  Widget radioButtons(int index) {
    return Container(
      child: Column(
        children: <Widget>[
          new Radio(
            value: 0,
            onChanged: (value) {
              answer = questions[index].options[0];
              checkanswer();
            },
          ),
          new Text(
            questions[index].options[0],
            style: new TextStyle(fontSize: 16.0),
          ),
          new Radio(
            value: 1,
            onChanged: (value) {
              answer = questions[index].options[1];
              checkanswer();
            },
          ),
          new Text(
            questions[index].options[1],
            style: new TextStyle(
              fontSize: 16.0,
            ),
          ),
          new Radio(
            value: 2,
            onChanged: (value) {
              answer = questions[index].options[2];
              checkanswer();
            },
          ),
          new Text(
            questions[index].options[2],
            style: new TextStyle(fontSize: 16.0),
          ),
          new Radio(
            value: 3,
            onChanged: (value) {
              answer = questions[index].options[3];
              checkanswer();
            },
          ),
          new Text(
            questions[index].options[3],
            style: new TextStyle(fontSize: 16.0),
          )
        ],
      ),
    );
  }

//image renedering
  Widget imageButtons() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    answer = imageQuestion.options[0];
                    checkanswer();
                  },
                  child: Image.asset(
                    'assets/images/putin.jpg',
                    height: 200,
                    width: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    answer = imageQuestion.options[1];
                    checkanswer();
                  },
                  child: Image.asset(
                    'assets/images/dhoni.jpg',
                    height: 200,
                    width: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    answer = imageQuestion.options[2];
                    checkanswer();
                  },
                  child: Image.asset(
                    'assets/images/Trump.jpg',
                    height: 200,
                    width: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    answer = imageQuestion.options[3];
                    checkanswer();
                  },
                  child: Image.asset(
                    'assets/images/modi.jpg',
                    height: 200,
                    width: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

//listView rendering
  Widget listview(int index) {
    print(index);
    print(questionIndex);
    return ListView.separated(
      itemCount: questions[index].options.length,
      itemBuilder: (context, itr) {
        return GestureDetector(
          child: ListTile(
            title: Text(questions[index].options[itr]),
          ),
          onTap: () {
            answer = questions[index].options[itr];
            if (answer == questions[index].answer) {
              setState(() {
                resultCount++;
              });
            }
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>
                  summary(resultCount: resultCount),
            ));
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  //function to check answer
  checkanswer() {
    setState(() {
      if (questions[randomQuestionGenerated[i]].answer == answer) {
        result = "Correct";
        resultCount++;
        questionIndex++;
      } else if (imageQuestion.answer == answer) {
        result = "Correct";
        resultCount++;
        questionIndex++;
      } else {
          result = "Incorrect";
          questionIndex++;
      }
      nextQuestion();
    });
  }
  //Increment to next question only if the question is not image
  //because the image question is fixed
  nextQuestion(){
    if(questionIndex != 4){
        i++;
    }
  }

  //Function to generate 4 random numbers
  randomQuestionGenerator() {
    Random random = new Random(); //Initialising the random generater object

    for (int i = 0; i < 4; i++) {
      var number = random.nextInt(10); //Generating random numbers
      if (randomQuestionGenerated.isNotEmpty &&
          randomQuestionGenerated.contains(number)) {
        //If randomly generated number already exists, find another number
        do {
          number = random.nextInt(10);
        } while (randomQuestionGenerated.contains(number));
      }
      randomQuestionGenerated[i] = number;
    }

    print(randomQuestionGenerated);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Quiz App",
        home: Scaffold(
          appBar: AppBar(title: const Text("General Knowledge Quiz")),
          body: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              "Question #${questionIndex + 1}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16.0),
                            )),
                        Text(
                          (questionIndex + 1) == 4
                              ? imageQuestion.question
                              : questions[randomQuestionGenerated[i]].question,
                          // questions[questionIndex].question,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              questionIndex != 0
                                  ? 'Previous Question: ' + result
                                  : "",
                              style: TextStyle(
                                  color: result == "Correct"
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16.0),
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(child: buttonsWidget()),
              ],
            ),
          ),
        ));
  }
}
