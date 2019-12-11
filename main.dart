import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'dart:convert';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var routes = <String, WidgetBuilder>{


      //Page routes for page navigation

      Dictionary.routeName: (BuildContext context) =>
      new Dictionary(title: 'Dictionary'),
      AboutPage.routeName: (BuildContext context) =>
      new AboutPage(title: 'AboutPage',),
      Stem.routeName: (BuildContext context) => new Stem(title: 'Stem',),
      Audio.routeName: (BuildContext context) =>
      new Audio(title: 'Audio'),
      Affix.routeName: (BuildContext context) =>
      new Affix(title: 'Affix'),
    };





    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          unselectedWidgetColor: Colors.white70


      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: routes,
    );
  }
}

  //Home Page is the intro slider
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Slide> slides = new List();

  void initState(){
    super.initState();

    slides.add(
      new Slide(
        title: "Root Dictionary",
        description: "Look through the Nicodemus root dictionary and search for words in English or Nicodemus",
        pathImage: "images/edit2.png",
        heightImage: 140,
        widthImage: 140,
        backgroundColor: Color.fromRGBO(78, 46, 114, .7),
      ),
    );
    slides.add(
      new Slide(
        title: "Stem and Affix Lists",
        pathImage: "images/clipboard.png",
        heightImage: 140,
        widthImage: 140,
        description: "This app includes the Nicodemus Stem and Affix Lists",
        backgroundColor: Color.fromRGBO(78, 46, 114, .9),
      ),
    );
    slides.add(
      new Slide(
        title: "Learn or Practice Nicodemus",
        pathImage: "images/quiz.png",
        heightImage: 140,
        widthImage: 140,
        description: "Learn Nicodemus by participating in our learning activies",
        backgroundColor: Color.fromRGBO(252, 11,106,.8),
      ),
    );

  }

  void onDonePress(){
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => Home()
        ));
  }
  void onSkipPress(){
    //go to next screen
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => Home()
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new IntroSlider(slides:
    this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
    );
  }





}


class Menu extends StatelessWidget {
  // This widget is the root of your application.
  var routes = <String, WidgetBuilder>{


    Dictionary.routeName: (BuildContext context) =>
    new Dictionary(title: 'Dictionary'),
    AboutPage.routeName: (BuildContext context) =>
    new AboutPage(title: 'AboutPage',),
    Stem.routeName: (BuildContext context) => new Stem(title: 'Stem',)
  };

  @override
  Widget build(BuildContext context) {

    return Scaffold(

    );

  }
}
    //Main page is Home, displays the navigation buttons
