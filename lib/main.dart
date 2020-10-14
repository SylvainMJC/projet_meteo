import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
  
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isLoaded = false;

  @override
  void initState(){
    super.initState();

    String city_name = "Vannes";
    String state_code = "56270";
    String country_code = "";
    String API_key = "26801e3a2bb2c98e0caca11bb7b8dbcf";  
    String lang = "fr";
    String url="api.openweathermap.org/data/2.5/weather?q=$city_name,$state_code,$country_code&appid=$API_key&lang=$lang&units=metric";
    http.read(url)
    .catchError((res) => setState((){
        _isLoaded = true;
         print('Error');
      }))
    // Future<void>.delayed(
    //   Duration(seconds: 10),
    //   () => setState((){
    //     _isLoaded = true;
    //     print('test');
    //   })
    // )
    .then((res) => setState((){
        _isLoaded = true;
         print('test2');
      }));
  }

  // WeatherData _getWeatherData(){

  // }

  Widget _displayState(){
    if(_isLoaded){
      return displayLoaded();
    }
    else{
      return Center(
        child: SizedBox(
          child: CircularProgressIndicator(backgroundColor: Colors.yellow[700],),
          width: 200,
          height: 200,
        ),
      );
    }
  }


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Widget displayLoaded(){
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.blue[800],
              height: 310.0,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "15 °C",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Brest Les Puissants, FR",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Ciel dégagé",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Image(image: AssetImage("assets/images/bigsun1.png"), height:150),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Expanded(
                        child: Text(
                          "Mercredi",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Material(
                            color: Colors.transparent,
                            child: Center(
                              child: Ink(
                                decoration: ShapeDecoration(
                                  color: Colors.blueGrey[800],
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.grid_view),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Material(
                            color: Colors.transparent,
                            child: Center(
                              child: Ink(
                                decoration: ShapeDecoration(
                                  color: Colors.blueGrey[800],
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.list),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Material(
                            color: Colors.transparent,
                            child: Center(
                              child: Ink(
                                decoration: ShapeDecoration(
                                  color: Colors.blueGrey[800],
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.refresh),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(children: <Widget>[
              displayRow(),
              displayRow(),
              displayRow(),
              displayRow(),
              displayRow(),
            ])),
          ],
        ),
      );
  }

  Widget displayRow() {
    return SizedBox(
      height: 55,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Ink(
                  decoration: ShapeDecoration(
                    color: Colors.yellow[400],
                    shape: CircleBorder(),
                  ),
                  child: Icon(Icons.cloud, size: 40, color: Colors.grey),
                ),
              ),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Text("Jour de la semaine")),
                Expanded(
                  child: Text("Description météo"),
                ),
              ]),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text("Température", textAlign: TextAlign.right),
            ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(),
      body: _displayState()
    );
  }
}
