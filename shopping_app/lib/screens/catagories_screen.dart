import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/screens/cart_screen.dart';

List<Product> dummylist = [
  Product(
    id: 1,
    title: 'Yellow Scarf',
    discription: 'this is an imported product',
    imageurl: 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    price: 29.12,
  ),
  Product(
    id: 2,
    title: 'A Pan',
    discription: 'Prepare any meal you want.',
    price: 49.99,
    imageurl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
  ),
  Product(
      id: 3,
      title: 'red shirt',
      discription: 'this is an imported product',
      imageurl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      price: 12.5)
];

class Catagories extends StatefulWidget {
  @override
  Catagories_State createState() => Catagories_State();
}

class Catagories_State extends State<Catagories> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Products'),
      ),
      body: Column(
        children: dummylist.map((lxt) {
          return Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100,

                      margin: EdgeInsets.all(10),
                      // decoration: BoxDecoration(border: Border.all(width: 0)),
                      // padding: EdgeInsets.all(10),

                      child: Image.network(
                        lxt.imageurl,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          lxt.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          lxt.discription,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '\$${lxt.price}',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Cart(),
                          ),
                        );
                      },
                    )
                    /* Container(

                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${lxt.price}',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ))*/
                  ],
                ),
              ));
        }).toList(),
      ),
    );
  }
}
