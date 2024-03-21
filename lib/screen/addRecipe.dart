import 'package:flutter/material.dart';

import '../../class/recipe.dart';

class AddRecipe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddRecipeState();
  }
}

class _AddRecipeState extends State<AddRecipe> {
  final TextEditingController _recipe_name_cont = TextEditingController();
  final TextEditingController _recipe_desc_cont = TextEditingController();
  final TextEditingController _recipe_photo_cont = TextEditingController();
  late int _charleft;
  late String _recipe_category;
  //*late* untuk inisiasi variabel yang akan dipakai nanti

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recipe_name_cont.text = "your food name";
    _recipe_desc_cont.text = "Recipe of ..";
    _recipe_photo_cont.text = "https://indonesiakaya.com/wp-content/uploads/2020/10/tahu-tek-1200.jpg";
    _recipe_category = "Traditional";
    _charleft = 200 - _recipe_desc_cont.text.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text("Add New Recipe"),
          TextField(
              controller: _recipe_name_cont,
              onChanged: (v) {
                print(_recipe_name_cont.text);
                print(v);
              }),
          TextField(
            controller: _recipe_desc_cont,
            onChanged: (v) {
              setState(() {
                _charleft = 200 - v.length;
              });
            },
            keyboardType: TextInputType.multiline,
            minLines: 4,
            maxLines: null,
            maxLength: 200,
          ),
          Text("char left : " + _charleft.toString()),
          TextField(
            controller: _recipe_photo_cont,
            onSubmitted: (v) {
              setState(() {});
            },
          ),
          Image.network(_recipe_photo_cont.text),
          DropdownButton(
              value: _recipe_category,
              items: const [
                DropdownMenuItem(
                  child: Text("Traditional"),
                  value: "Traditional",
                ),
                DropdownMenuItem(
                  child: Text("Japanese"),
                  value: "Japanese",
                ),
                DropdownMenuItem(
                  child: Text("Western"),
                  value: "Western",
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _recipe_category = value.toString();
                });
              }),
          ElevatedButton(
              onPressed: () {
                recipes.add(Recipe(
                    id: recipes.length + 1,
                    name: _recipe_name_cont.text,
                    desc: _recipe_desc_cont.text,
                    photo: _recipe_photo_cont.text,
                    cat: _recipe_category));
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text('Add Recipe'),
                          content: Text('Recipe successfully added'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ));
              },
              child: Text('SUBMIT')),
        ],
      )),
    );
  }
}
