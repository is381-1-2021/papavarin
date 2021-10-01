import 'package:midterm_app/models/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  String? _message = 'Here is where we get value back.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Test4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<FormModel>(
                builder: (context, model, child) {
                  return Text(
                      'New Word Added! - ${model.English} ${model.Thai}');
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue[800]),
              onPressed: () async {
                var response = await Navigator.pushNamed(context, '/2');
              },
              child: Text('Click Here to add more words'),
            ),
          ],
        ),
      ),
    );
  }
}
