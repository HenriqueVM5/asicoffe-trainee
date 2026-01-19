//widget que cria o drawer lateral que é usado em tabsScreen

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Drawer(
      backgroundColor: colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary,
                  colorScheme.primary.withValues(alpha: 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.coffee, size: 48, color: colorScheme.onSurface),
                const SizedBox(width: 18),
                Text(
                  'AsiCoffee',
                  style: textTheme.displayLarge?.copyWith(
                    color: colorScheme.onPrimary,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),

          // Home
          ListTile(
            leading: Icon(
              Icons.storefront,
              size: 26,
              color: colorScheme.onSurface,
            ),
            title: Text(
              "Cardápio",
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectScreen('home');
            },
          ),

          //  Filtros
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: colorScheme.onSurface,
            ),
            title: Text(
              "Filtros",
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),

          // Gerenciamento
          ListTile(
            leading: Icon(
              Icons.edit_note, 
              size: 26,
              color: colorScheme.onSurface,
            ),
            title: Text(
              "Gerenciar",
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectScreen('management'); 
            },
          ),
        ],
      ),
    );
  }
}
