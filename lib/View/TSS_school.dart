import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'global.dart' as gl;


class thornhill_inf extends StatefulWidget {
  const thornhill_inf({ Key? key }) : super(key: key);

  @override
  State<thornhill_inf> createState() => _thornhill_infState();
}

class _thornhill_infState extends State<thornhill_inf> {
  final List<bool> _isExpanded = List.generate(10, (_) => false);
  List week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  final _database = FirebaseDatabase.instance.ref();

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
        return gl.monDes;
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
        return gl.tueDes;
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
        return gl.wenDes;
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
        return gl.thurDes;
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
      _database.child('Thursday/description').onValue.listen((event) {
          final description = event.snapshot.value;
          if (!mounted) return;
          setState(() {
            final _displayText = '$description';
            gl.friDes = _displayText;
          });
        });
        return gl.friDes;
    }
    
  @override
  Widget build(BuildContext context) {    
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(235, 186, 185, 1),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(8, 65, 92, 1),
          title: const Text("Thornhill School", style: TextStyle(fontSize: 20, fontFamily: 'Lato-bold'),),
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
                  backgroundColor: const Color.fromRGBO(33, 137, 126, 1),
                  textColor: const Color.fromRGBO(255, 255, 255, 1),
                  iconColor: const Color.fromRGBO(255, 255, 255, 1),
                  title: const Text('Monday', style: TextStyle(fontSize: 25, fontFamily: 'Lato-bold')),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(_tittleMon(), style: const TextStyle(fontSize: 22, fontFamily: 'Lato-bold', color: Color.fromRGBO(255, 255, 255, 1)),  textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                          Text(_descriptionMon(), style: const TextStyle(fontSize: 15, fontFamily: 'Lato', color: Color.fromRGBO(255, 255, 255, 1)), textAlign: TextAlign.center),
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
                  backgroundColor: const Color.fromRGBO(33, 137, 126, 1),
                  textColor: const Color.fromRGBO(255, 255, 255, 1),
                  iconColor: const Color.fromRGBO(255, 255, 255, 1),
                  title: const Text('Tuesday', style: TextStyle(fontSize: 25, fontFamily: 'Lato-bold')),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(_tittleTue(), style: const TextStyle(fontSize: 22, fontFamily: 'Lato-bold', color: Color.fromRGBO(255, 255, 255, 1)),  textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                          Text(_descriptionTue(), style: const TextStyle(fontSize: 15, fontFamily: 'Lato', color: Color.fromRGBO(255, 255, 255, 1)), textAlign: TextAlign.center),
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
                  backgroundColor: const Color.fromRGBO(33, 137, 126, 1),
                  textColor: const Color.fromRGBO(255, 255, 255, 1),
                  iconColor: const Color.fromRGBO(255, 255, 255, 1),
                  title: const Text('Wednesday', style: TextStyle(fontSize: 25, fontFamily: 'Lato-bold')),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(_tittleWed(), style: const TextStyle(fontSize: 22, fontFamily: 'Lato-bold', color: Color.fromRGBO(255, 255, 255, 1)),  textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                          Text(_descriptionWed(), style: const TextStyle(fontSize: 15, fontFamily: 'Lato', color: Color.fromRGBO(255, 255, 255, 1)), textAlign: TextAlign.center),
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
                  backgroundColor: const Color.fromRGBO(33, 137, 126, 1),
                  textColor: const Color.fromRGBO(255, 255, 255, 1),
                  iconColor: const Color.fromRGBO(255, 255, 255, 1),
                  title: const Text('Thursday', style: TextStyle(fontSize: 25, fontFamily: 'Lato-bold')),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(_tittleThur(), style: const TextStyle(fontSize: 22, fontFamily: 'Lato-bold', color: Color.fromRGBO(255, 255, 255, 1)),  textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                          Text(_descriptionThur(), style: const TextStyle(fontSize: 15, fontFamily: 'Lato', color: Color.fromRGBO(255, 255, 255, 1)), textAlign: TextAlign.center),
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
                  backgroundColor: const Color.fromRGBO(33, 137, 126, 1),
                  textColor: const Color.fromRGBO(255, 255, 255, 1),
                  iconColor: const Color.fromRGBO(255, 255, 255, 1),
                  title: const Text('Friday', style: TextStyle(fontSize: 25, fontFamily: 'Lato-bold')),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(_tittleFri(), style: const TextStyle(fontSize: 22, fontFamily: 'Lato-bold', color: Color.fromRGBO(255, 255, 255, 1)),  textAlign: TextAlign.center),
                          const SizedBox(height: 15),
                          Text(_descriptionFri(), style: const TextStyle(fontSize: 15, fontFamily: 'Lato', color: Color.fromRGBO(255, 255, 255, 1)), textAlign: TextAlign.center),
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
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.all(10.0),
                    maximumSize: const Size.fromWidth(200.0),
                    animationDuration: const Duration(milliseconds: 100),
                    elevation: 40,
                  ),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("Are you a teacher?", style: TextStyle(fontSize: 15, fontFamily: 'Lato-bold'))),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil('/teachersAuth', (route) => false);
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