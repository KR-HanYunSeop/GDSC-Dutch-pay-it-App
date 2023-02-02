import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dutch_pay_it/Screens/calculate.dart';
import 'package:dutch_pay_it/Model/object.dart';

class menuList extends StatefulWidget {
  const menuList({Key? key}) : super(key: key);

  @override
  State<menuList> createState() => _menuListState();
}

class _menuListState extends State<menuList> {
  List<String> nameList = ['재원', '채민', '하늘','민혁'];
  List<String> nameLabel = ['지영'];     // 이름 라벨 리스트
  var selectedName;
  var count = 0;
  var itemcount = 0;

  List<dynamic> menuInfo = [['소주', 6, 30000], ['안주', 1, 20000], ['맥주', 1, 5000]];
  String shop = '식당이름';

  List<MenuList> menulist = [
    MenuList('식당1', '소주', 6, 30000, '지영', 1),
    MenuList("식당1", "안주", 1, 20000, "현수", 1),
    MenuList("식당1", "맥주", 1, 5000, "민혁", 1),
  ];

  TextEditingController _menuController = new TextEditingController(text: '픔목');
  TextEditingController _priceController = new TextEditingController(text: '10000' + '원');
  TextEditingController _countController = new TextEditingController(text: '1' + '개');

  final namelist = ['재원', '채민', '하늘','민혁'];
  String? dropdownValue;
  String? selected;

  printmenu() {
    for (int i = 0; i < 3; i++) {
      print(menulist[i].menuName);
    }
  }


  addCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    itemcount = count;
    return Scaffold(
        appBar: AppBar(
          title:Text('정보 입력'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          //padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 5),
              Flexible(
                flex: 1,
                child: Text("${shop}",
                  style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Flexible(
                flex: 12,
                child: ListView.builder(
                  //itemCount: widget.menuInfo.length,
                    itemCount: 3,
                    itemBuilder: (BuildContext ctx, i) {
                      return Card(
                          elevation: 4.0,
                          color: Color(0xffFFFFFF),
                          margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                                    child: Row(
                                      children: [
                                        Container(
                                            width: 40,
                                            child: Center(child: Text('품목'))),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 20,
                                            width: 100,
                                            child: Flexible(
                                              child: TextField(textAlign: TextAlign.center,
                                                controller: new TextEditingController(text: '${menulist[i].menuName}'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: 40,
                                            child: Center(child: Text('수량'))),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 20,
                                            width: 100,
                                            child: Flexible(
                                              child: TextField(textAlign: TextAlign.center,
                                                controller: new TextEditingController(text: '${menulist[i].menuCount}'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                Container(
                                    padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                                    child: Row(
                                        children: [
                                          Container(
                                              width: 40,
                                              child: Center(child: Text('가격'))),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 20,
                                              width: 100,
                                              child: Flexible(
                                                child: TextField(textAlign: TextAlign.center,
                                                  controller: new TextEditingController(text: '${menulist[i].price}'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]
                                    )
                                ),
                                Container(
                                    padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                                    child: Row(
                                      children: [
                                        Container(
                                            width: 40,
                                            child: Center(child: Text('이름'))),
                                        Expanded(flex: 6,
                                          child: Container(
                                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                              height: 20.0,
                                              width:10,
                                              child: addnameLabel(),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                          width: 20,
                                          height: 20,
                                           child: ElevatedButton(
                                               onPressed: () {
                                                 addDialog();
                                               },
                                               child: Center(child: Icon(Icons.add, size: 14, color: Colors.black,)),
                                               style: ElevatedButton.styleFrom(
                                                 primary: Color(0xffEEEEEE),
                                                 padding: EdgeInsets.zero,
                                                 shadowColor: Colors.grey,// 버튼 여백 제거
                                               )
                                           ),
                                         ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          )
                      );
                    }
                )
              ),
              SizedBox(height: 20),
              buttonBox(count:itemcount, nameLabel:nameLabel, menuInfo:menuInfo),
            ],
          ),
        )
    );
  }

  // + 버튼 누르면 다이얼로그를 띄워주는 함수
  addDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Column(
              children: <Widget>[
                new Text("추가할 사람을 선택해주세요"),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                Dropdown()
                //Text("안녕")
              ]
            ),
            actions: [
              Center(
                child: new ElevatedButton(
                  child: new Text("선택하기"),
                  onPressed: () {
                    addCount();
                    selectedName = selected;   // 드롭다운 메뉴에서 선택한 이름 저장
                    print('selected Name : ${selectedName}');
                    setState((){nameLabel.add(selectedName);});
                    print('count: ${count}');
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.blueGrey,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        });
  }
 @override
 void debugFillProperties(DiagnosticPropertiesBuilder properties) {
   super.debugFillProperties(properties);
      properties.add(DiagnosticsProperty('dropdownValue', dropdownValue));
 }

  // 메뉴별 구성원 이름을 출력 - 가로 Listview
  addnameLabel() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count+1,
        itemBuilder: (c,i){
          return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
              width: 35,
              decoration: BoxDecoration(
                color: Color(0xff37b067),
                borderRadius: BorderRadius.circular(30),
              ),
              child:
              Center(
                  child: Text('${nameLabel[i]}', style: TextStyle(color: Colors.white, fontSize: 11),))
          );
        }
    );
  }
}

/*class addnameLabel extends StatelessWidget {
  addnameLabel({Key? key, this.count, this.nameLabel}) : super(key: key);
  var count;
  var nameLabel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count+1,
        itemBuilder: (c,i){
          return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
              width: 35,
              decoration: BoxDecoration(
                color: Color(0xff37b067),
                borderRadius: BorderRadius.circular(30),
              ),
              child:
              Center(
                  child: Text('${nameLabel[i]}', style: TextStyle(color: Colors.white, fontSize: 11),))
          );
        }
    );
  }
}*/

// Dialog 하단 버튼창 위젯
class buttonBox extends StatelessWidget {
  buttonBox({Key? key, this.count, this.nameLabel, this.menuInfo}) : super(key: key);
  var count;
  var nameLabel;
  var menuInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      width: double.infinity,
      height: 50,
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('수정하기', style: TextStyle(color: Colors.black),),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(90, 35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Colors.grey.shade300
            ),
          ),
          ElevatedButton(
            child: Text("확인", ),
            onPressed: () {
              print(count);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Calculate(count:count, nameLabel:nameLabel, menuInfo:menuInfo)),
              );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(90, 35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: Colors.blueGrey
            ),
          ),
        ],
      ),
    );
  }
}

class Dropdown extends StatefulWidget {
  Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  final namelist = ['재원', '채민', '하늘','민혁'];
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    setState(() {
      dropdownValue = namelist[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: true,
        value: dropdownValue,
        items: namelist.map((e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        )).toList(),
        onChanged: (value) {
          setState(() {
            dropdownValue = value!;
            print(dropdownValue);
          });
        }
    );
  }
}