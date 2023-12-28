import 'package:flutter/material.dart';

// class AuthPage extends StatelessWidget {
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _loginData = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
      image: const AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter the e-mail',
          filled: true,
          fillColor: Colors.white,
        ),
        validator: (String? value) {
          // if (value!.trim().length <= 0) {
          if (value!.isEmpty ||
              !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
            return 'please Enter a valid email';
          }
        },
        onSaved: (String? value) {
          _loginData['email'] = value;
        });
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
        // keyboardType: TextInputType.,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter the password',
          filled: true,
          fillColor: Colors.white,
        ),
        validator: (String? value) {
          if (value!.isEmpty || value.length < 8) {
            return 'Password is required and should be 8+ characters long and valid.';
          }
        },
        obscureText: true,
        onChanged: (String value) {
          _loginData['password'] = value;
        });
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _loginData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _loginData['acceptTerms'] = value;
        });
      },
      title: const Text('Accept Terms'),
    );
  }

  void _submitForm() {
    // if (_loginData['acceptTerms'] == false) {
    //   const AlertDialog(title: Text('AlertDialog Sample'));
    if (!_formKey.currentState!.validate() || !_loginData['acceptTerms']) {
      return;
    }
    // }
    _formKey.currentState!.save();
    print(_loginData);

    {
      Navigator.pushReplacementNamed(context, '/products');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context)
        .size
        .width; //mediaQuery is powerful and MediaQuery.orientationOf(context) to check the orientation
    // - portrait is y-direction-vertical landsacpe is x-direction-horizontal

    final targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    // if(deviceWidth > 550.0) { //different widget tree or parts of it  }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Please Login'),
        ),
        body: Container(
          decoration: BoxDecoration(image: _buildBackgroundImage()),
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
                child: Container(
              width: targetWidth * 0.8,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    const SizedBox(height: 10.0),
                    _buildPasswordTextField(),
                    _buildAcceptSwitch(),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                        onPressed: _submitForm, child: const Text('LOGIN')),
                  ],
                ),
              ),
            )),
          ),
        ));
  }
}
