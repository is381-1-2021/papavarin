import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Third Page'),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text('24'),
              ),
              Tab(
                child: Text('25'),
              ),
              Tab(
                child: Text('26'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Cloudy'),
            ),
            Center(
              child: Text('Rainny'),
            ),
            Center(
              child: Text('Sunnt'),
            ),
          ],
        ),
      ),
    );
  }
}
