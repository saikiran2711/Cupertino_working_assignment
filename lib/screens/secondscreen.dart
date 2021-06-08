import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _typecontroller = TextEditingController();
  bool isTextCorrect = false;
  bool isNameInputed = true;
  bool isTypeInputed = true;

  void checkValidate(BuildContext context) async {
    if (_namecontroller.text.isEmpty) {
      setState(() {
        isNameInputed = false;
        isTextCorrect = false;
      });
    }
    if (_namecontroller.text.length > 0 && _namecontroller.text.length <= 120) {
      setState(() {
        isNameInputed = true;
        isTextCorrect = false;
      });
    }
    if (_namecontroller.text.length > 120) {
      setState(() {
        isTextCorrect = true;
        isNameInputed = true;
      });
    }
    if (_typecontroller.text.isEmpty) {
      setState(() {
        isTypeInputed = false;
        isTextCorrect = false;
      });
    }

    if (_namecontroller.text.length > 0 && _typecontroller.text.length > 0) {
      try {
        var pop = await Navigator.of(context).pushNamed("/third")
            as Map<String, dynamic>;
        if (pop["pop"] == true) {
          Navigator.of(context).pop();
        }
      } catch (err) {
        print("Navigated back with button ");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              border: Border(bottom: BorderSide(color: CupertinoColors.white)),
              automaticallyImplyTitle: false,
              backgroundColor: CupertinoColors.white,
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  CupertinoIcons.clear,
                  color: CupertinoColors.systemGrey,
                  size: 25,
                ),
              ),
              largeTitle: Text(
                "Create an activity",
                style: TextStyle(color: CupertinoColors.black),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Activity name ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              CupertinoTextField(
                                autofocus: true,
                                onSubmitted: (value) {
                                  if (value.length > 120) {
                                    setState(() {
                                      isTextCorrect = true;
                                      isNameInputed = true;
                                    });
                                  } else {
                                    setState(() {
                                      isTextCorrect = false;
                                      isNameInputed = true;
                                    });
                                  }
                                },
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                controller: _namecontroller,
                                style: TextStyle(color: CupertinoColors.black),
                                placeholder: "Eg: Cooking Class",
                                placeholderStyle: TextStyle(
                                    color: CupertinoColors.systemGrey),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: CupertinoColors.systemGrey3),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              isNameInputed
                                  ? Text(
                                      " * Name should me max 120 characters ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: (!isTextCorrect)
                                              ? CupertinoColors.systemGrey2
                                              : CupertinoColors.systemRed),
                                    )
                                  : Text(
                                      " * This field is required",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: CupertinoColors.systemRed),
                                    ),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Activity Type ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              CupertinoTextField(
                                autofocus: true,
                                // textInputAction: TextInputAction.next,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                controller: _typecontroller,
                                placeholder: "Eg: Cooking Class",
                                onSubmitted: (val) {
                                  if (val.length > 0) {
                                    setState(() {
                                      isTypeInputed = true;
                                    });
                                  } else {
                                    setState(() {
                                      isTypeInputed = false;
                                    });
                                  }
                                },
                                style: TextStyle(color: CupertinoColors.black),
                                placeholderStyle: TextStyle(
                                    color: CupertinoColors.systemGrey),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: CupertinoColors.systemGrey),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              isTypeInputed
                                  ? Text("")
                                  : Text(" * This field is required",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: CupertinoColors.systemRed))
                            ],
                          ),
                          SizedBox(
                            height: 120,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CupertinoButton(
                                  color: CupertinoColors.black,
                                  child: Text(
                                    "Next",
                                    style:
                                        TextStyle(color: CupertinoColors.white),
                                  ),
                                  onPressed: () {
                                    checkValidate(context);
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
