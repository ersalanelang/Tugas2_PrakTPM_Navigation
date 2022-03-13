import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'model/skin.dart';

class DetailPage extends StatelessWidget {
  // final Movie movie;
  final String image;
  final String name;
  final String itemDetail;
  final String price;

  const DetailPage({
    Key? key,
    required this.image,
    required this.name,
    required this.itemDetail,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Page"),
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black87,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  Image.network(image),
                  TopRoundedContainer(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: Text(
                            name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: Text(
                            itemDetail,
                              style: TextStyle(fontSize: 17, color: Colors.black87),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: Text(
                            price,
                            style: TextStyle(fontSize: 17, color: Colors.black87),
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                              Colors.red,// background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: (){},
                            child: const Text('Beli'),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: child,
    );
  }
}
