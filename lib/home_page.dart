import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas2_navigasi/detail_page.dart';

import 'model/skin.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        color: Colors.black87,
        padding: EdgeInsets.all(10),
        child: _createListCard(),
      ),
    );
  }

  Widget _createListCard() {
    var dataSkin= getData;

    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(dataSkin[index], context);
      },
      itemCount: dataSkin.length,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.red,
          height: 1,
          margin: EdgeInsets.symmetric(vertical: 7),
        );
      },
    );
  }

  Widget _createCard(Skin data, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(
              image: data.image,
              name: data.name,
              itemDetail: data.itemDetail,
              price: data.price,
            );
          }));
        },
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.network(data.image),
              ),
              Expanded(
                flex: 3,
                child: Container(
                    child: Text(
                        data.name,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
