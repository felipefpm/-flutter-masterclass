import 'package:flutter/material.dart';
import 'package:flutter_masterclass/controllers/signup.controller.dart';
import 'package:flutter_masterclass/store/store.app.dart';
import 'package:flutter_masterclass/view-models/signup.viewmodel.dart';
import 'package:flutter_masterclass/views/home.view.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = new SignupController();
  var model = new SignupViewModel();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  "Cadastro",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Nome invalido';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.name = val;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email invalido';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.email = val;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Senha invalida';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.password = val;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                model.busy
                    ? Center(
                        child: Container(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          ),
                        ),
                      )
                    : FlatButton(
                        child: Text("Cadastrar"),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                          }

                          setState(() {});
                          _controller.create(model).then((data) {
                            setState(() {});
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ),
                            );
                          });
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
