//cria a tale de favoritos
//gerencia o fluxo de telas atraves do drawer e da tabs

import 'package:assicoffee_app/providers/products_provider.dart';
import 'package:assicoffee_app/telas/categories_screen.dart';
import 'package:assicoffee_app/telas/details_screen.dart';
import 'package:assicoffee_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assicoffee_app/widgets/main_drawer.dart';
import 'package:assicoffee_app/telas/filters_screen.dart';
import 'package:assicoffee_app/telas/management_screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  // Função para trocar de aba ao clicar na aba
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      await Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    } else if (identifier == 'management') {
      await Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => const ManagementScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final allProducts = ref.watch(productsProvider);
    final favoriteNames = ref.watch(favoritesProvider);
    final favoriteProducts = allProducts
        .where((product) => favoriteNames.contains(product.name))
        .toList();

    // definiçao de tela ativa
    Widget activePage = const CategoriesScreen();
    String activePageTitle = "AsiCoffee";

    // aba favorites
    if (_selectedPageIndex == 1) {
      activePageTitle = "Meus Favoritos";

      activePage = favoriteProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.rocket_launch_outlined,
                    size: 60,
                    color: colorScheme.secondary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Nenhum favorito ainda!",
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: favoriteProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: favoriteProducts[index],
                    onSelectedProduct: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(product: favoriteProducts[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            );
    }

    return Scaffold(
      appBar: AppBar(
        title: _selectedPageIndex == 0
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/simbolo_asimov.png',
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  const Text("AsiCoffee"),
                ],
              )
            : Text(activePageTitle),
      ),

      drawer: MainDrawer(onSelectScreen: _setScreen),

      body: activePage,

      // tab
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Cardápio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
