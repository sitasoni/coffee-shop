import 'package:coffee_shop/Utils/CtmColor.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/Widget/CustomStyle.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(bottom: 5, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: CtmColor.primary.withValues(alpha: 0.8),
            child: ListTile(
              title: Text(
                "Coffee Shop",
                style: customStyle().copyWith(fontSize: 19),
              ),
              leading: Icon(Icons.arrow_back_ios),
              // trailing: Image.asset("assets/images/coffee3.png"),
            ),
          ),
          // Divider(thickness: 1, color: Colors.grey.withValues(alpha: 0.8)),
          ListTile(
            title: Text("Notes"),
            leading: Icon(Icons.sticky_note_2, color: CtmColor.primary.withValues(alpha: 0.8)),
          ),

          ListTile(
            title: Text("Calender"),
            leading: Icon(Icons.calendar_month, color: CtmColor.primary.withValues(alpha: 0.8)),
          ),

          ListTile(
            title: Text("Calculator"),
            leading: Icon(Icons.calculate, color: CtmColor.primary),
          ),
          ListTile(title: Text("BMI Calculator"),leading: Icon(Icons.calculate_outlined, color: CtmColor.primary,),),

          Spacer(),

          Divider(thickness: 1, color: Colors.grey.withValues(alpha: 0.8)),

          Center(child: Text("Version : 1.0.0")),
        ],
      ),
    );
  }
}
