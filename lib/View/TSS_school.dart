import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'global.dart' as gl;
import 'package:intl/intl.dart';

class thornhill_inf extends StatefulWidget {
  const thornhill_inf({ Key? key }) : super(key: key);

  @override
  State<thornhill_inf> createState() => _thornhill_infState();
}

class _thornhill_infState extends State<thornhill_inf> {
  final List<bool> _isExpanded = List.generate(10, (_) => false);
  List week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  final _database = FirebaseDatabase.instance.ref();
  var date = DateTime.now();
  late String day = DateFormat('EEEE').format(date);

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

  @override
  Widget build(BuildContext context) {
    if (day == 'Monday'){
      _isExpanded[0] = true;
    } else if (day == 'Tuesday'){
      _isExpanded[1] = true;
    } else if (day == 'Wednesday'){
      _isExpanded[2] = true;
    } else if (day == 'Thursday'){
      _isExpanded[3] = true;
    } else if (day == 'Friday'){
      _isExpanded[4] = true;
    }
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(32, 78, 74, 1),
          title: const Text("Thornhill Secondary School", style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold'),),
        ),
          body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Announcements:', style: TextStyle(fontSize: 25, fontFamily: 'Lato-bold')),
                const SizedBox(height: 30),
                ExpansionTile(

                  backgroundColor: const Color.fromRGBO(247, 198, 71, 1),
                  textColor: const Color.fromRGBO(0,0,0, 1),
                  iconColor: const Color.fromRGBO(255, 255, 255, 1),
                  title: const Text('Monday', style: TextStyle(fontSize: 25, fontFamily: 'Lato-bold'),  textAlign: TextAlign.center),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(_tittleMon(), style: const TextStyle(fontSize: 22, fontFamily: 'Lato-bold', color: Color.fromRGBO(0,0,0, 1)),  textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                          Text(_descriptionMon(), style: const TextStyle(fontSize: 15, fontFamily: 'Lato', color: Color.fromRGBO(0,0,0, 1)), textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                  leading: const Icon(Icons.calendar_today, color: Colors.black, size: 30),
                  trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30),
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded[0] = value;
                    });
                  },
                  initiallyExpanded: _isExpanded[0],
                ),
                const SizedBox(height: 30),
                ExpansionTile(
                  backgroundColor: const Color.fromRGBO(247, 198, 71, 1),
                  textColor: const Color.fromRGBO(0,0,0, 1),
                  iconColor: const Color.fromRGBO(255, 255, 255, 1),
                  title: const Text('Tuesday', style: TextStyle(fontSize: 25, fontFamily: 'Lato-bold'),  textAlign: TextAlign.center),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(_tittleTue(), style: const TextStyle(fontSize: 22, fontFamily: 'Lato-bold', color: Color.fromRGBO(0,0,0, 1)),  textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                          Text(_descriptionTue(), style: const TextStyle(fontSize: 15, fontFamily: 'Lato', color: Color.fromRGBO(0,0,0, 1)), textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                  leading: const Icon(Icons.calendar_today, color: Colors.black, size: 30),
                  trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30),
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded[1] = value;
                    });
                  },
                  initiallyExpanded: _isExpanded[1],
                ),
                const SizedBox(height: 30),
                ExpansionTile(
                  backgroundColor: const Color.fromRGBO(247, 198, 71, 1),
                  textColor: const Color.fromRGBO(0,0,0, 1),
                  iconColor: const Color.fromRGBO(255, 255, 255, 1),
                  title: const Text('Wednesday', style: TextStyle(fontSize: 25, fontFamily: 'Lato-bold'),  textAlign: TextAlign.center),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(_tittleWed(), style: const TextStyle(fontSize: 22, fontFamily: 'Lato-bold', color: Color.fromRGBO(0,0,0, 1)),  textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                          Text(_descriptionWed(), style: const TextStyle(fontSize: 15, fontFamily: 'Lato', color: Color.fromRGBO(0,0,0, 1)), textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                  leading: const Icon(Icons.calendar_today, color: Colors.black, size: 30),
                  trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30),
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded[2] = value;
                    });
                  },
                  initiallyExpanded: _isExpanded[2],
                ),
                const SizedBox(height: 30),
                ExpansionTile(
                  backgroundColor: const Color.fromRGBO(247, 198, 71, 1),
                  textColor: const Color.fromRGBO(0,0,0, 1),
                  iconColor: const Color.fromRGBO(255, 255, 255, 1),
                  title: const Text('Thursday', style: TextStyle(fontSize: 25, fontFamily: 'Lato-bold'),  textAlign: TextAlign.center),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(_tittleThur(), style: const TextStyle(fontSize: 22, fontFamily: 'Lato-bold', color: Color.fromRGBO(0,0,0, 1)),  textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                          Text(_descriptionThur(), style: const TextStyle(fontSize: 15, fontFamily: 'Lato', color: Color.fromRGBO(0,0,0, 1)), textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                  leading: const Icon(Icons.calendar_today, color: Colors.black, size: 30),
                  trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30),
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded[3] = value;
                    });
                  },
                  initiallyExpanded: _isExpanded[3],
                ),
                const SizedBox(height: 30),
                ExpansionTile(
                  backgroundColor: const Color.fromARGB(255, 247, 198, 71),
                  textColor: const Color.fromRGBO(0,0,0, 1),
                  iconColor: const Color.fromRGBO(255, 255, 255, 1),
                  title: const Text('Friday', style: TextStyle(fontSize: 25, fontFamily: 'Lato-bold'), textAlign: TextAlign.center),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(_tittleFri(), style: const TextStyle(fontSize: 22, fontFamily: 'Lato-bold', color: Color.fromRGBO(0,0,0, 1)),  textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                          Text(_descriptionFri(), style: const TextStyle(fontSize: 15, fontFamily: 'Lato', color: Color.fromRGBO(0,0,0, 1)), textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                  leading: const Icon(Icons.calendar_today, color: Colors.black, size: 30),
                  trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30),
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded[4] = value;
                    });
                  },
                  initiallyExpanded: _isExpanded[4],
                ),
                const SizedBox(height: 30),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    onSurface: Colors.white,
                    shadowColor: Colors.black,
                    backgroundColor: Color.fromARGB(255, 41, 112, 69),
                    padding: const EdgeInsets.all(10.0),
                    maximumSize: const Size.fromWidth(200.0),
                    animationDuration: const Duration(milliseconds: 100),
                    elevation: 3,
                  ),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("Are you a teacher?", style: TextStyle(fontSize: 15, fontFamily: 'Lato-bold'))),
                    onPressed: () {
                      final user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        Navigator.of(context).pushNamedAndRemoveUntil('/changeAuthAnnouncement', (route) => false);
                      } else {
                        Navigator.of(context).pushNamedAndRemoveUntil('/teachersAuth', (route) => false);
                      }

                  },
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}