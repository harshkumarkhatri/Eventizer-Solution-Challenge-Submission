import 'package:flutter/material.dart';
import 'Widgets/answerText_widget.dart';
import 'Widgets/questionText_widget.dart';

class FrequentlyAskedQuestionsScreen extends StatefulWidget {
  @override
  _FrequentlyAskedQuestionsScreenState createState() =>
      _FrequentlyAskedQuestionsScreenState();
}

class _FrequentlyAskedQuestionsScreenState
    extends State<FrequentlyAskedQuestionsScreen> {
  double _animatedHeight = 100.0;

  bool initial1 = false;
  bool initial2 = false;
  bool initial3 = false;
  bool initial4 = false;
  bool initial5 = false;
  bool initial8 = false;
  bool initial7 = false;
  bool initial6 = false;
  bool initial9 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(
          0.9,
        ),
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
        centerTitle: true,
        title: Text(
          "FAQ's",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Card(
                  color: Colors.orange,
                  child: Column(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            _animatedHeight == 0.0
                                ? _animatedHeight = 100.0
                                : _animatedHeight = 00.0;
                            initial1 == false
                                ? initial1 = true
                                : initial1 = false;
                          });
                        },
                        child: questionText_widget("What is Eventizer?"),
                      ),
                      initial1 == true
                          ? answerText_widget(
                              "It is an app through which you can register for various different events which are added by different communities wo help you learn and grow.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial2 == false
                                  ? initial2 = true
                                  : initial2 = false;
                            });
                          },
                          child: questionText_widget("Why Eventizer?"),
                        ),
                      ),
                      initial2 == true
                          ? answerText_widget(
                              "The main idea behind creating eventizer is to to help communities increase the reach of their events and to help the community folks to learn new things from experienced mentors/tutors from all around the globe.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial3 == false
                                  ? initial3 = true
                                  : initial3 = false;
                            });
                          },
                          child: questionText_widget(
                              "What all can be done in eventizer?"),
                        ),
                      ),
                      initial3 == true
                          ? answerText_widget(
                              "Eventizer provides you with a fexibility of registering for various different events which are being organized by different communities.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial4 == false
                                  ? initial4 = true
                                  : initial4 = false;
                            });
                          },
                          child: questionText_widget(
                              "Where can i find the events which i registered for?"),
                        ),
                      ),
                      initial4 == true
                          ? answerText_widget(
                              "You can find all the items for which you have registered inside the registered events screen which is present inside the drawer.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial5 == false
                                  ? initial5 = true
                                  : initial5 = false;
                            });
                          },
                          child: questionText_widget(
                              "How to get more info about a particular event?"),
                        ),
                      ),
                      initial5 == true
                          ? answerText_widget(
                              "Every event has an email id mentioned along with it which will be visible to you when you will be clicking on the particular event. To get more details/clarity for a particular item, you can mail on the given mail id.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial6 == false
                                  ? initial6 = true
                                  : initial6 = false;
                            });
                          },
                          child: questionText_widget(
                              "Is my data shared with the event organizer?"),
                        ),
                      ),
                      initial6 == true
                          ? answerText_widget(
                              "Your data like email id, name, city, and state will be shared with the event organizer so that furture communications can be made.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial7 == false
                                  ? initial7 = true
                                  : initial7 = false;
                            });
                          },
                          child: questionText_widget(
                              "How will i know if an event is cancelled?"),
                        ),
                      ),
                      initial7 == true
                          ? answerText_widget(
                              "You will get an email as soon as an event is cancelled.")
                          : Container(),
                    ],
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
