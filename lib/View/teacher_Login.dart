import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TeacherLoginAUth extends StatefulWidget {
  const TeacherLoginAUth({ Key? key }) : super(key: key);

  @override
  State<TeacherLoginAUth> createState() => _TeacherLoginAUthState();
}

class _TeacherLoginAUthState extends State<TeacherLoginAUth> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  String _errorMessage = '';
  bool _validate = false;
  ConnectivityResult? _connectivityResult;
  late StreamSubscription _connectivitySubscription;
  bool _isConnectionSuccessful = false;

  Future<void> _checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    setState(() {
      _connectivityResult = result;
    });
  }
  Future<void> _tryConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      setState(() {
        _isConnectionSuccessful = response.isNotEmpty;
      });
    } on SocketException catch (e) {
      setState(() {
        _isConnectionSuccessful = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
        ConnectivityResult result
    ) {
      setState(() {
        _connectivityResult = result;
      });
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _connectivitySubscription.cancel();
    super.dispose();
  }

  String dropdownvalue = 'Thornhill Secondary School';
  String stats = 'None';
  var items = ['Thornhill Secondary School', 'Your school is not available yet'];



  @override
  Widget build(BuildContext context) {
    _tryConnection();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(32, 78, 74, 1),
        title: const Text("Teacher login", style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold'),),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil('/TSS_school', (route) => false);
          },
          color: Colors.white,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const Text('Login to change the Announcement:', style: TextStyle(fontSize: 25, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                const SizedBox(height: 20),
                const Text('YOU NEED TO BE A AUTHORIZED TEACHER TO CHANGE INFO!', style: TextStyle(fontSize: 15, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                const SizedBox(height: 20),
                  TextField(
                    controller: _email,
                    cursorColor: const Color.fromRGBO(46, 147, 60, 1),
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: false,
                    autocorrect: false,
                    scrollPadding: const EdgeInsets.all(10.0),
                    maxLines: 1,
                    enabled: true,
                    scrollPhysics: const BouncingScrollPhysics(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lato',
                      color: const Color.fromRGBO(0,0,0, 1),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorText: _validate ? _errorMessage : null,
                    ),
                  ),
                  TextField(
                    cursorColor: const Color.fromRGBO(46, 147, 60, 1),
                    controller: _password,
                    obscureText: true,
                    scrollPadding: const EdgeInsets.all(10.0),
                    enableSuggestions: false,
                    maxLines: 1,
                    enabled: true,
                    scrollPhysics: const BouncingScrollPhysics(),
                    autocorrect: false,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lato',
                      color: const Color.fromRGBO(0,0,0, 1),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: _validate ? _errorMessage : null,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text('Choose your school:', style: TextStyle(fontSize: 22, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                  const SizedBox(height: 20),
                  DropdownButton(
                    elevation: 15,
                    iconDisabledColor: Colors.white,
                    iconSize: 30,
                    dropdownColor: const Color.fromRGBO(247, 198, 71, 1),
                    borderRadius: BorderRadius.circular(10),
                    iconEnabledColor: const Color.fromRGBO(32, 78, 74, 1),
                    style: const TextStyle(fontSize: 17, fontFamily: 'Lato-bold', color: Colors.black),
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (!mounted) return;
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      onSurface: Colors.white,
                      shadowColor: Colors.black,
                      backgroundColor: Color.fromARGB(255, 32, 78, 74),
                      padding: const EdgeInsets.all(10.0),
                      maximumSize: const Size.fromWidth(200.0),
                      animationDuration: const Duration(milliseconds: 100),
                      elevation: 3,
                    ),
                    onPressed: () async {
                      if (_isConnectionSuccessful == true) {
                        setState(() {
                        _email.text.isEmpty ? _validate = true : _validate = false;
                        _password.text.isEmpty ? _validate = true : _validate = false;
                        });
                        final email = _email.text;
                        final password = _password.text;
                        if (dropdownvalue == "Thornhill Secondary School"){
                          try {
                            await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email,
                            password: password,
                            );
                            Navigator.of(context).pushNamedAndRemoveUntil('/changeAuthAnnouncement', (route) => false);
                            _validate = false;
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found' || e.code == 'invalid-email') {
                              setState(() {
                                _errorMessage = 'Invalid email or password';
                                _validate = true;
                              });
                            } else if (e.code == 'wrong-password') {
                              setState(() {
                                _validate = true;
                                _errorMessage = 'Wrong password';
                              });
                            } else if (e.code == "unknown") {
                              setState(() {
                                _validate = true;
                                _errorMessage = 'Email or password cannot be empty';
                              });
                            } else if (e.code == "too-many-requests") {
                              setState(() {
                                _validate = true;
                                _errorMessage = 'Too many requests have been made please try again later';
                              });
                            } else if (e.code == "network-request-failed") {
                              setState(() {
                                _validate = true;
                                _errorMessage = 'Network request failed please try again later';
                              });
                            }
                          }
                        } else {
                          setState(() {
                            _validate = true;
                            _errorMessage = 'Please choose a valid school';
                          });
                        }
                      } else {
                        _errorMessage = 'No internet connection';
                        _tryConnection();
                      }
                    },
                    child: const Text('Enter', style: TextStyle(fontSize: 15, fontFamily: 'Lato-bold'))
                    ),
              ],
            ),
        ),
      ),
    );
  }
}
