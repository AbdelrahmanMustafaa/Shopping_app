import 'package:firebase_auth/firebase_auth.dart';

class MyDatabaseHandler {
  MyDatabaseHandler._internal() ;
   static final MyDatabaseHandler instance = MyDatabaseHandler._internal();
  factory MyDatabaseHandler()=> instance;

  signInAuth(String email, String password) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential response = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      return response;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  signUpAuth(String email, String password) async {
    try {
      print(' we here in try to signup in databaseHandler class');
      print('-----------------------------------------');
      print(email.isEmpty);
      print(password.isEmpty);
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential response = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(' ${response.credential!.token}');
      print('-----------------------------------------');
      print(email.isEmpty);
      print(password.isEmpty);
      return response;
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        print('the password is weak');
      } else if (e.code == 'email-already-in-use') {
        print('this email used before');
      } else if (e.code == 'invalid-email') {
      } else {
        print(e);
        print('Everything is okay');
      }
      print('on exception');
      print(e.code);
    print (e.toString());
    }
  }


  // sign in anonymously
  signInAnonymously() async {
    try {
      print ('we here in try to sign in anonymously');
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential response = await auth.signInAnonymously();
      return response;
    } catch (e) {
      print ('----------------------------------------------------------------------------------------------');
      print ('error in handler class sign in anonymously');
      print(e.toString());
      return null;
    }
  }
}
