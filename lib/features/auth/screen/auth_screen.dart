import 'package:amazon_clone/common/widgets/Custome_button.dart';
import 'package:amazon_clone/utils/global_variables.dart';
import 'package:flutter/material.dart';

import '../../../common/custom_textfield.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                Container(
                  color: _auth == Auth.signUp ? Colors.white : null,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          'Create Account',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Radio(
                          value: Auth.signUp,
                          groupValue: _auth,
                          onChanged: (Auth? val) {
                            setState(() {
                              _auth = val!;
                            });
                          },
                          activeColor: GlobalVariables.primary,
                        ),
                      ),
                      if (_auth == Auth.signUp)
                        Form(
                          key: _signUpFormKey,
                          child: Column(
                            children: [
                              CTextFormField(
                                  controller: _nameController, hintText: 'Name'),
                              const SizedBox(
                                height: 10,
                              ),
                              CTextFormField(
                                controller: _emailController,
                                hintText: 'Email',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CTextFormField(
                                controller: _pwController,
                                hintText: 'Password',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CButton(text: 'Sign Up', onTap: () {})
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  color: _auth == Auth.signIn ? Colors.white : null,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          'Sign-In',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Radio(
                          value: Auth.signIn,
                          groupValue: _auth,
                          onChanged: (Auth? val) {
                            setState(() {
                              _auth = val!;
                            });
                          },
                          activeColor: GlobalVariables.primary,
                        ),
                      ),
                      if (_auth == Auth.signIn)
                        Form(
                          key: _signUpFormKey,
                          child: Column(
                            children: [

                              CTextFormField(
                                controller: _emailController,
                                hintText: 'Email',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CTextFormField(
                                controller: _pwController,
                                hintText: 'Password',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CButton(text: 'Sign In', onTap: () {})
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
