import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/config/constants.dart';
import 'package:shop_app/models/products.dart';

class DetailsPage extends StatelessWidget {
  final Products currentProduct;

  const DetailsPage({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentProduct.color,
      appBar: const AppbarWidget(),
      body: SafeArea(
        child: DetailsBodyWidget(
          currentProduct: currentProduct,
        ),
      ),
    );
  }
}

//main contents of scaffold

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}

class DetailsBodyWidget extends StatelessWidget {
  final Products currentProduct;
  const DetailsBodyWidget({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: deviceHeight,
            child: Stack(
              children: [
                //bottom part of the page
                //the white container
                Container(
                  margin: EdgeInsets.only(
                    top: deviceHeight * 0.32,
                  ),
                  padding: EdgeInsets.only(
                    top: deviceHeight * 0.10,
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: DetailsPageLowerPortion(
                    currentProduct: currentProduct,
                  ),
                ),

                //top part of page
                //the colored container
                DetailsPageTopPortion(
                  currentProduct: currentProduct,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//division of the page in two halves

class DetailsPageTopPortion extends StatelessWidget {
  final Products currentProduct;
  const DetailsPageTopPortion({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Aristocratic Hand Bag",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            currentProduct.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Price",
                    ),
                    TextSpan(
                      text: "\n\$${currentProduct.price}",
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: Image.asset(
                  currentProduct.image,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailsPageLowerPortion extends StatelessWidget {
  final Products currentProduct;
  const DetailsPageLowerPortion({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsPageSizeAndColor(
          currentProduct: currentProduct,
        ),
        const SizedBox(
          height: kDefaultPadding / 2,
        ),
        DetailsPageDescription(
          currentProduct: currentProduct,
        ),
        const SizedBox(
          height: kDefaultPadding / 2,
        ),
        CounterWithWishlist(
          currentProduct: currentProduct,
        ),
        const SizedBox(
          height: kDefaultPadding / 2,
        ),
        ButtonWithCart(
          currentProduct: currentProduct,
        ),
      ],
    );
  }
}

//utilities

class DetailsPageSizeAndColor extends StatelessWidget {
  final Products currentProduct;
  const DetailsPageSizeAndColor({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Color"),
              Row(children: const [
                ColorDot(
                  color: Color(0xFF356C95),
                  isSelected: true,
                ),
                ColorDot(
                  color: Color(0xFFF8C078),
                ),
                ColorDot(
                  color: Color(0xFFA29B9B),
                ),
              ]),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                color: kTextColor,
              ),
              children: [
                const TextSpan(text: "Size\n"),
                TextSpan(
                  text: "${currentProduct.size} cm",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      padding: const EdgeInsets.all(2.5),
      margin: const EdgeInsets.only(
        top: kDefaultPadding / 4,
        right: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class DetailsPageDescription extends StatelessWidget {
  final Products currentProduct;
  const DetailsPageDescription({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding,
      ),
      child: Text(
        currentProduct.description,
        style: const TextStyle(
          height: 1.5,
        ),
      ),
    );
  }
}

class CartCounterWidget extends StatefulWidget {
  final Products currentProduct;
  const CartCounterWidget({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  @override
  State<CartCounterWidget> createState() => _CartCounterWidgetState();
}

class _CartCounterWidgetState extends State<CartCounterWidget> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        cartCounterButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding / 2,
          ),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        cartCounterButton(
          icon: Icons.add,
          press: () {
            setState(() {
              numOfItems++;
            });
          },
        ),
      ],
    );
  }

  Widget cartCounterButton({
    required IconData icon,
    required Function() press,
  }) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(0),
          ),
          backgroundColor: MaterialStateProperty.all(
            widget.currentProduct.color,
          ),
        ),
        onPressed: press,
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}

class CounterWithWishlist extends StatelessWidget {
  final Products currentProduct;
  const CounterWithWishlist({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CartCounterWidget(
          currentProduct: currentProduct,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration: const BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/heart.svg"),
        ),
      ],
    );
  }
}

class ButtonWithCart extends StatelessWidget {
  final Products currentProduct;
  const ButtonWithCart({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              right: kDefaultPadding,
            ),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              border: Border.all(
                color: currentProduct.color,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    currentProduct.color,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Buy Now".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
