//*provaider de produtos, para jogar a lista de produtos completa, a lista filtadra, a lista favoritada como global
//joga tambem os metodos add item, remove item, favorita item como estados globais


import 'package:assicoffee_app/data/products_data.dart';
import 'package:assicoffee_app/models/product.dart';
import 'package:assicoffee_app/providers/filter_provider.dart'; 
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ProductsNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return [...menuItems]; // Valor inicial lista de dados completa
  }

  //Função add produto
  void addProduct(Product product) {
    state = [...state, product];
  }

  //Função para remover produto
  void removeProduct(Product product) {
    state = state.where((p) => p != product).toList();
  }
}

//retorna a classe que cria a lista
final productsProvider = NotifierProvider<ProductsNotifier, List<Product>>(() {
  return ProductsNotifier();
});

//Notifier da categoria selecionada
class SelectedCategoryNotifier extends Notifier<Category?> {
  @override
  Category? build() {
    return null; 
  }

  void setCategory(Category? category) {
    state = category;
  }
}
//retorna a categoria selecionada
final selectedCategoryProvider = NotifierProvider<SelectedCategoryNotifier, Category?>(() {
  return SelectedCategoryNotifier();
});

//provider da lista filtrada
final filteredProductsProvider = Provider<List<Product>>((ref) {
  final allProducts = ref.watch(productsProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final activeFilters = ref.watch(filtersProvider); 

  // Primeiro filtra por Categoria
  List<Product> products = allProducts;
  if (selectedCategory != null) {
    products = products.where((product) {
      return product.categories == selectedCategory;
    }).toList();
  }

  // depois filtrar por filtros setados 
  return products.where((product) {
    if (activeFilters[Filter.glutenFree]! && !product.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !product.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !product.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !product.isVegan) {
      return false;
    }
    return true;
  }).toList();
});

// Lógica de Favoritos
class FavoritesNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    return {}; 
  }

  void toggleFavorite(String productName) {
    if (state.contains(productName)) {
      state = {...state}..remove(productName);
    } else {
      state = {...state}..add(productName);
    }
  }
  
  bool isFavorite(String productName) => state.contains(productName);
}

final favoritesProvider = NotifierProvider<FavoritesNotifier, Set<String>>(() {
  return FavoritesNotifier();
});