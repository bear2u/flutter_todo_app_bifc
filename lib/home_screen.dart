import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<Widget> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = getItems();
    print(list.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, idx) {
          print('view idx => $idx');
          return list[idx];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          list.add(ItemWidget(
            imagePath:
                "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile7.uf.tistory.com%2Fimage%2F24283C3858F778CA2EFABE",
            title: '강아지${list.length + 1}',
          ));
          setState(() {});
        },
      ),
    );
  }

  getItems() {
    List<Widget> widgets = [];
    for (var i = 0; i < 3; i++) {
      widgets.add(ItemWidget(
        imagePath:
            "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile7.uf.tistory.com%2Fimage%2F24283C3858F778CA2EFABE",
        title: '강아지$i',
      ));
    }

    return widgets.toList();
  }
}

class ItemWidget extends StatefulWidget {
  String imagePath;
  String title;

  ItemWidget({this.imagePath, this.title});

  @override
  State<StatefulWidget> createState() {
    return ItemWidgetState();
  }
}

class ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.network(
          widget.imagePath,
          width: 100.0,
          fit: BoxFit.fitWidth,
        ),
        Text(widget.title),
      ],
    );
  }
}
