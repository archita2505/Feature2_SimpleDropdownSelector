import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DropdownExample(),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  // List of dropdown items
  final List<String> items = ['Male', 'Female', 'Others'];

  // Selected value
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Selector Example'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text "Choose your gender"
            Text(
              'Choose your gender', 
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 10), // Add some spacing between text and dropdown

            // DropdownButton wrapped in a button-like container
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                border: Border.all(color: Colors.blue, width: 2), // Border
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              child: DropdownButton<String>(
                hint: Text('Select an item'),
                value: selectedItem,
                onChanged: (value) {
                  setState(() {
                    selectedItem = value; // Update the selected item
                  });
                },
                items: items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                underline: SizedBox(), // Remove the default underline
                isExpanded: false, // Prevent dropdown from stretching
              ),
            ),
            const SizedBox(height: 20),
            // Display the selected item
            Text(
              selectedItem != null ? 'Selected: $selectedItem' : 'No item selected',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
