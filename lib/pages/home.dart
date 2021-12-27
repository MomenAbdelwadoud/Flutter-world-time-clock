import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    Color bgColor = data['isDay'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 130, 0, 0),
          child: Expanded(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: Colors.white,
                        ))
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 66, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  data['date'],
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    this.setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDay': result['isDay'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location_outlined,
                    color: Colors.grey[300],
                    size: 26,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: Colors.grey[300], fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
