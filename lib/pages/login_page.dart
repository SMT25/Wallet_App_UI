import 'package:banking_app_ui/auth/ownauth.dart';
import 'package:banking_app_ui/pages/forgot_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key,required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
 
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
String? errorMessage = '';
  Future signIn() async{
    
    // await FirebaseAuth.instance.signInWithEmailAndPassword(
    //   email: _emailController.text.trim(), 
    //   password: _passwordController.text.trim()
    //   ); 
      try {
      await OwnAuth().signInWithEmailAndPassword(
        email: _emailController.text.trim(), 
        password: _passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }

  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Hello again
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person,
                        size: 100),
                        Text('Hello Again!',style: GoogleFonts.bebasNeue(
                        fontSize: 36,fontWeight: FontWeight.bold
                        
            
                        ),
                        ),
            
                        Text('You have been missed.',style: TextStyle(
                        fontSize: 20,
                           
            
                        ),
                        ),
                    
                    SizedBox(height: 90,),
                      ],
                    ),
                  //email text field
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:35),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration:(BoxDecoration(
                              color:Colors.grey[200],
                              border:Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)
                            )
                            ),
                            child: 
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Email Address',
                              ),
            
                            ),
                          
                          
                          ),
                        ),
            
            SizedBox(height: 10,),
                  //password field
                              Padding(
                          padding: const EdgeInsets.symmetric(horizontal:35),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration:(BoxDecoration(
                              color:Colors.grey[200],
                              border:Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)
                            )
                            ),
                            child: 
                            TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Password',
                              ),
            
                            ),
                          
                          
                          ),
                        ),
                          SizedBox(height: 7,),
                          GestureDetector(onTap:() {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ForgotPasswordPage();
                            },
                            ),
                            );
                          },
                            child: Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                padding: const EdgeInsets.symmetric(horizontal:35),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  
                                  child: 
                                  Text(
                                    'Forgot Password',
                                        style: TextStyle(color: Colors.blueGrey),
                                    
                                  ),
                                
                                
                                ),
                                                  ),
                              ],
                            ),
                          ),

                      ],
                    ),
                  //sign button
                    SizedBox(height: 10,),
                  //password field
                      Column(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                        padding: const EdgeInsets.symmetric(horizontal:35),
                        child: GestureDetector(
                        onTap: signIn,
                        child: Container(
                          
                          padding: EdgeInsets.all(20),
                          decoration:(BoxDecoration(
                                color:Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.circular(12)
                          )
                          ),
                          child: 
                          Center(
                                child: Text(
                                  'Sign In',
                                      style:TextStyle(color: Colors.white)
                                  
                                ),
                          ),
                        ),
                      ),
                    ),
                        //not a member ? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Not a member ?',style: TextStyle(fontWeight: FontWeight.bold),),
                      GestureDetector(onTap: widget.showRegisterPage,
                        child: Text(' Register now',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                            ],
                          ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
