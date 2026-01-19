//cria o modal que é aberto no botao na tela de gerenciamento

import 'package:assicoffee_app/models/product.dart';
import 'package:assicoffee_app/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class NewItemForm extends ConsumerStatefulWidget {
  const NewItemForm({super.key});

  @override
  ConsumerState<NewItemForm> createState() => _NewItemFormState();
}

class _NewItemFormState extends ConsumerState<NewItemForm> {
  final _formKey = GlobalKey<FormState>();

  //inicialização das variaveis
  var _enteredName = '';
  var _enteredPrice = 1.0;
  var _enteredDescription = '';
  var _enteredImageUrl = '';
  Category _selectedCategory = Category.salgados;
  DateTime? _selectedDate;
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  // DatePicker
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  // Função salvar item
  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Validação data
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, escolha uma data.')),
        );
        return;
      }

      // Cria o novo produto
      final newProduct = Product(
        name: _enteredName,
        price: _enteredPrice,
        description: _enteredDescription,
        imageUrl: _enteredImageUrl,
        category: _selectedCategory.name,
        categories: _selectedCategory,
        date: _selectedDate!,
        isGlutenFree: _isGlutenFree,
        isLactoseFree: _isLactoseFree,
        isVegan: _isVegan,
        isVegetarian: _isVegetarian,
      );

      // Adiciona ao Provider de produtos
      ref.read(productsProvider.notifier).addProduct(newProduct);

      // Fecha ao finalizar
      if (context.mounted) Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Novo Item", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),

              // Campo nome do item
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Nome do Item'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return 'O nome deve ter pelo menos 2 caracteres.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Campo preço
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Preço (R\$)'),
                        prefixText: 'R\$ ',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            double.tryParse(value) == null ||
                            double.tryParse(value)! <= 0) {
                          return 'Insira um preço válido.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredPrice = double.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Campo categoria
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<Category>(
                      value: _selectedCategory,
                      decoration: const InputDecoration(
                        label: Text('Categoria'),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      ),
                      items: Category.values.map((category) {
                        String formattedName = category.name
                            .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(0)}')
                            .capitalize();
                        return DropdownMenuItem(
                          value: category,
                          child: Text(formattedName, overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 14,),

              // Campo Descrição
              TextFormField(
                decoration: const InputDecoration(label: Text('Descrição'),
                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                
                maxLines: 2,
                maxLength: 300,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira uma descrição.';
                  }
                  return null;
                },
                onSaved: (value) => _enteredDescription = value!,
              ),

              // Campo URL Imagem
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('URL da Imagem '),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                keyboardType: TextInputType.url,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira a url da imagem.';
                  }
                  return null;
                },
                onSaved: (value) => _enteredImageUrl = value ?? '',
              ),

              const SizedBox(height: 12),

              //Switchs para filtros
              const Divider(),
              Text("Características:", style: textTheme.titleMedium),

              _buildSwitch(
                title: 'Sem Glúten',
                value: _isGlutenFree,
                onChanged: (val) => setState(() => _isGlutenFree = val),
              ),
              _buildSwitch(
                title: 'Sem Lactose',
                value: _isLactoseFree,
                onChanged: (val) => setState(() => _isLactoseFree = val),
              ),
              _buildSwitch(
                title: 'Vegetariano',
                value: _isVegetarian,
                onChanged: (val) => setState(() => _isVegetarian = val),
              ),
              _buildSwitch(
                title: 'Vegano',
                value: _isVegan,
                onChanged: (val) => setState(() => _isVegan = val),
              ),

              const Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'Selecione a data'
                        : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                  ),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Botões salvar e cancelar
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: const Text('Salvar Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitch({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      contentPadding: EdgeInsets.zero,
      activeThumbColor: Theme.of(context).colorScheme.tertiary,
    );
  }
}

// Extensão para stranformar primeira letra em maiuscula e separar nomes de categoria ex: cafesQuente => Cafes Quentes
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
