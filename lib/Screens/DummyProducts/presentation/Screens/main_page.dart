import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterieee/Screens/DummyProducts/Config/theme/techie_colors.dart';
import 'package:flutterieee/Screens/DummyProducts/data/cubit/products_cubit.dart';
import 'package:flutterieee/Screens/DummyProducts/presentation/Screens/product_screen.dart';
import 'package:flutterieee/Screens/DummyProducts/presentation/Widgets/featured_box.dart';
import 'package:flutterieee/Screens/DummyProducts/presentation/Widgets/grid_box.dart';
import 'package:flutterieee/Screens/DummyProducts/presentation/Widgets/products_text.dart';
import 'package:lottie/lottie.dart';

class ProductsHome extends StatelessWidget {
  const ProductsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) => ProductsCubit(),
        builder: (context, state) {
          var cubit = ProductsCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: TechieColors.primary,
              foregroundColor: Colors.black,
              title: const Text('Techie Treasures'),
              centerTitle: true,
              forceMaterialTransparency: true,
            ),
            body: state is ProductGetSuccess
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35.0,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          ProductText(text: 'Featured'),
                          Center(
                            child: Swiper(
                              onTap: (index) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                      product: cubit.products[index]),
                                ),
                              ),
                              itemCount: cubit.products.length,
                              layout: SwiperLayout.STACK,
                              autoplay: true,
                              autoplayDisableOnInteraction: true,
                              itemHeight:
                                  MediaQuery.of(context).size.height * 0.3,
                              itemWidth: MediaQuery.of(context).size.width,
                              itemBuilder: (context, index) =>
                                  FeaturedItem(product: cubit.products[index]),
                            ),
                          ),
                          // * Filters
                          // * All Stock
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GridView.builder(
                              itemCount: cubit.products.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 25,
                                mainAxisSpacing: 25,
                                childAspectRatio: 0.7,
                              ),
                              itemBuilder: (context, index) =>
                                  ProductItem(product: cubit.products[index]),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : state is ProductLoadingState
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                                'assets/Pictures/LoadingAnimation.json'),
                            const Text('Loading...'),
                          ],
                        ),
                      )
                    : const Center(
                        child: Text('Error Loading Content'),
                      ),
          );
        },
      ),
    );
  }
}
