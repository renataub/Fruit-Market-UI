import 'package:flutter/material.dart';
import '../model/model.dart';

class ItemDetails extends StatefulWidget {
  final Item item;
  ItemDetails({required this.item});

  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.item.bgColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 55,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.keyboard_arrow_left, size: 25),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: 300,
              child: Hero(
                tag: widget.item.imageUrl,
                child: Image.asset(widget.item.imageUrl),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 199, 199, 199),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.item.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33,),),
                    Text(widget.item.lb, style: TextStyle(color: Colors.black45, fontSize: 18),),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            buildCounterButton(Icons.remove),
                            Container(
                              height: 50,
                              width: 50,
                              color: Colors.grey[100],
                              child: Center(
                                child: Text( "1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ),
                            ),
                            buildCounterButton(Icons.add),
                          ],
                        ),
                        Text("\$${widget.item.price}", style: TextStyle(color: Colors.black, fontSize: 35),),
                      ],
                    ),
                    SizedBox(height: 25),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text("Product Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                            SizedBox(height: 5),
                            Text(widget.item.description, style: TextStyle(color: Colors.black, fontSize: 18),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 22),
                    Row(
                      children: [
                        buildActionButton(Icons.favorite, widget.item.color, true),
                        SizedBox(width: 15),
                        Expanded(
                          child: buildActionButton(Icons.shopping_cart, widget.item.color, false, "Add to cart"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCounterButton(IconData icon) {
  return GestureDetector(
    child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: icon == Icons.remove ? BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15),)
            : BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      child: Icon(icon),
    ),
  );
}

 Widget buildActionButton(IconData icon, Color color, bool outline, [String? text]) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: outline ? Colors.white : color,
        borderRadius: BorderRadius.circular(20),
        border: outline ? Border.all(width: 2, color: color) : null,
      ),
      child: Center(
        child: text == null
            ? Icon(icon, size: 45, color: color)
            : Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
      ),
    );
  }


