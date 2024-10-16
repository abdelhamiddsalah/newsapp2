import 'package:flutter/material.dart';

class Listtilee extends StatelessWidget {
  const Listtilee({super.key,required this.title,required this.leading, this.onTap,this.trailing,});
  final String title;
  final Widget leading;
  final Widget? trailing; 
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          title, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),),
        leading: leading,
        onTap: onTap,
        trailing: trailing,
      ),
    );
  }
}
