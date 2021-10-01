import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 4, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(50, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white),
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ]),
          ),
          bottom: TabBar(
            controller: controller,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(text: 'All Result'),
              Tab(text: 'Flash Card'),
              Tab(text: 'folder'),
              Tab(text: 'users'),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            HomePage(),
            HomePage(),
            HomePage(),
            HomePage(),
          ],
        ));
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