class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(78, 46, 114, .4),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


              new Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(105)),
                  color: Color.fromRGBO(78, 46, 114, .2),
                ),

                child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 300.0,
                          margin: EdgeInsets.only(top: 75),
                          child: Text(
                            'Coeur D\' Alene',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0, color: Colors.white, fontFamily: "Open Sans"),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text('Mobile Dictionary',
                          style: TextStyle(
                            color: Color.fromRGBO(252, 11,106,1),
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
                        new Padding(padding: EdgeInsets.only(top: 50)),
                        RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Dictionary.routeName);
                            },
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            padding: const EdgeInsets.all(0),
                            child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color.fromRGBO(252, 11,106,1),
                                      Color.fromRGBO(252, 11,106,.9),
                                      Color.fromRGBO(252, 62,11,.6),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Container(
                                  width: 350,
                                  height: 20,
                                  constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Root Dictionary",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: 'Open Sans'),
                                  ),
                                )
                            )
                        ),
                        new Padding(padding: EdgeInsets.only(top: 20)),
                        RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Stem.routeName);
                            },
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            padding: const EdgeInsets.all(0),
                            child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color.fromRGBO(252, 11,106,1),
                                      Color.fromRGBO(252, 11,106,.9),
                                      Color.fromRGBO(252, 62,11,.6),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Container(
                                  width: 350,
                                  height: 20,
                                  constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Stem List",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Open Sans'
                                    ),
                                  ),
                                )
                            )
                        ),
                        new Padding(padding: EdgeInsets.only(top: 20)),
                        RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Affix.routeName);
                            },
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            padding: const EdgeInsets.all(0),
                            child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color.fromRGBO(252, 11,106,1),
                                      Color.fromRGBO(252, 11,106,.9),
                                      Color.fromRGBO(252, 62,11,.6),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Container(
                                  width: 350,
                                  height: 20,
                                  constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Affix List",
                                    textAlign: TextAlign.center,
                                  ),
                                )
                            )
                        ),
                        new Padding(padding: EdgeInsets.only(top: 20)),
                        RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Audio.routeName);
                            },
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            padding: const EdgeInsets.all(0),
                            child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color.fromRGBO(252, 11,106,1),
                                      Color.fromRGBO(252, 11,106,.9),
                                      Color.fromRGBO(252, 62,11,.6),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Container(
                                  width: 350,
                                  height: 20,
                                  constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Text and Audio Files",
                                    textAlign: TextAlign.center,
                                  ),
                                )
                            )
                        ),
                        new Padding(padding: EdgeInsets.only(top: 20)),
                        RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AboutPage.routeName);
                            },
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            padding: const EdgeInsets.all(0),
                            child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color.fromRGBO(252, 11,106,1),
                                      Color.fromRGBO(252, 11,106,.9),
                                      Color.fromRGBO(252, 62,11,.6),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Container(
                                  width: 350,
                                  height: 20,
                                  constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "About this App",
                                    textAlign: TextAlign.center,
                                  ),
                                )
                            )
                        ),
                        new Padding(padding: EdgeInsets.only(top: 20)),
                        RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Dictionary.routeName);
                            },
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                            padding: const EdgeInsets.all(0),
                            child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color.fromRGBO(252, 11,106,1),
                                      Color.fromRGBO(252, 11,106,.9),
                                      Color.fromRGBO(252, 62,11,.6),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Container(
                                  width: 350,
                                  height: 20,
                                  constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Provide Feedback",
                                    textAlign: TextAlign.center,
                                  ),
                                )
                            )
                        ),
                      ]
                  )
              )
            ]
        )
    );
  }


}


//Dictionary class is the first page, root dictionary, lists all of the words in Nicodemus with their respective English words
class Dictionary extends StatefulWidget {
  Dictionary({Key key, this.title}) : super(key: key);

  static const String routeName = "/Dictionary";

  final String title;

