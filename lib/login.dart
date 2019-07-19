import 'package:flutter/material.dart';
import 'news.dart';
//Creating the Login Page Class
class LoginPage extends StatefulWidget{
  @override
  //LoginPageState class is created after this
  State createState() => new LoginPageState();
}

/*
  LoginPageState class created here
  it extends the Login state(the stateless widget we created above)
  Here we shall have our Statefull widget Doing What we want.
  In the Scaffold, we do the Designing
*/
class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  //overiding the initial State when the App loads
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 300)
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut
    );
    _iconAnimation.addListener(()=>this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      /*
        Creating A background color for out page
      */
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            
            /*
              Box Fit makes the Image Cover the Entire Screen,
            */
            fit: BoxFit.cover,
            image: AssetImage("images/cedat.PNG"),
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0,
                      )
                    )
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        new MaterialButton(
                          height: 40.0,
                          minWidth: 120.0,
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: new Text("Login"),
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new HomePage()));
                          },
                          splashColor: Colors.redAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]
          )
        ],
      ),
    );
  }
}