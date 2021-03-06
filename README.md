# ffr_form_input_field

Form Input Field Package created with flutter.

The source code is **100% Dart and Flutter**, and all necessary files are located in the [/lib](https://github.com/ffr-devteam/ffr_form_input_field/tree/main/lib) folder

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
ffr_form_input_field: <latest_version>
```

Import in your project:
```dart
import 'package:ffr_form_input_field/ffr_form_input_field.dart';
```

## Basic Ussage

```dart
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
  final FocusNode _testNode = FocusNode();
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
  void dispose() {
    _testNode.dispose();
    super.dispose();
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
                      autofocus: true,
                      focusNode: _testNode,
                      onFieldSubmitted: (term){
                        _testNode.unfocus();
                      },
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
```