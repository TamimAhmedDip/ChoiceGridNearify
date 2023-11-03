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
      appBar: AppBar(
        title: const Text('Choose Your Tags'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
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
          ElevatedButton(
            onPressed: () {
              // Handle submit button press, you can access selectedCategories here
              print('Selected Categories: $selectedCategories');
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent,
            ),
            child: SizedBox(
              width: double.infinity, // Expands the width of the button to the maximum available width
              height: 60,  // Sets the height of the button to 60 logical pixels

              child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
