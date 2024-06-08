import 'package:demo_tssm_admission/Starting_pages/username.dart';

import '../database/firebase_auth_services.dart';
import '../id.dart';
import '../toast.dart';
import 'HomePage.dart';
import 'createAccount.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _emailController;
  bool _isPasswordVisible = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        Tween<double>(begin: 1.0, end: 0.9).animate(_animationController);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<bool> _signIn() async {
    setState(() {
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");

      UserID(userEmail: email, userPassword: password);
      isAuthenticated = true;
      // Navigator.pushNamed(context, "/home");
      //   Navigator.pushAndRemoveUntil(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => const HomePage()),
      //                     (route) => false,
      //                   );
      // } else {
      //   showToast(message: "some error occured");
    }
      return isAuthenticated;
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushNamed(context, "/home");
      }
    } catch (e) {
      showToast(message: "some error occured $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 136, 213, 212),
        elevation: 15,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        )),
        toolbarHeight: 100.0,
        backgroundColor: Color.fromARGB(255, 19, 145, 159),
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                "TSSM's BSCOER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  "lib/assets/Starting_Images/Login_Image.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 13, 95, 125),
                      width: 1,
                    ),
                  ),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Username',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 13, 95, 125),
                      width: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 13, 95, 125),
                      width: 1,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ScaleTransition(
                  scale: _animation,
                  child: ElevatedButton(
                    onPressed: () async {
                      isAuthenticated = await _signIn();
                      UserName(username: _usernameController.text);
                      _animationController.forward();
                      // Simulate login process
                      Future.delayed(const Duration(milliseconds: 300), () {
                        if (isAuthenticated) {
                        // Reset the animation
                        _animationController.reverse();
                        // Perform actual login logic here
                          
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                        }
                      });
                    },
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(EdgeInsets.only(
                          top: 6, bottom: 6, left: 50, right: 50)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 19, 145, 159)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      elevation: const MaterialStatePropertyAll(10.0),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Navigation logic for creating a new account goes here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateAccount()),
                  );
                },
                child: const Text(
                  'Create new account',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
