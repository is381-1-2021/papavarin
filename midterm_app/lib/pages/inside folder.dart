import 'package:midterm_app/models/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Folder'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _English = '';
  String? _Thai = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.language,
                ),
                hintText: 'Fill your English Word',
                hintStyle: TextStyle(fontSize: 20),
                labelText: 'English',
                labelStyle: TextStyle(fontSize: 25, color: Colors.blue[900]),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.indigo)),
                fillColor: Colors.lightBlue[50],
                filled: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Do not forget to fill English Word!';
              }
            },
            onSaved: (value) {
              _English = value!;
            },
            initialValue: context.read<FormModel>().English,
          ),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.keyboard),
                hintText: 'Fill your Thai Word',
                hintStyle: TextStyle(fontSize: 20),
                labelText: 'Thai',
                labelStyle: TextStyle(fontSize: 25, color: Colors.blue[900]),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.indigo)),
                fillColor: Colors.lightBlue[50],
                filled: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Do not forget to fill Thai Word!';
              }
            },
            onSaved: (value) {
              _Thai = value!;
            },
            initialValue: context.read<FormModel>().Thai,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context.read<FormModel>().English = _English;
                context.read<FormModel>().Thai = _Thai;

                Navigator.pop(context);
              }
            },
            child: Text('Add New Word'),
          ),
        ],
      ),
    );
  }
}
