import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/config/constants.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/pages/details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWidget(),
      body: SafeArea(
        child: BodyWidget(),
      ),
    );
  }
}

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: kTextColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: kTextColor,
          ),
        ),
        const SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
          ),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const CategoryWidget(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding,
            ),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 0.72,
              ),
              itemBuilder: (context, index) {
                return ItemCard(
                  press: () {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          currentProduct: products[index],
                        ),
                      ),
                    );
                  },
                  currentProduct: products[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<String> categories = [
    "Hand bag",
    "Jewellery",
    "Footwear",
    "Dreeses",
    "Perfumes",
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding / 2,
      ),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding + 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categories[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index
                            ? kTextColor
                            : kTextLightColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: kDefaultPadding / 4,
                      ),
                      height: 2,
                      width: 30,
                      color: selectedIndex == index
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Products currentProduct;
  final Function() press;

  const ItemCard({
    Key? key,
    required this.press,
    required this.currentProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: currentProduct.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(currentProduct.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 4,
              horizontal: 2,
            ),
            child: Text(
              currentProduct.title,
              style: const TextStyle(
                color: kTextLightColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              "\$${currentProduct.price}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
