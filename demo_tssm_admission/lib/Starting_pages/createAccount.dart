import 'package:firebase_auth/firebase_auth.dart';

import '../database/firebase_auth_services.dart';
import '../toast.dart';
import 'Login_Page.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount>
    with SingleTickerProviderStateMixin { // Add SingleTickerProviderStateMixin

  final FirebaseAuthService _auth = FirebaseAuthService();
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _emailController;
  late TextEditingController _mobilenocontroller;
  late AnimationController _animationController;
  bool _isPasswordVisible = false;
    bool isSigningUp = false;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    _mobilenocontroller = TextEditingController();
    _animationController = AnimationController(
      vsync: this, // Use `this` as vsync
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(_animationController);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _mobilenocontroller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    //String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "User is successfully created");
      //Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "Some error happend");
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
          ),
        ),
        toolbarHeight: 100.0,
        backgroundColor: const Color.fromARGB(255, 19, 145, 159),
        title: const Row(
          children: [
            Text(
              "Create Your Account",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_box_outlined,
                size: 40.0,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Image.asset("lib/assets/Starting_Images/createAccount.jpg",
                fit: BoxFit.cover,),
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
                  controller: _mobilenocontroller,
                  decoration: const InputDecoration(
                    labelText: 'Mobile No',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 13, 95, 125),
                        width: 1,
                      ),
                    ),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Create Username',
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
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Create Password',
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 13, 95, 125),
                        width: 1,
                      ),
                    ),
                     suffixIcon: IconButton(
                      icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
        
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 13, 95, 125),
                        width: 1,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
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
                        await _signUp();
                        _animationController.forward();
                        // Simulate login process
                        Future.delayed(const Duration(milliseconds: 300), () {
                          // Reset the animation
                          _animationController.reverse();
                          // Perform actual login logic here
                          Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginPage()),);
                        });
                      },
                      style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(EdgeInsets.only(top: 6, bottom: 6, left: 50, right: 50)),
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 19, 145, 159)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        elevation: const MaterialStatePropertyAll(10.0),
                      ),
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
