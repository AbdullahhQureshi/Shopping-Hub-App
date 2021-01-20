import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/product.dart';
import 'package:shopping_app/provider/products.dart';
import 'package:shopping_app/provider/searcheditems.dart';
import 'package:shopping_app/widget/app_drawer.dart';
import 'package:shopping_app/widget/badge.dart';
import 'package:shopping_app/provider/cart.dart';
import 'package:shopping_app/widget/product_list.dart';
import 'package:shopping_app/screens/searchproduct_screen.dart';
import 'package:speech_recognition/speech_recognition.dart';

import 'cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class Allproduct extends StatefulWidget {
  static const routeName = '/allproduct';

  @override
  _AllproductState createState() => _AllproductState();
}

class _AllproductState extends State<Allproduct> {
  final TextEditingController __searchcontroller = new TextEditingController();
  var _showOnlyFavorites = false;
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  var _searchedproducts=[{
    'id':'',
    'title':'',
    'description':'',
    'imageurl':'',

  }];

  String resultText = "Speach input";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
          (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
          () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
          (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
            () => setState(() => _isListening = false)
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
    );

  }


  @override
  Widget build(BuildContext context) {
    final _productlist = Provider.of<Products>(context);
    final _productdata = _productlist.items;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Products'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(height: 5,),
          /*Container(
            width: MediaQuery.of(context).size.width *0.9 ,
            height:  MediaQuery.of(context).size.width *0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(color: Colors.black, width: 0.7),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            child: Text(
              resultText,
              textAlign:TextAlign.center,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                   // flex:2,
                   FlatButton(
                      // padding: EdgeInsets.all(15),
                      child: Text(
                        'clear the field',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      color: Colors.orange,
                      onPressed: () {
                        setState(() {
                          resultText="";
                        });

                        /* if (_isListening)
                            _speechRecognition.cancel().then(
                                  (result) => setState(() {
                                    _isListening = result;
                                    resultText = "";
                                  }),
                                );*/
                      },
                    ),
                SizedBox(
                  width: 5.0,
                ),
                FlatButton(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Voice Input',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  color: Colors.orange,
                  onPressed: () {
                    if (_isAvailable && !_isListening)
                      _speechRecognition
                          .listen(locale: "en_US");
                    //.then((result) => resultText=result);
                  },
                ),
                SizedBox(width: 5.0,),
                FlatButton(
                    onPressed: (){
                      if(__searchcontroller!=null){
                        for( int i=0;  i<__searchcontroller.text.length; i++){
                          if(_productdata[i].title.toLowerCase().contains(__searchcontroller.text.toLowerCase())) {
                            _searchedproducts[i]['id']=_productdata[i].id;
                            _searchedproducts[i]['title']=_productdata[i].title;
                            _searchedproducts[i]['description']=_productdata[i].discription;
                            _searchedproducts[i]['imageurl']=_productdata[i].imageurl;
                            print('compared');
                          }
                        }
                      }
                      print('${_searchedproducts}');
                    },
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'search',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    color: Colors.orange,

                ),
              ],
            ),
          ),*/




          Container(
            height: MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.all(10),
            child: Productlist(),
          ),
        ]),
      ),
    );
  }

}
/**/
