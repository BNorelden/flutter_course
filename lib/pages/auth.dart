import 'package:flutter/material.dart';

// class AuthPage extends StatelessWidget {
class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue = '';
  String _passwordValue = '';
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Please Login'),
      ),
      body: Container(
          margin: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the e-mail',
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _emailValue = value;
                    });
                  }),
              TextField(
                  // keyboardType: TextInputType.,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the password',
                  ),
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      _passwordValue = value;
                    });
                  }),
              SwitchListTile(
                value: _acceptTerms,
                onChanged: (bool value) {
                  setState(() {
                    _acceptTerms = value;
                  });
                },
                title: const Text('Accept Terms'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  child: const Text('LOGIN'),
                  onPressed: () {
                    print(_emailValue);
                    print(_passwordValue);
                    {
                      Navigator.pushReplacementNamed(context, '/products');
                    }
                  }),
            ],
          )),
    );
  }
}
