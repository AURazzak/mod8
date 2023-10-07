import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Map<String, int> itemCounts = {"Denim": 1, "T-Shirt": 1, "Jacket": 1};
  double unitPrice = 20.00;

  void _incrementItem(String item) {
    setState(() {
      itemCounts[item] = itemCounts[item]! + 1;
    });
  }

  void _decrementItem(String item) {
    setState(() {
      itemCounts[item] = itemCounts[item]! > 0 ? itemCounts[item]! - 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = itemCounts.values.fold(0, (previous, count) => previous + (count * unitPrice));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "My Bag",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildClothItem(
                    "Denim",
                    "https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/6840942/2018/9/20/ed807de3-6988-4600-8c6e-a0fb61ce50691537446736708-Levis-Men-Green-Solid-Denim-Jacket-5381537446735225-1.jpg",
                    "Green",
                  ),
                  _buildClothItem(
                    "T-Shirt",
                    "https://images.othoba.com/images/thumbs/0550099_mens-100-export-quality-premium-royal-blue-color-short-sleeve-t-shirt.jpeg",
                    "Blue",
                  ),
                  _buildClothItem(
                    "Jacket",
                    "https://www.swanndri.co.nz/media/catalog/product/image/121608507/men-s-redwoods-softshell-jacket-with-fleece-lining.jpg",
                    "Black",
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(opacity: 0.7, child: Text("Total Amount")),
                Text(
                  "\$${totalAmount.toStringAsFixed(2)}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Congratulations on your checkout!")),
                );
              },
              child: Text("CHECK OUT"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(130),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildClothItem(String title, String imageUrl, String color) {
    Color clothColor;
    if (color == "Green") {
      clothColor = Colors.green;
    } else if (color == "Blue") {
      clothColor = Colors.blue;
    } else if (color == "Black") {
      clothColor = Colors.black;
    } else {
      clothColor = Colors.red;
    }

    return Column(
      children: [
        Container(
          height: 120,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Opacity(opacity: 0.8, child: Text("Color:")),
                            SizedBox(width: 6),
                            Text(color),
                            SizedBox(width: 17),
                            Opacity(opacity: 0.8, child: Text("Size:")),
                            SizedBox(width: 3),
                            Text("M"),
                          ],
                        ),
                        Row(
                          children: [
                            _buildCircleIcon(Icons.remove, () => _decrementItem(title)),
                            SizedBox(width: 12),
                            Text("${itemCounts[title]}", style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(width: 12),
                            _buildCircleIcon(Icons.add, () => _incrementItem(title)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Opacity(
                          opacity: 0.7,
                          child: Icon(
                            Icons.more_vert,
                            size: 32,
                          ),
                        ),
                        Text(
                          "\$${(unitPrice * itemCounts[title]!).toStringAsFixed(2)}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget _buildCircleIcon(IconData iconData, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 12,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(child: Icon(iconData, color: Colors.black.withOpacity(0.75), size: 22)),
      ),
    );
  }
}