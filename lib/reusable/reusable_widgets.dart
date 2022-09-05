import 'package:flutter/material.dart';
import 'my_colors.dart';

Widget myTextField( {iconButton , bool isPassword = false , var key , required TextEditingController controller  , required BuildContext context} ) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey[400],
    ),
    child: TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          // show dialog
          showDialog(context: context, builder: (context){
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Error' , ),
              content: Text('Some fields are empty'),
              actions: <Widget>[
               MaterialButton(color: Colors.red,
                 onPressed: (){
                 Navigator.of(context).pop();
               }, child:const Text('Ok' ,
                 style: TextStyle(color: Colors.white),
                 ) , )
              ],
            );
          }
          );
          return null;
        }
        return null;
      },
      obscureText: isPassword ,
      decoration: InputDecoration(
        suffixIcon: iconButton,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}

Widget myButton(String text , BuildContext context , function ) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    width: MediaQuery
        .of(context)
        .size
        .width,
    child: MaterialButton(
      onPressed: function ,
      color: myLightBlack,
      textColor: Colors.white,
      child:  Text(
        text,
        style:const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ) ;
}
