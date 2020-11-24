import 'package:ffr_form_input_field/ffr_form_input_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'FFR Form Input Field DEMO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _testKey = GlobalKey<FormFieldState<String>>();
  bool isError = false;

  String text = '';

  void _saveForm() {
    if (_formKey.currentState.validate()) {
      if (isError == false) {
        setState(() {
          text = _testKey.currentState.value;
        });
        _testKey.currentState.reset();
      } else {
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text('A value must be entered')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: FFRFromInputField(
                      hintText: 'I am a Text input field',
                      backgroundColor: Colors.lightGreen,
                      icon: Icon(Icons.check_box),
                      fieldKey: _testKey,
                      isError: isError,
                      textInputType: TextInputType.text,
                      validate: (String newValue) {
                        if (newValue.isEmpty) {
                          setState(() {
                            isError = true;
                          });
                        } else {
                          setState(() {
                            isError = false;
                          });
                        }
                      },
                      textStyle: TextStyle(color: Colors.black, fontSize: 20),
                      errorColor: Colors.red,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _saveForm,
                    child: Text('Press me'),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            text == '' ? Container() : Text(text),
          ],
        ),
      ),
    );
  }
}
