import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterieee/Screens/DummyProducts/Config/theme/dummy_api_colors.dart';
import 'package:flutterieee/Screens/DummyProducts/data/cubit/products_cubit.dart';
import 'package:flutterieee/Screens/DummyProducts/presentation/Widgets/grid_box.dart';
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
            backgroundColor: DummyDataColors.lightPrimary,
            appBar: AppBar(
              backgroundColor: DummyDataColors.primary,
              foregroundColor: Colors.white,
              title: const Text('Available Items'),
              centerTitle: true,
            ),
            body: state is ProductGetSuccess
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cubit.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) =>
                            ProductItem(product: cubit.products[index]),
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
