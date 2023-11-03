import 'package:flutter/material.dart';
import 'package:tag_page/models/category.dart';

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
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onSelectChanged(_isSelected);
      },
      onLongPress: () {
        // Handle long press logic here if needed
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(widget.category.img, height: 100, width: 100),
                Text(
                  widget.category.title,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
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
      ),
    );
  }
}




