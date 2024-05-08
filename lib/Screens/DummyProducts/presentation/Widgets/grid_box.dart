import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/DummyProducts/Config/theme/techie_colors.dart';
import 'package:flutterieee/Screens/DummyProducts/data/models/product_model.dart';
import 'package:flutterieee/Screens/DummyProducts/presentation/Screens/product_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductScreen(
            product: product,
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: screenSize.height * 0.5,
            decoration: BoxDecoration(
              color: TechieColors.lightPrimary,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: product.id,
                    child: Container(
                      width: screenSize.width * 0.4,
                      height: screenSize.height * 0.12,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        product.thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.mPlusRounded1c(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.description,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${product.price}\$',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            width: screenSize.width * 0.15,
            height: 25,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(product.rating.toStringAsFixed(1)),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
