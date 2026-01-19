//codigo que cria o botão de favoitar que é usado em diversos telas e widgets

import 'package:assicoffee_app/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({super.key, required this.productName});

  final String productName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  
    final favoriteList = ref.watch(favoritesProvider);
    final isFavorited = favoriteList.contains(productName);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return IconButton(
      icon: Icon(
        Icons.rocket_launch,
        color: isFavorited ? colorScheme.primary : Colors.grey,
      ),
      onPressed: () {
        ref.read(favoritesProvider.notifier).toggleFavorite(productName);
      },
    );
  }
}