  @override
  _DictionaryState createState() => new _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {

  int rvalue1;
  int flag1;

  List<Tile> _tiles = List<Tile>();
  List<Tile> _ftiles = List<Tile>();
  final _delay = tempDelay(mill: 200);

  Future<List<Tile>> fetchNotes() async {
    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/Salish.json';
    var response = await http.get(url);

    var notes = List<Tile>();


    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Tile.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _tiles.addAll(value);
        _ftiles.addAll(value);
        rvalue1 = 0;
        flag1 = 0;
      });
    });
    super.initState();
  }

  rValue(int val){
    setState(() {
      rvalue1 = val;
      if(rvalue1 == 1){
        flag1 = 1;
      } else if(rvalue1 == 2){
        flag1 = 2;
      } else {
        flag1 = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Padding (child: new Text ('Coeur D\' Alene Mobile Dictionary', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 9,),),
          padding: EdgeInsets.all(0),),
        backgroundColor: Color.fromRGBO(252, 11,106,1),
      ),
      body: Column(
        children: <Widget>[
          TextField(style: TextStyle(color: Colors.white70),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                hintText: 'Search Word',
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white70, fontSize: 15),
                enabledBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(252, 11,106,1)),),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(252, 11,106,1)),
                ),
              ),
              onChanged: (string) {
                _delay.run((){
                  setState(() {
                    if(flag1 == 1){
                      _ftiles = _tiles.where((u) =>
                      (u.title.toLowerCase().contains(string.toLowerCase()))).toList();
                    }
                    else if(flag1 == 2){
                      _ftiles = _tiles.where((u) =>
                      (u.text.toLowerCase().contains(string.toLowerCase()))).toList();
                    } else {
                      _ftiles = _tiles.where((u) =>
                      (u.title.toLowerCase().contains(string.toLowerCase()) ||
                          u.text.toLowerCase().contains(string.toLowerCase())))
                          .toList();
                    }
                  });
                  //0
                });
              }
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Radio(value: 1, groupValue: rvalue1, activeColor: Colors.white,
                onChanged: (val) {
                  rValue(val);
                },),
              new Text('Nicodemus', style: TextStyle(fontSize: 12, color: Colors.white,),),
              new Radio(value: 2, groupValue: rvalue1,  activeColor: Colors.white,  onChanged: (val){
                rValue(val);
              }),
              new Text('English', style: TextStyle(fontSize: 12, color: Colors.white),),
            ],
          ),
          Expanded(child:
          ListView.builder(
            itemBuilder: (context, index) {
              return new GestureDetector(
                onDoubleTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => Screen(root: _ftiles[index].root)
                      ));
                },
                child: new Container(
                  height: 90,
                  decoration: new BoxDecoration(
                    color: (index %2 == 0) ? Color.fromRGBO(78, 46, 114, .2) : Color.fromRGBO(252, 11,106,.8),
                    borderRadius: new BorderRadius.only(topRight: Radius.circular(60), bottomRight: Radius.circular(60)),
                  ),

                  margin: const EdgeInsets.only(
                      top: 30.0, bottom: 25.0, left: 0.0, right: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(_ftiles[index].title,
                        style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600,),),
                      Padding(
                        child: Text(_ftiles[index].text,
                          style: TextStyle(color: Color.fromRGBO(238, 239, 240, 1), fontStyle: FontStyle.italic, fontSize: 12),),
                        padding: EdgeInsets.only(left: 10),),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              );
            },
            itemCount: _ftiles.length,
            shrinkWrap: true,
          ),
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(78, 46, 114, .4),
    );
  }
}



//Tile class is for the list of English and Nicodemus words. Used to store JSON files (Affix, Stem, Root).

class Tile{

  String title;
  String text;
  String root;
  String stem;
  String affix;

  Tile(this.title, this.text, this.root, this.stem, this.affix);


  Tile.fromJson(Map<String, dynamic> json){

    title = json['nicodemus'];
    text = json['english'];
    root = json['root'];
    stem = json['stem'];
    affix = json['affix'];
  }



}
//A tile used specifically for the stem class
class StemTile{
  String stem;
  StemTile.fromJson(Map<String, dynamic> json){
    stem = json['stem'];
  }
}
//A tile used specifically for the affix class
class AffixTile{

  String affix;
  AffixTile.fromJson(Map<String, dynamic> json){
    affix = json['affix'];
  }


}

//adds a small delay to the search
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

//Creates the about page of the application
class AboutPage extends StatelessWidget {

  AboutPage({Key key, this.title}) : super(key: key);

  static const String routeName = "/AboutPage";

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: new Text ('Coeur D\' Alene Mobile Dictionary', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 9,),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(252, 11,106,1),
      ),
      backgroundColor: Color.fromRGBO(78, 46, 114, .4),
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

//Creates the Stem page of the application
class Stem extends StatefulWidget {
  Stem({Key key, this.title}) : super(key: key);

  static const String routeName = "/Stem";

  final String title;

  @override
  _StemState createState() => new _StemState();
}

class _StemState extends State<Stem> {

  List<StemTile> _tiles = List<StemTile>();
  List<StemTile> _ftiles = List<StemTile>();
  final _delay = tempDelay(mill: 200);

