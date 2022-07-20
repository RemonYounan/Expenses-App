import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/others/categories_data.dart';
import 'package:personal_expenses/screens/notifications_screen.dart';
import 'package:personal_expenses/widgets/categori_grid_item.dart';
import 'package:personal_expenses/widgets/category_painter.dart';
import 'package:personal_expenses/widgets/credit_card_carouse.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final NumberFormat numFormat = NumberFormat.decimalPattern('en_us');
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {},
                    child: ImageIcon(
                      const AssetImage(
                        'assets/arrows.png',
                      ),
                      size: 28,
                      color: Theme.of(context).colorScheme.secondary,
                    )),
                IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.pushNamed(context, NotificationsScreen.routeName);
                  },
                  icon: const Icon(Icons.notifications),
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 28,
                ),
              ],
            ),
          ),
          Text(
            'Total balance',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
            textAlign: TextAlign.center,
          ),
          Text(
            '\$${numFormat.format(4000)}',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 32,
                ),
            textAlign: TextAlign.center,
          ),
          const CreditCardCarouse(),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(50), blurRadius: 10.0),
              ],
            ),
            child: Stack(
              children: [
                CustomPaint(
                  painter: CategoryPainter(context),
                  size: Size(size.width, 360),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Text(
                        'Categories',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 26),
                      ),
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 130,
                        maxCrossAxisExtent: 120,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                      ),
                      padding: const EdgeInsets.all(6),
                      children: CATEGORIES_DATA
                          .map(
                            (e) => CategoriGridItem(
                              e['title'] as String,
                              e['icon'] as Icon,
                              e['color'] as Color,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
