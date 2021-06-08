import 'package:flutter/cupertino.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  TextEditingController _startdateController = TextEditingController();
  TextEditingController _enddateController = TextEditingController();

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
                  CupertinoIcons.back,
                  color: CupertinoColors.systemGrey,
                  size: 25,
                ),
              ),
              largeTitle: Text(
                "Date of activity",
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
                              Text("Start date ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              CupertinoTextField(
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                controller: _startdateController,
                                style: TextStyle(color: CupertinoColors.black),
                                placeholder: "Dec 02, 2020",
                                placeholderStyle: TextStyle(
                                    color: CupertinoColors.systemGrey),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: CupertinoColors.systemGrey3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("End date",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              CupertinoTextField(
                                autofocus: true,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                controller: _enddateController,
                                placeholder: "Dec 20, 2020",
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
                              Text(
                                  " * End date should be greater than start date",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: CupertinoColors.systemGrey2,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 130,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CupertinoButton(
                                  color: CupertinoColors.black,
                                  child: Text(
                                    "Ok",
                                    style:
                                        TextStyle(color: CupertinoColors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop({"pop": true});
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
