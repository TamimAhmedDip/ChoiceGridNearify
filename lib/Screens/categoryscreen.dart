import 'package:flutter/material.dart';
import 'package:tag_page/widgets/category_grid_item.dart';
import 'package:tag_page/data/dummy_data.dart';


class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> selectedCategories = ['Exam'];

  void _handleSelectChange(bool isSelected, String categoryTitle) {
    setState(() {
      if (isSelected) {
        selectedCategories.add(categoryTitle);
      } else {
        selectedCategories.remove(categoryTitle);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40,),
          Text('All Tags',
          style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2 / 1,
                crossAxisSpacing: 50,
                mainAxisSpacing: 10,
              ),
              children: [
                for (final category in availableCategories)
                  CategoryGridItem(
                    category: category,
                    onSelectChanged: (isSelected) {
                      _handleSelectChange(isSelected, category.title);
                    },
                  ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
