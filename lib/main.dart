import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learning_mobx/controller.dart';
import 'package:learning_mobx/widgets/login_button.dart';
import 'package:mobx/mobx.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobx',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Mobx'),
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
  final controller = Controller();

  _textField({String labelText, onChanged, String Function() errorText}) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Observer(
                    builder: (_) {
                      return _textField(
                          errorText: controller.validateName,
                          labelText: "Name",
                          onChanged: controller.client.changeName);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Observer(
                    builder: (_) {
                      return _textField(
                          errorText: controller.validateEmail,
                          labelText: "Email",
                          onChanged: controller.client.changeEmail);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Observer(
                    builder: (_) {
                      return _textField(
                          errorText: controller.validateCpf,
                          labelText: "Cpf",
                          onChanged: controller.client.changeCpf);
                    },
                  ),
                ),
                Observer(
                  builder: (_) {
                    return LoginButton(
                      onPressed: controller.isValid ? () {} : null,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