  Future<List<StemTile>> fetchNotes() async {
    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/StemList.json';
    var response = await http.get(url);

    var notes = List<StemTile>();


    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {

        notes.add(StemTile.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _tiles.addAll(value);
        _ftiles.addAll(value);
      });
    });
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Padding (child: new Text ('Coeur D\' Alene Mobile Dictionary', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 9,),),
          padding: EdgeInsets.all(0),   ),
        backgroundColor: Color.fromRGBO(252, 11,106,1),
      ),
      body: Column(
        children: <Widget>[
          TextField(style: TextStyle(color: Colors.white70),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                hintText: 'Search Stem',
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white70, fontSize: 15),
                enabledBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(252, 11,106,1)),),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(252, 11,106,1)),
                ),
              ),
              onChanged: (string) {
                _delay.run((){
                  setState(() {
                    _ftiles = _tiles.where((u) =>
                    (u.stem.toLowerCase().contains(string.toLowerCase())))
                        .toList();
                  });
                  //
                });
              }
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Reichard's Stem List",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          Expanded(child:
          ListView.builder(
            itemBuilder: (context, index) {
              return new GestureDetector(
                onDoubleTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => StemScreen(stem: _ftiles[index].stem)
                      ));
                },
                child:new Container(
                  height: 90,
                  decoration: new BoxDecoration(
                    color: (index %2 == 0) ? Color.fromRGBO(78, 46, 114, .2) : Color.fromRGBO(252, 11,106,.8),
                    borderRadius: new BorderRadius.only(topRight: Radius.circular(60), bottomRight: Radius.circular(60)),
                  ),

                  margin: const EdgeInsets.only(
                      top: 30.0, bottom: 25.0, left: 0, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        child: Text(_ftiles[index].stem,
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600,),),
                        padding: EdgeInsets.only(left: 10),),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              );
            },
            itemCount: _ftiles.length,
            shrinkWrap: true,
          ),
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(78, 46, 114, .4),
    );
  }
}

//Second screen of the root double tap events
class Screen extends StatefulWidget {

  final String title;
  final String text;
  final String root;
  final List<Tile> ftiles;


  Screen({Key key, this.title, this.root, this.ftiles, this.text}) : super(key: key);


  @override
  _Screen createState() => _Screen(root);
}
class _Screen extends State<Screen> {

  List<Tile> _tiles = List<Tile>();
  List<Tile> _ftiles = List<Tile>();

  final String root;

  _Screen(this.root);



