import 'package:flutter/material.dart';
import 'package:tugas2_navigasi/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black87,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(children: [
              _createImage(),
              _usernameField(),
              _passwordField(),
              _loginButton(context),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _createImage() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzYub6FB1sNm3KTHTiYmGnXl6ZztthSyITng&usqp=CAU"),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Username',
          hintStyle: TextStyle(color: Colors.white70),
          //fillColor: Colors.red, filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
                color: (isLoginSuccess) ? Colors.blue : Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.white70),
          //fillColor: Colors.red, filled: true,
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
                color: (isLoginSuccess) ? Colors.blue : Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: MediaQuery.of(context).size.width,
      height: 70.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary:
          (isLoginSuccess) ? Colors.blue: Colors.red, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          String text = "";
          if (username == "Ersalan" && password == "123190163") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            _loginProcess(context);
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }
          print("isLoginSuccess : $isLoginSuccess");
          SnackBar snackBar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }

  void _loginProcess(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }
}
