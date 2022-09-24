import 'package:banking_app_ui/auth/ownauth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _newEmailController = TextEditingController();
  bool result = false;
  final _newPasswordController = TextEditingController();
  final _newConfirmPasswordController = TextEditingController();
  final _newFirstNameController = TextEditingController();
  final _newLastNameController = TextEditingController();
    final _newAgeController = TextEditingController();
String? errorMessage = '';
  // Future signIn() async{
    
  //   // await FirebaseAuth.instance.signInWithEmailAndPassword(
  //   //   email: _emailController.text.trim(), 
  //   //   password: _passwordController.text.trim()
  //   //   ); 
  //     try {
  //     await OwnAuth().signInWithEmailAndPassword(
  //       email: _newEmailController.text.trim(), 
  //       password: _newPasswordController.text.trim()
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       errorMessage = e.message;
  //     });
  //   }

  // }
bool passwordConfirmed(){
if (_newPasswordController.text.trim() == _newConfirmPasswordController.text.trim())
{return result = true;}
else {return result;}
}

  Future signUp() async{
    try{
      //if password matches
      if(passwordConfirmed()){
        //create user for login
        await OwnAuth().createUserWithEmailAndPassword(
         email: _newEmailController.text,
         password: _newPasswordController.text);

        //add user details
         addUserDetails(_newFirstNameController.text.trim(),
         _newLastNameController.text.trim(), 
         _newEmailController.text.trim(),
         int.parse(_newAgeController.text.trim())
         );
      }
       
    }on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }

  }

  Future addUserDetails(String firstname,String lastname,String email,int age) async{
      await FirebaseFirestore.instance.collection('users').add({
        'firstname':firstname,
        'lastname':lastname,
        'email':email,
        'age':age
      }
      );

  }

  @override
  void dispose(){
    _newEmailController.dispose();
    _newPasswordController.dispose();
    _newConfirmPasswordController.dispose();
    _newFirstNameController.dispose();
    _newLastNameController.dispose();
    _newAgeController.dispose();
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
                        Icon(Icons.person_sharp,
                        size: 100),
                        Text('Lets Join!',style: GoogleFonts.bebasNeue(
                        fontSize: 36,fontWeight: FontWeight.bold
                        
            
                        ),
                        ),
            
                        Text('Start your new beginning.',style: TextStyle(
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
                              controller: _newFirstNameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter First Name',
                              ),
            
                            ),
                          
                          
                          ),
                        ),
                        SizedBox(height: 10,),
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
                              controller: _newLastNameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Last Name',
                              ),
            
                            ),
                          
                          
                          ),
                        ),
                          SizedBox(height: 10,),
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
                              controller: _newAgeController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Age',
                              ),
            
                            ),
                          
                          
                          ),
                        ),
                        SizedBox(height: 10,),
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
                              controller: _newEmailController,
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
                              controller: _newConfirmPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Password',
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
                              controller: _newPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Confirm Password',
                              ),
            
                            ),
                          
                          
                          ),
                        ),

                      ],
                      

                      
                    ),
                  //sign button
                    SizedBox(height: 30,),
                  //password field
                          Column(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                      padding: const EdgeInsets.symmetric(horizontal:35),
                      child: GestureDetector(
                        onTap: signUp,
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
                                  'Sign Up',
                                      style:TextStyle(color: Colors.white)
                                  
                                ),
                          ),
                        ),
                      ),
                    ),
                  //Already registered ? login now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Already Registered ?',style: TextStyle(fontWeight: FontWeight.bold),),
                      GestureDetector(onTap: widget.showLoginPage,
                        child: Text(' Then Login Now',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),)),
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
