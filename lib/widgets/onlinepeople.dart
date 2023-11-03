import 'package:flutter/material.dart';
import 'package:tag_page/models/category.dart';
import 'package:tag_page/Screens/onlinescreen.dart';
import 'package:tag_page/models/onlineprofiles.dart';

class OnlineGridItem extends StatefulWidget {
  final Profiles profile;

  OnlineGridItem({required this.profile});

  @override
  _OnlineGridItemState createState() => _OnlineGridItemState();
}

class _OnlineGridItemState extends State<OnlineGridItem> {

  @override
  Widget build(BuildContext context) {
    String tagstring = widget.profile.tags.join(', ');
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: Colors.yellow,
        ),
        color: Colors.white,
      ),

      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Row(
            children: [
              Image.asset(widget.profile.img, height: 50, width: 50),
              SizedBox(height: 100, width: 30),
              Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5, width: 50),

                  Text(
                    widget.profile.username,
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    tagstring,
                    style: TextStyle(fontSize: 8, color: Colors.black, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}