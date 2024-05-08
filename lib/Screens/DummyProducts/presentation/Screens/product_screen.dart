import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutterieee/Screens/DummyProducts/Config/theme/techie_colors.dart';
import 'package:flutterieee/Screens/DummyProducts/data/models/product_model.dart';
import 'package:flutterieee/Screens/DummyProducts/presentation/Widgets/products_text.dart';
import 'package:flutterieee/Screens/DummyProducts/presentation/Widgets/techie_button.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Techie Info'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * image slideshow
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: TechieColors.lightPrimary,
              ),
              child: ImageSlideshow(
                indicatorColor: TechieColors.darkPrimary,
                indicatorBackgroundColor: Colors.white,
                isLoop: true,
                children: getImages(),
              ),
            ),
            // * product details
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: ProductText(
                      text: product.title,
                      size: 32,
                    ),
                  ),
                  ProductText(text: '${product.price}\$'),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: TechieColors.lightPrimary,
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              child: Text(product.description),
            ),
            const SizedBox(height: 25),
            Text('Brand: ${product.brand}'),
            Text('Category: ${product.category}'),
            Text('Available Quantity: ${product.quantity}'),
            Text('Rating: ${product.rating}'),
          ],
        ),
      ),
      bottomSheet: const TechieButton(),
    );
  }

  List<Widget> getImages() {
    List<Widget> images = [];
    images.add(
      Hero(
        tag: product.id,
        child: Image.network(
          product.thumbnail,
          fit: BoxFit.cover,
        ),
      ),
    );
    for (int i = 0; i < product.images.length - 1; i++) {
      images.add(
        Image.network(
          product.images[i],
          fit: BoxFit.fitHeight,
        ),
      );
    }
    return images;
  }
}
