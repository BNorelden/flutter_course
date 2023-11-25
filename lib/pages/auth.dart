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
  String _emailValue = '';
  String _passwordValue = '';
  bool _acceptTerms = false;

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
      image: const AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter the e-mail',
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (String value) {
          setState(() {
            _emailValue = value;
          });
        });
  }

  Widget _buildPasswordTextField() {
    return TextField(
        // keyboardType: TextInputType.,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter the password',
          filled: true,
          fillColor: Colors.white,
        ),
        obscureText: true,
        onChanged: (String value) {
          setState(() {
            _passwordValue = value;
          });
        });
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
      title: const Text('Accept Terms'),
    );
  }

  void _submitForm() {
    print(_emailValue);
    print(_passwordValue);
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
                    ))),
          ),
        ));
  }
}
