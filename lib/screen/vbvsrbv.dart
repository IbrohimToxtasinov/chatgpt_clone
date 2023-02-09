import 'package:flutter/material.dart';

import '../data/model.dart';

class ChatGptScreen extends StatefulWidget {
  const ChatGptScreen({Key? key}) : super(key: key);

  @override
  State<ChatGptScreen> createState() => _ChatGptScreenState();
}

String valueOnChanged = '';
List<String> listQuestion = [];
List<String> listAnswer = [];
bool isOn = false;
int count = 0;
final FocusNode focusNode = FocusNode();
TextEditingController controller = TextEditingController();

class _ChatGptScreenState extends State<ChatGptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatGpt screen"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              const Expanded(child: SizedBox()),
              ...List.generate(count, (index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8, left: 158.0),
                  child: Container(
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff121212).withOpacity(0.1),
                              blurRadius: 8)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Text(
                          listQuestion[index],
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              ...List.generate(listAnswer.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8, right: 158.0),
                  child: Container(
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff121212).withOpacity(0.1),
                              blurRadius: 8)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Text(
                          listAnswer[index],
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ),
                );
              })
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              maxLines: 2,
              onChanged: (v) {
                valueOnChanged = v.toLowerCase();
                if (v.isEmpty) {
                  isOn = false;
                  setState(() {});
                } else {
                  isOn = true;
                  setState(() {});
                }
              },
              decoration: InputDecoration(
                  suffixIcon: isOn
                      ? IconButton(
                          onPressed: () {
                            focusNode.unfocus();
                            controller.clear();
                            isOn = false;
                            count++;
                            listQuestion.add(valueOnChanged.toLowerCase());
                            _func(qu: valueOnChanged);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.blue,
                          ))
                      : Icon(
                          Icons.send,
                          color: Colors.blue.withOpacity(0.2),
                        ),
                  labelText: 'Write your question',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: Colors.blue))),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  _func({required String qu}) {
    bool isFound = false;
    for (var e in ChatGpt.unknown) {
      if (e.questionText == valueOnChanged){
        listAnswer.add(e.answerText);
        isFound = true;
      }
    }
    if (isFound == false) {
      listAnswer.add('uzur topilmadi');
    }
  }
}
