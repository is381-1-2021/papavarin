import 'package:flutter/material.dart';
import 'package:midterm_app/controllers/calculator_controller.dart';
import 'package:midterm_app/model/calculator_model.dart';
import 'package:midterm_app/pages/2home.dart';
import 'package:midterm_app/services/calculator_services.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Cal> cals = List.empty();
  bool isLoading = false;
  var services = FirebaseServices();
  var controller;

  void initState() {
    super.initState();

    controller = CalculatorController(services);

    controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getCals() async {
    var newdata = await controller.fetchCals();

    setState(() => cals = newdata);
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: cals.isEmpty ? 1 : cals.length,
          itemBuilder: (ctx, index) {
            if (cals.isEmpty) {
              return Text(
                'click the button to see history',
                style: TextStyle(fontSize: 25),
              );
            }

            return Container(
              child: Column(
                children: [
                  Text(
                    cals[index].equatation,
                  ),
                ],
              ),
            );
          },
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('History'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _getCals,
          child: Icon(Icons.add),
        ),
        body: Center(child: body));
  }
}
