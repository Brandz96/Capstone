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
      SubPage5.routeName: (BuildContext context) => new SubPage5(title: 'SubPage5',)
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
                      //Subpage.routeName
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
                              'Advanced Search'),
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
                            'About', style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),),
                            onPressed: () {
                              Navigator.pushNamed(context, SubPage5.routeName);
                            },
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
  final _delay = tempDelay(mill: 200);

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
        title: new Padding (child: new Text ('Coeur D\' Alene Mobile Dictionary', style: TextStyle(color: Colors.white, fontSize: 9,),),
            padding:const EdgeInsets.only(left: 50) ),
        backgroundColor: Color.fromRGBO(51, 168, 255, 1),
      ),
      body: Column(
        children: <Widget>[
          TextField(style: TextStyle(color: Colors.white70),
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
                color: (index %2 == 0) ? Color.fromRGBO(173, 215, 232, .3) : Color.fromRGBO(124, 198, 254, .8),
                borderRadius: new BorderRadius.circular(20.0),
              ),

              margin: const EdgeInsets.only(
                  top: 25.0, bottom: 25.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(_fnotes[index].title,
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600,),),
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
      backgroundColor: Color.fromRGBO(51, 168, 255, 1),
    );
  }
}
class Note{

  String title;
  String text;


  Note(this.title, this.text);


  Note.fromJson(Map<String, dynamic> json){

    title = json['nicodemus'];
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


class SubPage5 extends StatelessWidget {

  SubPage5({Key key, this.title}) : super(key: key);

  static const String routeName = "/Subpage5";

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text ('Coeur D\' Alene Mobile Dictionary', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 9,),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(51, 168, 255, 1),
      ),
      backgroundColor: Color.fromRGBO(51, 168, 255, 1),
      body: Column(
        children: <Widget>[
          new Padding(padding: EdgeInsets.only(top: 30)),
          new RichText(
              text: TextSpan(
                  children: <TextSpan> [

                    TextSpan(text: "\tAbout", style: TextStyle(color: Colors.white60, fontSize: 32,)),
                    TextSpan(text: " this", style: TextStyle(color: Colors.white70, fontSize: 32)),
                    TextSpan(text: ' App', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 32)),
                  ]
              )),
          new Padding(padding: EdgeInsets.only(top: 30)),
          new Expanded(
              child: new SingleChildScrollView(
                  padding: EdgeInsets.only(left: 32, right: 32, bottom: 10),
                  child: Text(
                    '   This resource contains the Coeur d\'Alene Root Dictionary (Lyon and Greene-Wood 2007) with nearly 1,400 roots and about 7690 \"word\" forms, Reichard\'s 1939 Stem List with some 1,300 stems, a list of roughly 200 affixes, and over 1,200 pages of Coeur d\'Alene texts (copies of Gladys Reichard\'s 1927-1929 field notes and typed manuscripts) and English translations from Reichard 1947. Resources to help with spelling and pronunciation of Coeur d\'Alene include lists of the consonant and vowel phonemes of Coeur d\'Alene, a comparison of the three different orthographies most commonly used to write Coeur d\'Alene (Nicodemus, Reichard, and Salishan), and a guide to pronunciation. A working bibliography is also included, and will be expanded soon.'  +
                        '\n'  +
                        '   The archive also links to Ivy Doak\'s grammatical sketch of Coeur d\'Alene. Other websites with Coeur d\'Alene material include the following: The official Coeur d\'Alene website; the 1917 publication of Teit\'s Coeur d\'Alene \"tales\" which include different versions of a small number of the Coeur d\'Alene texts in the archive; and Reichard\'s 1938 grammar published in The Handbook of American Indian Languages v. 3. Reichard\'s 1947 An Analysis of Coeur d\'Alene Indian Myths is available at the University of Michigan Digital Library General Collection. Lyon\'s 2010 Lawrence Nicodemus\'s Snchitsu\'umshtsn File Card Collection in Dictionary Format is also linked from the left menu.'  +
                        '\n'  +
                        '   The original Coeur d\'Alene archive was created by Shannon Bischoff and Musa Yassin Fort in the summer of 2009. The original website was created without any prior web design/building knowledge using w3schools.com free tutorials over a period of six weeks. The site was constructed using simple html, javascript, and css code, all designed based on lessons at the site. The search mechanisms were a bit more complicated and required php, which can also be learned at the w3 schools website.  '  +
                        '\n'  +
                        '   This version of the website is being revised with the support of the National Science Foundation (award numbers BCS-1160394 and BCS-1160627), but is still being developed using these freely available, open-source, and easily learnable tools - expanded to include xml and ajax. You can find free tutorials for all of these tools at w3schools.com. Additional resources will be included, as well as further documentation about the methods used by Reichard and Nicodemus to collect many of these resources. We also will be posting our source files (for all material other than the language resources themselves) to the site, so that anyone who\'d like to make use of our code to develop their own websites may do so. If you would like to help or have questions, comments or suggestions, contact us using the "Contact Us" link on the left menu, or by emailing us directly at: crd.archive@gmail.com.' ,
                    style: TextStyle(color: Colors.white70),)
              )
          ),
        ],
      ),
    );
  }
}






