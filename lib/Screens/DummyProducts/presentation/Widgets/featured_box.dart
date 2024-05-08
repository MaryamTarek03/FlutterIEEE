import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/DummyProducts/data/models/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.25,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.network(
                product.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Center(
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: screenSize.width * 0.76,
                height: screenSize.height * 0.25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  product.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
