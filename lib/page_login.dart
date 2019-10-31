import 'package:flutter/material.dart';

class PageLogin extends StatefulWidget {
  PageLogin({Key key}) : super(key: key);

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {

  bool                          _buttonLoginClicked = false ;
  bool                          _isLoggingIn = false ;
  final TextEditingController   _loginController = TextEditingController() ;
  final TextEditingController   _passwordController = TextEditingController() ;

  @override
  void initState() {
    /// Init text editing controllers.
    _loginController.addListener(() {});
    _passwordController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    /// Remove text editing controllers.
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.teal,
      body: (_isLoggingIn) ? _loggingIn() : _loginRequest()
    );
  }

  /// Displays the normal layout for a login.
  Container _loginRequest() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedOpacity(
            opacity: (_buttonLoginClicked) ? 1.0 : 0.0,
            duration: Duration(milliseconds: 1000),
            child: _loginCredentials(),
          ),
          Padding(padding: EdgeInsets.all(10),),
          _loginButton(),
        ],
      ),
    );
  }

  /// Displays the animated logo on the screen while logging in.
  Container _loggingIn() {
    return Container(
      alignment: Alignment.center,
      child: new Image.asset(
        "assets/logging_in.gif",
        height: MediaQuery.of(context).size.width / 1.5,
        width: MediaQuery.of(context).size.width / 1.5,
      ),
    );
  }

  /// Layout of the login credentials text fields.
  Container _loginCredentials() {
    return Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: <Widget>[
            _createTextField("Username or email", false, _loginController),
            Padding(padding: EdgeInsets.all(10),),
            _createTextField("Password", true, _passwordController),
          ],
        )
    );
  }

  /// Layout of the login button.
  Container _loginButton() {
    return Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.width / 7,
        child: Container(
          child: Material(
            color: Colors.teal[700],
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Center(
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: (() { _buttonLoginTapped() ; }),
            ),
          ),
        )
    );
  }

  /// Create a TextField with an hint, a rounded border and a background.
  TextField _createTextField(String hint, bool obscureText,
      TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none
            )
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  /// Triggered when the button login is tapped.
  /// If the login and password text fields are not empty, it will try to
  /// perform login with the given credentials.
  /// In the other case, it will switch _buttonLoginClicked to true or false in
  /// order to show or hide the text fields.
  void _buttonLoginTapped() {
    if (_buttonLoginClicked && _loginController.text.isNotEmpty
        && _passwordController.text.isNotEmpty) {
      _performLogin();
    } else {
      setState(() {
        _buttonLoginClicked = !(_buttonLoginClicked);
      });
    }
  }

  /// Tries to perform login with the current credentials in the text fields.
  /// Displays the animated logo gif while login.
  /// TODO : Set a real login
  void _performLogin() {
    setState(() {
      _isLoggingIn = true;
    });
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, "page_main");
    });
  }
}