  Future<List<Tile>> fetchNotes() async {
    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/Salish.json';
    var response = await http.get(url);

    var notes = List<Tile>();


    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {

        if(noteJson['root'] == root) {
          notes.add(Tile.fromJson(noteJson));
        }
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {

        _tiles.addAll(value);
        _ftiles.addAll(value);

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    print(root);
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: new Padding (child: new Text ('Coeur D\' Alene Mobile Dictionary', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 9,),),
          padding: EdgeInsets.all(0), ),
        backgroundColor: Color.fromRGBO(252, 11,106,1),
      ),

      body: Column(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'All words based on root: ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              root,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
          ),

          Expanded(child:
          ListView.builder(itemBuilder: (context, index) {
            return new Container(
              height: 90,
              decoration: new BoxDecoration(
                color: (index %2 == 0) ? Color.fromRGBO(78, 46, 114, .2) : Color.fromRGBO(252, 11,106,.8),
                borderRadius: new BorderRadius.only(topRight: Radius.circular(60), bottomRight: Radius.circular(60)),
              ),


              margin: const EdgeInsets.only(
                  top: 30.0, bottom: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[


                  Text(_ftiles[index].title,
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
                  Padding(
                    child: Text(_ftiles[index].text,
                      style: TextStyle(color: Color.fromRGBO(238, 239, 240, 1), fontStyle: FontStyle.italic, fontSize: 12),),
                    padding: EdgeInsets.only(left: 10),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            );
          },
            itemCount: _ftiles.length,
            shrinkWrap: true,
          ),
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(78, 46, 114, .4),
    );


  }

}
//Second screen of the double tap event of the stem page
class StemScreen extends StatefulWidget {

  final String title;
  final String text;
  final String stem;
  final List<Tile> ftiles;


  StemScreen({Key key, this.title, this.stem, this.ftiles, this.text}) : super(key: key);


  @override
  _StemScreen createState() => _StemScreen(stem);
}
class _StemScreen extends State<StemScreen> {

  List<Tile> _tiles = List<Tile>();
  List<Tile> _ftiles = List<Tile>();

  final String stem;

  _StemScreen(this.stem);


  Future<List<Tile>> fetchNotes() async {
    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/Stem.json';
    var response = await http.get(url);

    var notes = List<Tile>();


    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        if (noteJson['stem'] == stem) {
          notes.add(Tile.fromJson(noteJson));
        }
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _tiles.addAll(value);
        _ftiles.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(stem);
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: new Padding (child: new Text ('Coeur D\' Alene Mobile Dictionary',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 9,),),
          padding: EdgeInsets.all(0), ),
        backgroundColor: Color.fromRGBO(252, 11,106,1),
      ),

      body: Column(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'All words based on stem: ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              stem,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
          ),

          Expanded(child:
          ListView.builder(itemBuilder: (context, index) {
            return new Container(
              height: 90,

              decoration: new BoxDecoration(
                color: (index % 2 == 0)
                    ? Color.fromRGBO(78, 46, 114, .2)
                    : Color.fromRGBO(252, 11,106,.8),
                borderRadius: new BorderRadius.only(topRight: Radius.circular(60), bottomRight: Radius.circular(60)),
              ),


              margin: const EdgeInsets.only(
                  top: 25.0, bottom: 25.0, left: 0, right: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[


                  Text(_ftiles[index].title,
                    style: TextStyle(fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),),
                  Padding(
                    child: Text(_ftiles[index].text,
                      style: TextStyle(color: Color.fromRGBO(238, 239, 240, 1),
                          fontStyle: FontStyle.italic,
                          fontSize: 12),),
                    padding: EdgeInsets.only(left: 10),),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            );
          },
            itemCount: _ftiles.length,
            shrinkWrap: true,
          ),
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(78, 46, 114, .4),
    );
  }


}

//Audio and text file page
class Audio extends StatefulWidget {
  Audio({Key key, this.title}) : super(key: key);

  static const String routeName = "/Audio";

  final String title;

  @override
  _Audio createState() => _Audio();
}


class _Audio extends State<Audio> {


  List<Link> _tiles = List<Link>();
  List<Link> _ftiles = List<Link>();

  Future<List<Link>> fetchNotes() async {
    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/Audio.json';
    var response = await http.get(url);

    var notes = List<Link>();


    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {

        notes.add(Link.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _tiles.addAll(value);
        _ftiles.addAll(value);
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Padding (child: new Text ('Coeur D\' Alene Mobile Dictionary', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 9,),),
          padding: EdgeInsets.all(0), ),
        backgroundColor: Color.fromRGBO(252, 11,106,1),

      ),
      body: Column(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'Audio and Text Files',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26
              ),
            ),
          ),

          Expanded(child:
          ListView.builder(itemBuilder: (context, index) {
            return new GestureDetector(
              onDoubleTap: () {
                launch(_ftiles[index].web);
              },
              child: Container(
                height: 90,
                decoration: new BoxDecoration(
                  color: (index %2 == 0) ? Color.fromRGBO(78, 46, 114, .2) : Color.fromRGBO(252, 11,106,.8),
                  borderRadius: new BorderRadius.only(topRight: Radius.circular(60), bottomRight: Radius.circular(60)),
                ),


                margin: const EdgeInsets.only(
                  top: 30.0, bottom: 25.0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      child: Text(_ftiles[index].title,
                        style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600),),
                      padding: EdgeInsets.only(left: 10),),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            );
          },
            itemCount: _ftiles.length,
            shrinkWrap: true,
          ),
          ),

        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
      backgroundColor: Color.fromRGBO(78, 46, 114, .4),
    );

  }
}

//Class to store json file containing title and hyper link of each audio and text file
class Link {

  String title;
  String web;


  Link(this.title, this.web);


  Link.fromJson(Map<String, dynamic> json){
    title = json['title'];
    web = json['link'];
  }
}

//Affix class used to create Affix page
class Affix extends StatefulWidget {
  Affix({Key key, this.title}) : super(key: key);

