import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var routes = <String, WidgetBuilder> {
      Subpage.routeName: (BuildContext context) => new Subpage(title: 'Subpage'),
    };
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: routes,
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

  final List<String> _data = [
    "Root Dictionary",
    "Stem List",
    "Affix List",
    "Audio Files",
    "About",
    "Feedback",

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 168, 255, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            new Container(
              height: 275,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Colors.white
              ),

              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 300.0,
                      margin: EdgeInsets.only(top: 100),
                      child: Text(
                        'Coeur D\' Alene',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0, color: Color.fromRGBO(51, 168, 255, 1)),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text('Mobile Dictionary',
                    style: TextStyle(
                      color: Color.fromRGBO(51, 168, 255, 0.7),
                      fontStyle: FontStyle.italic,
                    ),
                    ),
                    SizedBox(height: 12.0),
                      ],
                    )

)
              ,),
              new Center(

                  child: new Column(

                      children: <Widget>[
                        new Padding(padding: EdgeInsets.only(top: 30)),
                  new MaterialButton(
                  child: Text(
                      'Root Dictionary'),
                  onPressed: () {
                    Navigator.pushNamed(context, Subpage.routeName);
                  },
                  padding: EdgeInsets.symmetric(vertical: 20),
                  color: Color.fromRGBO(124, 198, 254, 1),
                  textColor: Colors.white,
                  highlightColor: Color.fromRGBO(101, 142, 156, 0.5),
                  elevation: 7,
                  height: 20,
                  minWidth: 350,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
                        new Padding(padding: EdgeInsets.only(top: 20)),
                        new MaterialButton(
                          child: Text(
                              'Stem List'),
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 20),
                          color: Color.fromRGBO(124, 198, 254, 1),
                          textColor: Colors.white,
                          highlightColor: Color.fromRGBO(101, 142, 156, 0.5),
                          elevation: 7,
                          height: 20,
                          minWidth: 350,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        new Padding(padding: EdgeInsets.only(top: 20)),
                        new MaterialButton(
                          child: Text(
                              'Affix List'),
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 20),
                          color: Color.fromRGBO(124, 198, 254, 1),
                          textColor: Colors.white,
                          highlightColor: Color.fromRGBO(101, 142, 156, 0.5),
                          elevation: 7,
                          height: 20,
                          minWidth: 350,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        new Padding(padding: EdgeInsets.only(top: 20)),
                        new MaterialButton(
                          child: Text(
                              'Audio Files'),
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 20),
                          color: Color.fromRGBO(124, 198, 254, 1),
                          textColor: Colors.white,
                          highlightColor: Color.fromRGBO(101, 142, 156, 0.5),
                          elevation: 7,
                          height: 20,
                          minWidth: 350,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        new Padding(padding: EdgeInsets.only(top: 20)),
                        new MaterialButton(
                          child: Text(
                            'About Coeur D\'Alene', style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),),
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 20),
                          color: Color.fromRGBO(124, 198, 254, 1),
                          textColor: Colors.white,
                          highlightColor: Color.fromRGBO(101, 142, 156, 0.5),
                          elevation: 7,
                          height: 20,
                          minWidth: 350,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        new Padding(padding: EdgeInsets.only(top: 20)),
                        new MaterialButton(
                          child: Text(
                            'Provide Feedback', style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),),
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 20),
                          color: Color.fromRGBO(124, 198, 254, 1),
                          textColor: Colors.white,
                          highlightColor: Color.fromRGBO(101, 142, 156, 0.5),
                          elevation: 7,
                          height: 20,
                          minWidth: 350,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
        ]
    )
    )
    ]
    )
    );
  }


}



class Subpage extends StatefulWidget {
  Subpage({Key key, this.title}) : super(key: key);

  static const String routeName = "/Subpage";

  final String title;

  @override
  _SubpageState createState() => new _SubpageState();
}

class _SubpageState extends State<Subpage> {

  List<Note> _notes = List<Note>();
  List<Note> _fnotes = List<Note>();
  final _delay = tempDelay(mill: 500);

  Future<List<Note>> fetchNotes() async {
    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/Salish.json';
    var response = await http.get(url);

    var notes = List<Note>();


    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Note.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
        _fnotes.addAll(value);
      });
    });
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(child: Text('Coeur D\' Alene Mobile Dictionary', style: TextStyle(color: Colors.white, fontSize: 9,),),),
        backgroundColor: Color.fromRGBO(51, 168, 255, 1),
      ),
      body: Column(
        children: <Widget>[
          TextField(style: TextStyle(color: Color.fromRGBO(124, 198, 251, 0.7)),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                hintText: 'Search Word',
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Color.fromRGBO(124, 198, 254, 1), fontSize: 15),
                enabledBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(124, 198, 254, 1)),),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(124, 198, 254, 1)),
                ),
              ),
              onChanged: (string) {
                _delay.run((){
                  setState(() {
                    _fnotes = _notes.where((u) =>
                    (u.title.toLowerCase().contains(string.toLowerCase()) ||
                        u.text.toLowerCase().contains(string.toLowerCase())))
                        .toList();
                  });
                  //
                });
              }
          ),
          Expanded(child:
          ListView.builder(itemBuilder: (context, index) {
            return new Container(
              height: 100,
              decoration: new BoxDecoration(
                color: (index %2 == 0) ? Color.fromRGBO(173, 215, 232, 1) : Color.fromRGBO(124, 198, 254, 1),
                borderRadius: new BorderRadius.circular(20.0),
              ),

              margin: const EdgeInsets.only(
                  top: 25.0, bottom: 25.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(_fnotes[index].title,
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
                  Text(_fnotes[index].text,
                    style: TextStyle(color: Color.fromRGBO(238, 239, 240, 1), fontStyle: FontStyle.italic, fontSize: 12),)
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            );
          },
            itemCount: _fnotes.length,
            shrinkWrap: true,
          ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
class Note{

  String title;
  String text;


  Note(this.title, this.text);


  Note.fromJson(Map<String, dynamic> json){

    title = json['salish'];
    text = json['english'];
  }



}

class tempDelay{

  final int mill;

  VoidCallback action;
  Timer _timer;

  tempDelay({this.mill});

  run(VoidCallback action){
    if(null != _timer){
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: mill), action);
  }

}







