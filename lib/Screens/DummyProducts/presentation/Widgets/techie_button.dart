import 'package:flutter/material.dart';
import 'package:flutterieee/Screens/DummyProducts/Config/theme/techie_colors.dart';
import 'package:flutterieee/Screens/DummyProducts/presentation/Widgets/products_text.dart';

class TechieButton extends StatelessWidget {
  const TechieButton({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: screenSize.width * 0.9,
        height: screenSize.height * 0.1,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(TechieColors.primary),
            surfaceTintColor:
                const MaterialStatePropertyAll(TechieColors.lightPrimary),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          child: ProductText(
            text: 'Buy Now',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
