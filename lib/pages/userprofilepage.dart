import 'package:banking_app_ui/pages/userprofilemodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class userProfilePage extends StatefulWidget {
  const userProfilePage({Key? key}) : super(key: key);

  @override
  State<userProfilePage> createState() => _userProfilePageState();
  
}

class _userProfilePageState extends State<userProfilePage> {
final CollectionReference _users = FirebaseFirestore.instance.collection('users');

//   List<userProfileModel> userDetails = [];
//   void initState(){
//     fetchUserDetails();
//     super.initState();
//   }

//   fetchUserDetails() async{
//     var result = await FirebaseFirestore.instance.collection('users');
//     mapRecords(result); 
//   }
//   mapRecords(QuerySnapshot<Map<String,dynamic>> result{
//     var _list = result.docs.map((userprofilemodel) => 
//     userProfileModel(
//       age: userProfileModel['age'], 
//     email: userProfileModel['email'], 
//     firstname: userProfileModel['firstname'], 
//     lastname: userProfileModel['lastname']
//     ),
//     ).toList();
// setState(() {
//   userDetails = _list;
// });
//   } 

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:ListView.builder(
      //   itemCount: userDetails.length,
      //   itemBuilder: (context,index){
      //     return ListTile(
      //       title: Text('User $index'),
      //       subtitle: Text('User $index description'),
      //     );
      //   },
      //   ),
      appBar: AppBar(),
      body:StreamBuilder(
        stream: _users.snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> streamSnapshot){
          if(streamSnapshot.hasData){
          return ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder: (context,index){
              final DocumentSnapshot documentSnapShot = streamSnapshot.data!.docs[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child:ListTile(
                  title:Text(documentSnapShot['firstname']),
                  subtitle: Text(documentSnapShot['lastname']),
                ),
              );

            },

          );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
    ),
  );
  }

}