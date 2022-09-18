import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'global.dart' as gl;
import 'package:flutter/material.dart';


class ChangeDatabase extends StatefulWidget {
  const ChangeDatabase({ Key? key }) : super(key: key);

  @override
  State<ChangeDatabase> createState() => _ChangeDatabaseState();
}

class _ChangeDatabaseState extends State<ChangeDatabase> {
  final _database = FirebaseDatabase.instance.ref();
  late final TextEditingController _tittle;
  late final TextEditingController _des;
  String dropdownvalue = 'Monday';
  String stats = '';
  var week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  @override
  void initState() {
    super.initState();
    _tittle = TextEditingController();
    _des = TextEditingController();
  }
  @override
  void dispose() {
    _tittle.dispose();
    _des.dispose();
    super.dispose();
  }
  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
  _tittleMon() {
      _database.child('Monday/tittle').onValue.listen((event) {
          final tittle = event.snapshot.value;
          if (!mounted) return;
          setState(() {
            final _displayText = '$tittle';
            gl.monTittle = _displayText;
          });
        });
        return gl.monTittle;
    }
    _descriptionMon() {
      _database.child('Monday/description').onValue.listen((event) {
          final description = event.snapshot.value;
          if (!mounted) return;
          setState(() {
            final _displayText = '$description';
            gl.monDes = _displayText;
          });
        });
        List<String> monDes = gl.monDes.split('.');
        String monDes1 = monDes.join("\n\n");
        return monDes1;
    }
    _tittleTue() {
      _database.child('Tuesday/tittle').onValue.listen((event) {
          final tittle = event.snapshot.value;
          if (!mounted) return;
          setState(() {
            final _displayText = '$tittle';
            gl.tueTittle = _displayText;
          });
        });
        return gl.tueTittle;
    }
    _descriptionTue() {
      _database.child('Tuesday/description').onValue.listen((event) {
          final description = event.snapshot.value;
          if (!mounted) return;
          setState(() {
            final _displayText = '$description';
            gl.tueDes = _displayText;
          });
        });
        List<String> tueDes = gl.tueDes.split('.');
        String tueDes1 = tueDes.join("\n\n");
        return tueDes1;
    }
    _tittleWed() {
      _database.child('Wednesday/tittle').onValue.listen((event) {
          final tittle = event.snapshot.value;
          if (!mounted) return;
          setState(() {
            final _displayText = '$tittle';
            gl.wenTittle = _displayText;
          });
        });
        return gl.wenTittle;
    }
    _descriptionWed() {
      _database.child('Wednesday/description').onValue.listen((event) {
          final description = event.snapshot.value;
          if (!mounted) return;
          setState(() {
            final _displayText = '$description';
            gl.wenDes = _displayText;
          });
        });
        List<String> wedDes = gl.wenDes.split('.');
        String wedDes1 = wedDes.join(".\n\n");
        return wedDes1;
    }
    _tittleThur() {
      _database.child('Thursday/tittle').onValue.listen((event) {
          final tittle = event.snapshot.value;
          if (!mounted) return;
          setState(() {
            final _displayText = '$tittle';
            gl.thurTittle = _displayText;
          });
        });
        return gl.thurTittle;
    }
    _descriptionThur() {
      _database.child('Thursday/description').onValue.listen((event) {
          final description = event.snapshot.value;
          if (!mounted) return;
          setState(() {
            final _displayText = '$description';
            gl.thurDes = _displayText;
          });
        });
        List<String> thurDes = gl.thurDes.split('.');
        String thurDes1 = thurDes.join(".\n\n");
        return thurDes1;
    }
    _tittleFri() {
      _database.child('Friday/tittle').onValue.listen((event) {
          final tittle = event.snapshot.value;
          if (!mounted) return;
          setState(() {
            final _displayText = '$tittle';
            gl.friTittle = _displayText;
          });
        });
        return gl.friTittle;
    }
    _descriptionFri() {
      _database.child('Friday/description').onValue.listen((event) {
          final description = event.snapshot.value;
          if (!mounted) return;
          setState(() {
            final _displayText = '$description';
            gl.friDes = _displayText;
          });
        });
        List<String> friDes = gl.friDes.split('.');
        String friDes1 = friDes.join(".\n\n");
        return friDes1;
    }

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(8, 65, 92, 1),
          title: const Text("Change Data", style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold'),),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Choose the day:', style: TextStyle(fontSize: 25, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                  const SizedBox(height: 15),
                  DropdownButton(
                    elevation: 15,
                    iconDisabledColor: Colors.black,
                    iconSize: 30,
                    dropdownColor: const Color.fromARGB(255, 181, 255, 225),
                    borderRadius: BorderRadius.circular(10),
                    iconEnabledColor: const Color.fromRGBO(204, 41, 54, 1),
                    style: const TextStyle(fontSize: 22, fontFamily: 'Lato-bold', color: Colors.black),
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: week.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (!mounted) return;
                      setState(() {
                        dropdownvalue = newValue!;
                        stats = "";
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  if (dropdownvalue == 'Monday')
                    Column(
                      children: [
                        const Text('Tittle: ', style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold')),
                        const SizedBox(height: 10),
                        Text(_tittleMon(), style: const TextStyle(fontSize: 17, fontFamily: 'Lato'), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextField(
                          cursorColor: const Color.fromRGBO(8, 65, 92, 1),
                          scrollPadding: const EdgeInsets.all(10.0),
                          enabled: true,
                          scrollPhysics: const BouncingScrollPhysics(),
                          style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                          color: Colors.black,
                          ),
                          keyboardType: TextInputType.multiline,
                          controller: _tittle,
                          enableSuggestions: true,
                          autocorrect: true,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Enter new tittle',
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text('Description: ', style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                        const SizedBox(height: 10),
                        Text(_descriptionMon(), style: const TextStyle(fontSize: 20, fontFamily: 'Lato'), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextField(
                          cursorColor: const Color.fromRGBO(8, 65, 92, 1),
                          scrollPadding: const EdgeInsets.all(10.0),
                          enabled: true,
                          scrollPhysics: const BouncingScrollPhysics(),
                          style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                          color: Colors.black,
                          ),
                          controller: _des,
                          enableSuggestions: true,
                          keyboardType: TextInputType.multiline,
                          autocorrect: true,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Edit the description',
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(stats, style: const TextStyle(fontSize: 17, fontFamily: 'Lato', color: Color.fromARGB(250, 204, 41, 54)), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            onSurface: Colors.white,
                            shadowColor: Colors.black,
                            backgroundColor: const Color.fromARGB(250, 8, 65, 92),
                            padding: const EdgeInsets.all(10.0),
                            maximumSize: const Size.fromWidth(200.0),
                            animationDuration: const Duration(milliseconds: 100),
                            elevation: 3,
                          ),
                          child: const Text('Save', style: TextStyle(fontSize: 15, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                          onPressed: () {
                            if (_tittle.text.isNotEmpty) {
                              _database.child('Monday/tittle').set(_tittle.text);
                              _tittle.clear();
                              setState(() {
                                stats = 'Tittle changed';
                              });
                            } else if (_des.text.isNotEmpty) {
                              _database.child('Monday/description').set(_des.text);
                              _des.clear();
                              setState(() {
                                stats = 'Description changed';
                              });
                            } else if (_tittle.text.isEmpty && _des.text.isEmpty) {
                              setState(() {
                                stats = 'Nothing to save';
                              });
                            } else {
                              setState(() {
                                stats = 'There was an error we could not save the data';
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  if (dropdownvalue == 'Tuesday')
                    Column(
                      children: [
                        const Text('Tittle: ', style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold')),
                        const SizedBox(height: 10),
                        Text(_tittleTue(), style: const TextStyle(fontSize: 17, fontFamily: 'Lato'), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextField(
                          cursorColor: const Color.fromRGBO(8, 65, 92, 1),
                          scrollPadding: const EdgeInsets.all(10.0),
                          enabled: true,
                          scrollPhysics: const BouncingScrollPhysics(),
                          style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                          color: Colors.black,
                          ),
                          keyboardType: TextInputType.multiline,
                          controller: _tittle,
                          enableSuggestions: true,
                          autocorrect: true,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Enter new tittle',
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text('Description: ', style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                        const SizedBox(height: 10),
                        Text(_descriptionTue(), style: const TextStyle(fontSize: 20, fontFamily: 'Lato'), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextField(
                          cursorColor: const Color.fromRGBO(8, 65, 92, 1),
                          scrollPadding: const EdgeInsets.all(10.0),
                          enabled: true,
                          scrollPhysics: const BouncingScrollPhysics(),
                          style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                          color: Colors.black,
                          ),
                          controller: _des,
                          enableSuggestions: true,
                          keyboardType: TextInputType.multiline,
                          autocorrect: true,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Edit the description',
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(stats, style: const TextStyle(fontSize: 17, fontFamily: 'Lato', color: Color.fromARGB(250, 204, 41, 54)), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            onSurface: Colors.white,
                            shadowColor: Colors.black,
                            backgroundColor: const Color.fromARGB(250, 8, 65, 92),
                            padding: const EdgeInsets.all(10.0),
                            maximumSize: const Size.fromWidth(200.0),
                            animationDuration: const Duration(milliseconds: 100),
                            elevation: 3,
                          ),
                          child: const Text('Save', style: TextStyle(fontSize: 15, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                          onPressed: () {
                            if (_tittle.text.isNotEmpty) {
                              _database.child('Tuesday/tittle').set(_tittle.text);
                              _tittle.clear();
                              setState(() {
                                stats = 'Tittle changed';
                              });
                            } else if (_des.text.isNotEmpty) {
                              _database.child('Tuesday/description').set(_des.text);
                              _des.clear();
                              setState(() {
                                stats = 'Description changed';
                              });
                            } else if (_tittle.text.isEmpty && _des.text.isEmpty) {
                              setState(() {
                                stats = 'Nothing to save';
                              });
                            } else {
                              setState(() {
                                stats = 'There was an error we could not save the data';
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  if (dropdownvalue == 'Wednesday')
                    Column(
                      children: [
                        const Text('Tittle: ', style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold')),
                        const SizedBox(height: 10),
                        Text(_tittleWed(), style: const TextStyle(fontSize: 17, fontFamily: 'Lato'), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextField(
                          cursorColor: const Color.fromRGBO(8, 65, 92, 1),
                          scrollPadding: const EdgeInsets.all(10.0),
                          enabled: true,
                          scrollPhysics: const BouncingScrollPhysics(),
                          style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                          color: Colors.black,
                          ),
                          keyboardType: TextInputType.multiline,
                          controller: _tittle,
                          enableSuggestions: true,
                          autocorrect: true,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Enter new tittle',
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text('Description: ', style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                        const SizedBox(height: 10),
                        Text(_descriptionWed(), style: const TextStyle(fontSize: 20, fontFamily: 'Lato'), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextField(
                          cursorColor: const Color.fromRGBO(8, 65, 92, 1),
                          scrollPadding: const EdgeInsets.all(10.0),
                          enabled: true,
                          scrollPhysics: const BouncingScrollPhysics(),
                          style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                          color: Colors.black,
                          ),
                          keyboardType: TextInputType.multiline,
                          controller: _des,
                          enableSuggestions: true,
                          autocorrect: true,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Edit the description',
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(stats, style: const TextStyle(fontSize: 17, fontFamily: 'Lato', color: Color.fromARGB(250, 204, 41, 54)), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            onSurface: Colors.white,
                            shadowColor: Colors.black,
                            backgroundColor: const Color.fromARGB(250, 8, 65, 92),
                            padding: const EdgeInsets.all(10.0),
                            maximumSize: const Size.fromWidth(200.0),
                            animationDuration: const Duration(milliseconds: 100),
                            elevation: 3,
                          ),
                          child: const Text('Save', style: TextStyle(fontSize: 15, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                          onPressed: () {
                            if (_tittle.text.isNotEmpty) {
                              _database.child('Wednesday/tittle').set(_tittle.text);
                              _tittle.clear();
                              setState(() {
                                stats = 'Tittle changed';
                              });
                            } else if (_des.text.isNotEmpty) {
                              _database.child('Wednesday/description').set(_des.text);
                              _des.clear();
                              setState(() {
                                stats = 'Description changed';
                              });
                            } else if(_tittle.text.isEmpty && _des.text.isEmpty) {
                              setState(() {
                                stats = 'Nothing to save';
                              });
                            } else {
                              setState(() {
                                stats = 'There was an error we could not save the data';
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  if (dropdownvalue == 'Thursday')
                    Column(
                      children: [
                        const Text('Tittle: ', style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold')),
                        const SizedBox(height: 10),
                        Text(_tittleThur(), style: const TextStyle(fontSize: 17, fontFamily: 'Lato'), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextField(
                          cursorColor: const Color.fromRGBO(8, 65, 92, 1),
                          scrollPadding: const EdgeInsets.all(10.0),
                          enabled: true,
                          scrollPhysics: const BouncingScrollPhysics(),
                          style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                          color: Colors.black,
                          ),
                          keyboardType: TextInputType.multiline,
                          controller: _tittle,
                          enableSuggestions: true,
                          autocorrect: true,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Enter new tittle',
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text('Description: ', style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                        const SizedBox(height: 10),
                        Text(_descriptionThur(), style: const TextStyle(fontSize: 20, fontFamily: 'Lato'), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextField(
                          cursorColor: const Color.fromRGBO(8, 65, 92, 1),
                          scrollPadding: const EdgeInsets.all(10.0),
                          enabled: true,
                          scrollPhysics: const BouncingScrollPhysics(),
                          style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                          color: Colors.black,
                          ),
                          keyboardType: TextInputType.multiline,
                          controller: _des,
                          enableSuggestions: true,
                          autocorrect: true,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Edit the description',
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(stats, style: const TextStyle(fontSize: 17, fontFamily: 'Lato', color: Color.fromARGB(250, 204, 41, 54)), textAlign: TextAlign.center),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            onSurface: Colors.white,
                            shadowColor: Colors.black,
                            backgroundColor: const Color.fromARGB(250, 8, 65, 92),
                            padding: const EdgeInsets.all(10.0),
                            maximumSize: const Size.fromWidth(200.0),
                            animationDuration: const Duration(milliseconds: 100),
                            elevation: 3,
                          ),
                          child: const Text('Save', style: TextStyle(fontSize: 15, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                          onPressed: () {
                            if (_tittle.text.isNotEmpty) {
                              _database.child('Thursday/tittle').set(_tittle.text);
                              _tittle.clear();
                              setState(() {
                                stats = 'Tittle changed';
                              });
                            } else if (_des.text.isNotEmpty) {
                              _database.child('Thursday/description').set(_des.text);
                              _des.clear();
                              setState(() {
                                stats = 'Description changed';
                              });
                            } else if(_tittle.text.isEmpty && _des.text.isEmpty) {
                              setState(() {
                                stats = 'Nothing to save';
                              });
                            } else {
                              setState(() {
                                stats = 'There was an error we could not save the data';
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  if (dropdownvalue == 'Friday')
                    Column(
                      children: [
                        const Text('Tittle: ', style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold')),
                        const SizedBox(height: 10),
                        Text(_tittleFri(), style: const TextStyle(fontSize: 17, fontFamily: 'Lato'), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextField(
                          cursorColor: const Color.fromRGBO(8, 65, 92, 1),
                          scrollPadding: const EdgeInsets.all(10.0),
                          enabled: true,
                          scrollPhysics: const BouncingScrollPhysics(),
                          style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                          color: Colors.black,
                          ),
                          keyboardType: TextInputType.multiline,
                          controller: _tittle,
                          enableSuggestions: true,
                          autocorrect: true,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Enter new tittle',
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text('Description: ', style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                        const SizedBox(height: 10),
                        Text(_descriptionFri(), style: const TextStyle(fontSize: 20, fontFamily: 'Lato'), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextField(
                          cursorColor: const Color.fromRGBO(8, 65, 92, 1),
                          scrollPadding: const EdgeInsets.all(10.0),
                          enabled: true,
                          scrollPhysics: const BouncingScrollPhysics(),
                          style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                          color: Colors.black,
                          ),
                          keyboardType: TextInputType.multiline,
                          controller: _des,
                          enableSuggestions: true,
                          autocorrect: true,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Edit the description',
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(stats, style: const TextStyle(fontSize: 17, fontFamily: 'Lato', color: Color.fromARGB(250, 204, 41, 54)), textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            onSurface: Colors.white,
                            shadowColor: Colors.black,
                            backgroundColor: const Color.fromARGB(250, 8, 65, 92),
                            padding: const EdgeInsets.all(10.0),
                            maximumSize: const Size.fromWidth(200.0),
                            animationDuration: const Duration(milliseconds: 100),
                            elevation: 3,
                          ),
                          child: const Text('Save', style: TextStyle(fontSize: 15, fontFamily: 'Lato-bold'), textAlign: TextAlign.center,),
                          onPressed: () {
                            if (_tittle.text.isNotEmpty) {
                              _database.child('Friday/tittle').set(_tittle.text);
                              _tittle.clear();
                              setState(() {
                                stats = 'Title changed';
                              });
                            } else if (_des.text.isNotEmpty) {
                              _database.child('Friday/description').set(_des.text);
                              _des.clear();
                              setState(() {
                                stats = 'Description changed';
                              });
                            } else if (_des.text.isEmpty && _tittle.text.isEmpty) {
                              setState(() {
                                stats = "Nothing to save";
                              });
                            } else {
                              setState(() {
                                stats = "There was an error we could not save the data";
                              });
                            }
                          },
                        ),
                      ],
                    ),

                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      onSurface: Colors.white,
                      shadowColor: Colors.black,
                      backgroundColor: const Color.fromARGB(250, 204, 41, 54),
                      padding: const EdgeInsets.all(10.0),
                      maximumSize: const Size.fromWidth(200.0),
                      animationDuration: const Duration(milliseconds: 100),
                      elevation: 3,
                    ),
                    child: const Text('logout'),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil('/TSS_school', (route) => false);
                    },
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}