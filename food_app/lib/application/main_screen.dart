import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

    final List<Dish> dishes = [
      Dish(imageAsset: 'images/veggie-tomato.png', name: 'Veggie Tomato Mix', price: 'N1,900'),
      Dish(imageAsset: 'images/spicy-fish.png', name: 'Chicken Curry', price: 'N2,100'),
      // Добавьте столько элементов, сколько вам нужно
    ];

    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.09,
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('icons/menu-icon.svg'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('icons/shopping-cart.svg'),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text('Delicious',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
            const Text(
              'food for you',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffEFEEEE)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(children: [
                    SvgPicture.asset('icons/search-icon.svg'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    const Text(
                      'Search',
                      style: TextStyle(color: Colors.black54, fontSize: 17),
                    )
                  ]),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            MenuSelector(),
            DishesListView(dishes: dishes),
          ],
        ),
      )),
    );
  }
}

class MenuSelector extends StatefulWidget {
  @override
  _MenuSelectorState createState() => _MenuSelectorState();
}

class _MenuSelectorState extends State<MenuSelector> {
  // Текущий выбранный элемент
  String selectedMenu = 'Foods';

  @override
  Widget build(BuildContext context) {
    // Список элементов меню
    List<String> menuItems = ['Foods', 'Drinks', 'Snacks', 'Sauce'];

    return Container(
      height: 60, // Высота контейнера, адаптируйте по вашему усмотрению
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          String item = menuItems[index];
          bool isSelected = item == selectedMenu;

          return InkWell(
            onTap: () {
              setState(() {
                selectedMenu = item;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Text(
                    item,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? const Color(0xffFA4A0C)
                          : Color(0xff9A9A9D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isSelected ? 60 : 0,
                    height: 2,
                    color: isSelected
                        ? const Color(0xffFA4A0C)
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Модель данных блюда
class Dish {
  final String imageAsset;
  final String name;
  final String price;

  Dish({
    required this.imageAsset,
    required this.name,
    required this.price,
  });
}

// Виджет карточки товара
class DishCard extends StatelessWidget {
  final Dish dish;

  DishCard({required this.dish});

  @override
  Widget build(BuildContext context) {
    // Определяем размер изображения в зависимости от размера экрана
    final double imageHeight = MediaQuery.of(context).size.width * 0.6;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          // Ширина карточки должна быть меньше ширины изображения, чтобы оно выступало
          width: MediaQuery.of(context).size.width * 0.5,
          margin: EdgeInsets.only(top: imageHeight / 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(top: imageHeight / 2, bottom: 16),
            child: Column(
              children: [
                Text(
                  dish.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  dish.price,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: imageHeight / 4,
          child: Image.asset(
            dish.imageAsset,
            width: MediaQuery.of(context).size.width * 0.6,
            height: imageHeight,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

// Основной виджет, отображающий список карточек блюд
class DishesListView extends StatelessWidget {
  final List<Dish> dishes;

  DishesListView({required this.dishes});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.6 + 120, // Высота списка
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dishes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DishCard(dish: dishes[index]),
          );
        },
      ),
    );
  }
}