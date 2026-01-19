//widgete que cria o card de categorias que é usado na tela de categorias

import 'package:assicoffee_app/models/category.dart';
import 'package:flutter/material.dart';


class CategoriesCards extends StatelessWidget {
  final Category categories;
  final void Function() onSelctedCategory;

  const CategoriesCards({
    super.key,
    required this.categories,
    required this.onSelctedCategory,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            categories.cImageUrl,
            fit: BoxFit.cover,
            color: Colors.black.withValues(alpha: 0.5),
            colorBlendMode: BlendMode.darken,
            errorBuilder: (context, error, stackTrace) {
              return Container(color: colorScheme.surfaceContainer);
            },
          ),
          Center(
            child: Text(
              categories.title,
              style: textTheme.displayLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onSelctedCategory,
                splashColor: colorScheme.onPrimary.withValues(alpha: 0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
