import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sanal_kutuphane/Service/RoomService.dart';
import 'package:sanal_kutuphane/model/RoomModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map> items = [
    {"id": 0, "title": "ÇAY KAHVE", "online": 15},
    {
      "id": 1,
      "title": "YKS ÇALIŞMA",
      "online": 126,
    },
    {
      "id": 2,
      "title": "KPSS ÇALIŞMA",
      "online": 26,
    },
    {
      "id": 3,
      "title": "LGS ÇALIŞMA",
      "online": 74,
    },
    {
      "id": 4,
      "title": "VİZE FİNAL",
      "online": 82,
    },
    {
      "id": 5,
      "title": "BİLİM",
      "online": 25,
    },
    {
      "id": 6,
      "title": "SANAT",
      "online": 37,
    },
    {
      "id": 7,
      "title": "KÜLTÜR",
      "online": 48,
    },

  ];


  List<RoomModel> _rooms;
  bool _loading;

  void getAll() {
    _loading = true;
    RoomService.getAll().then((value) {
      setState(() {
        _rooms = value;
        _loading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAll();

    new Timer.periodic(Duration(seconds: 3), (Timer t) => setState((){
      getAll();
      print("Cekildi");
    }));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Sanal Kütüphane"),),
      body: RefreshIndicator(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            bilboard(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.60,
              child: SingleChildScrollView(
                  primary: true,
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      buttons(),
                    ],
                  )),
            )
          ],
        ),
        onRefresh:(){setState(() {
          getAll();
        });},
      )
    );
  }

  Container bilboard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      //margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80.0),
          bottomRight: Radius.circular(80.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xBB000000),
            blurRadius: 4.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Sanal Kütüphane",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                child: Text(
                  "1285 Kişi",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),),
              SizedBox(width: 10,),
              Icon(
                Icons.circle,
                size: 20,
                color: Colors.white,
              )

            ],
          )
        ],
      ),
    );
  }

  Container buttons() {
    return Container(
      margin: EdgeInsets.only(left: 1, right: 1),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: MediaQuery.of(context).size.height * 0.001,
        crossAxisCount: 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        children: List.generate(null == _rooms ? 0 : _rooms.length, (index) {
          return Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    print(items[index]['id']);
                   // openPage(items[index]['id']);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        child: Text(
                          _rooms[index].roomName,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            child: Text(
                              _rooms[index].personCount.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),),
                          SizedBox(width: 10,),
                          Icon(
                            Icons.circle,
                            size: 20,
                            color: Colors.white,
                          )

                        ],
                      )
                    ],
                  ),
                ),

              ),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xBB000000),
                    blurRadius: 4.0,
                    spreadRadius: 0.0,
                    offset: Offset(
                        2.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ));
        }),
      ),
    );
  }

}
