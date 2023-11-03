import 'package:flutter/material.dart';
import 'package:tag_page/models/category.dart';
import 'package:tag_page/Screens/onlinescreen.dart';

class CategoryGridItem extends StatefulWidget {
  final Category category;
  final Function(bool) onSelectChanged;

  CategoryGridItem({required this.category, required this.onSelectChanged});

  @override
  _CategoryGridItemState createState() => _CategoryGridItemState();
}

class _CategoryGridItemState extends State<CategoryGridItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xffe7bf47), Color(0xfffffff7)],
      ),
      border: Border.all(
        color: Colors.white
      ),
      ),

        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Row(
              children: [
                Image.asset(widget.category.img, height: 100, width: 100),
                SizedBox(height: 100, width: 30),
                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50, width: 50),

                Text(
                  widget.category.title,
                  style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
                ),
                Text(
                  widget.category.available.toString() + ': available users',
                  style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w100),
                ),
        ],
                ),
                SizedBox(width: 10),
                Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                IconButton(onPressed: (){
                  // Navigate to BlankPage when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnlinePage()),
                  );
                }, icon: Icon(Icons.arrow_forward), color: Colors.black, iconSize: 36,),]),
              ],
            ),
            _isSelected
                ? Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 32,
              ),
            )
                : SizedBox(),
          ],
        ),
    );
  }
}




