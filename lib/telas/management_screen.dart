//cria a tela de gerenciamento (adicionar/remover items)

import 'package:assicoffee_app/providers/products_provider.dart';
import 'package:assicoffee_app/widgets/new_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManagementScreen extends ConsumerWidget {
  const ManagementScreen({super.key});

  // Função para abrir o Modal
  void _openAddModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => const NewItemForm(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Itens'),
        actions: [
          IconButton(
            onPressed: () => _openAddModal(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: products.isEmpty
          ? const Center(child: Text('Nenhum item cadastrado.'))
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                final product = products[index];

                return Dismissible(
                  // Set de key (nome + valor caso exista algum item com o mesmo nome)
                  key: ValueKey(product.name + product.price.toString()),
                  background: Container(
                    color: Theme.of(
                      context,
                    ).colorScheme.error.withValues(alpha: 0.75),
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  direction: DismissDirection
                      .endToStart, // deleta arastando da direita para a esquerda
                  onDismissed: (direction) {
                    // Remove do provider
                    ref.read(productsProvider.notifier).removeProduct(product);
                    
                    //apaga msg antiga caso tenha
                    ScaffoldMessenger.of(context).clearSnackBars();

                    //mensagem de feedback com botão de desfazer
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.name} removido.'),
                        duration: const Duration(
                          seconds: 4,
                        ),
                        action: SnackBarAction(
                          label: 'DESFAZER',
                          textColor: theme
                              .colorScheme
                              .primaryContainer, 
                          onPressed: () {
                            ref
                                .read(productsProvider.notifier)
                                .addProduct(product);//add o produto novamente
                          },
                        ),
                      ),
                    );
                  },
                  //card com o produto
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(product.imageUrl),
                        onBackgroundImageError: (exception, stackTrace) =>
                            const Icon(Icons.coffee),
                      ),
                      title: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(product.category.toUpperCase()),
                          const SizedBox(height: 4),
                          Text(
                            'DATA DE LANÇAMENTO:',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy').format(product.date),
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                      trailing: Text(
                        'R\$ ${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: theme.colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