  static const String routeName = "/Affix";

  final String title;

  @override
  _Affix createState() => new _Affix();
}

class _Affix extends State<Affix> {

  List<AffixTile> _tiles = List<AffixTile>();
  List<AffixTile> _ftiles = List<AffixTile>();
  final _delay = tempDelay(mill: 200);

  Future<List<AffixTile>> fetchNotes() async {
    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/affix.json';
    var response = await http.get(url);

    var notes = List<AffixTile>();


    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {

        notes.add(AffixTile.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _tiles.addAll(value);
        _ftiles.addAll(value);
      });
    });
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Padding (child: new Text ('Coeur D\' Alene Mobile Dictionary',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 9,),),
          padding: EdgeInsets.all(0),),
        backgroundColor: Color.fromRGBO(252, 11,106,1),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Reichard's Affix List",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),

          Expanded(child:
          ListView.builder(
            itemBuilder: (context, index) {
              return new GestureDetector(
                onDoubleTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => AffixScreen(affix: _ftiles[index].affix)
                      ));
                },
                child:new Container(
                  height: 90,
                  decoration: new BoxDecoration(
                    color: (index %2 == 0) ? Color.fromRGBO(78, 46, 114, .2) : Color.fromRGBO(252, 11,106,.8),
                    borderRadius: new BorderRadius.only(topRight: Radius.circular(60), bottomRight: Radius.circular(60)),
                  ),

                  margin: const EdgeInsets.only(
                      top: 30.0, bottom: 25.0, left: 0.0, right: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        child: Text(_ftiles[index].affix,
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600,),),
                        padding: EdgeInsets.only(left:0),),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              );
            },
            itemCount: _ftiles.length,
            shrinkWrap: true,
          ),
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(78, 46, 114, .4),
    );
  }
}
//Second page of the affix double tap event
class AffixScreen extends StatefulWidget {

  final String title;
  final String text;
  final String affix;
  final List<Tile> ftiles;


  AffixScreen({Key key, this.title, this.affix, this.ftiles, this.text}) : super(key: key);


  @override
  _AffixScreen createState() => _AffixScreen(affix);
}
class _AffixScreen extends State<AffixScreen> {

  List<Tile> _tiles = List<Tile>();
  List<Tile> _ftiles = List<Tile>();

  final String affix;

  _AffixScreen(this.affix);


  Future<List<Tile>> fetchNotes() async {
    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/affixList.json';
    var response = await http.get(url);

    var notes = List<Tile>();


    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        if (noteJson['affix'] == affix) {
          notes.add(Tile.fromJson(noteJson));
        }
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _tiles.addAll(value);
        _ftiles.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(affix);
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: new Padding (child: new Text (
          'Coeur D\' Alene Mobile Dictionary',textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 9,),),
          padding: EdgeInsets.all(40),),
        backgroundColor: Color.fromRGBO(252, 11,106,1),
      ),

      body: Column(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: 10),
          ),

          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              affix,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
          ),

          Expanded(child:
          ListView.builder(itemBuilder: (context, index) {
            return new Container(
              height: 90,
              decoration: new BoxDecoration(
                color: (index % 2 == 0)
                    ? Color.fromRGBO(78, 46, 114, .2)
                    : Color.fromRGBO(252, 11,106,.8),
                borderRadius: new BorderRadius.only(topRight: Radius.circular(60), bottomRight: Radius.circular(60)),
              ),


              margin: const EdgeInsets.only(
                  top: 30.0, bottom: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[


                  Text(_ftiles[index].title,
                    style: TextStyle(fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),),
                  Padding(

                    child: Text(_ftiles[index].text,
                      style: TextStyle(color: Color.fromRGBO(238, 239, 240, 1),
                          fontStyle: FontStyle.italic,
                          fontSize: 12),),
                    padding: EdgeInsets.only(left: 10),),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            );
          },
            itemCount: _ftiles.length,
            shrinkWrap: true,
          ),
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(78, 46, 114, .4),
    );
  }


}
