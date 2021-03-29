import 'package:flutter/material.dart';
import 'Widgets/submitButton_widget.dart';

class GetUserDetails extends StatefulWidget {
  GetUserDetails(this.email, this.jsonData, this.emailHashCode,
      this.indexOfElement, this.status, this.context);
  String email;
  dynamic jsonData;
  var emailHashCode;
  var indexOfElement;
  var status;
  BuildContext context;

  @override
  _GetUserDetailsState createState() => _GetUserDetailsState();
}

class _GetUserDetailsState extends State<GetUserDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userCity;
  String userState;
  String userPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
        backgroundColor: Colors.black.withOpacity(0.9),
        elevation: 0,
        title: Text(
          "Enter Details",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: "City",
                        labelStyle: TextStyle(color: Colors.black),
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onChanged: (value) {
                        setState(() {
                          userCity = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: "State",
                        labelStyle: TextStyle(color: Colors.black),
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onChanged: (value) {
                        setState(() {
                          userState = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: "Contact number",
                        labelStyle: TextStyle(color: Colors.black),
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onChanged: (value) {
                        setState(() {
                          userPhoneNumber = value;
                        });
                      },
                      validator: (value) {
                        String patttern = r'(^(?:[+0]9)?[0-9]{11}$)';
                        RegExp regExp = new RegExp(patttern);
                        if (value.length == 0) {
                          return 'Please enter mobile number';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Please enter valid mobile number';
                        }
                        return null;
                      },
                    ),
                  ),
                  submitButton_widget(
                      _formKey,
                      widget.status,
                      widget.jsonData,
                      widget.email,
                      widget.indexOfElement,
                      widget.emailHashCode,
                      userCity,
                      userState,
                      userPhoneNumber,
                      context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
