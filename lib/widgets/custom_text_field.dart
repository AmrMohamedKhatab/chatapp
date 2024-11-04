
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
   CustomFormTextField({super.key, this.hintText,this.onChanged,this.obscureText = false});

   Function(String)? onChanged;
  String? hintText;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return 
          TextFormField( 
            obscureText: obscureText!,
            validator: (data) {
              if(data !.isEmpty)
              {
                return 'field is required';
              }
            },
            onChanged:onChanged ,    
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              hintText: hintText,
              enabledBorder:OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white ,
                )
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          );
  }
}