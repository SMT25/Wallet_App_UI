import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:banking_app_ui/utilities/bouncingbutton.dart';

import '../utilities/dialogbox.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }
  
Future passwordReset() async{
  try{
DialogBoxWidget();
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
    
  } on FirebaseAuthException catch(e){
print(e);

  }


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple[200],title: Text('Reset Password'),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:35),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter Email to receive reset link.',style: GoogleFonts.bebasNeue(
                          fontSize: 20,fontWeight: FontWeight.bold
                          
              
                          ),),
           Container(
             padding: EdgeInsets.symmetric(horizontal: 15),
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
            SizedBox(height: 10,),
          

                        //CupertinoButton(child: Text('Reset Password'), onPressed: (){},color: Colors.deepPurple[200],),
                        GestureDetector(onTap: 
                        passwordReset
                        ,child: BouncingButton()),
          ],
        ),
      ),
      
    
    );
  }
  
  
}