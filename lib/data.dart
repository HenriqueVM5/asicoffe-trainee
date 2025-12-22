//definiçao da classe produto e lookup table com dados do produto
class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String category;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
  });
}

// Lista de produtos
final List<Product> menuItems = [
  Product(
    name: "AsiEspresso",
    price: 5.50,
    imageUrl: "https://media.gettyimages.com/id/1358132613/pt/foto/refreshing-hot-cup-of-coffee-at-a-cafe.jpg?s=612x612&w=0&k=20&c=WKpHlQgbszfYvHw0LJYIAeMId-_GaEV2TBORw69-bRE=",
    category: "Bebidas Quentes",
  ),
  Product(
    name: "Cappuccino",
    price: 9.90,
    imageUrl: "https://media.gettyimages.com/id/1035061554/pt/foto/a-cup-of-latte-on-wooden-table.jpg?s=612x612&w=0&k=20&c=FWHOT_IhxXlOdOwN0qzZqGCHB2OLp-cj61s3REMROu0=",
    category: "Bebidas Quentes",
  ),
  Product(
    name: "Limonada",
    price: 12.00,
    imageUrl: "https://media.gettyimages.com/id/1404999158/pt/foto/lemonade.jpg?s=612x612&w=0&k=20&c=OHx2DwWw8Rr4wATgQ68kbVwImjKdyU2ujrfDPiQhyjw=",
    category: "Sucos",
  ),
  Product(
    name: "Laranjada",
    price: 12.00,
    imageUrl: "https://media.gettyimages.com/id/1282705707/pt/foto/delicious-freshly-squeezed-orange-juice-from-organic-oranges-from-the-own-tree.jpg?s=612x612&w=0&k=20&c=nWPliQXpKtA28eEI5ybRFwHpo0jStBpITAeaf284Wx0=",
    category: "sucos",
  ),
  Product(
    name: "Coxinha de frango",
    price: 8.00,
    imageUrl: "https://media.gettyimages.com/id/92571149/pt/foto/coxinha.jpg?s=612x612&w=0&k=20&c=ybNLiB7olBJ8OmN0qlKKPXIhRBExUb5_2wMSYNlKmqE=",
    category: "Salgados",
  ),
  Product(
    name: "Croissant de queijo",
    price: 9.50,
    imageUrl: "https://media.gettyimages.com/id/1608077733/pt/foto/plain-croissant.jpg?s=612x612&w=0&k=20&c=Wmloia8xQp0TnS86nlvt_j9NOBnWsyf3uTIbM8ue4Pw=",
    category: "Salgado",
  ),
  Product(
    name: "Bolo de Chocolate",
    price: 14.50,
    imageUrl: "https://media.gettyimages.com/id/155598375/pt/foto/sobremesas-de-bolo-de-chocolate.jpg?s=612x612&w=0&k=20&c=N2DjyjUdop8PoAkz9IwdQ8n7xJgf9VLEYBFJgKmwVJI=",
    category: "Doces",
  ),
  Product(
    name: "Coca cola lata",
    price: 7.00,
    imageUrl: "https://media.gettyimages.com/id/1916912351/pt/foto/filling-soft-drink-into-a-glass.jpg?s=612x612&w=0&k=20&c=0jBk9SLyKdJD6LJ80YFeldaRNLndDz1phVaRW6SLi-g=",
    category: "Refrigerantes",
  ),
  Product(
    name: "Pão de Queijo",
    price: 6.50,
    imageUrl: "https://media.gettyimages.com/id/1281852174/pt/foto/chipa-is-a-brazilian-argentineansnack-cheese-bread-pao-de-queijo.jpg?s=612x612&w=0&k=20&c=r59zDbVNGGsvv65Q9gRD8ykDeae7LedW093rsgHlHak=",
    category: "Salgados",
  ),
  Product(
    name: "AsiCookie",
    price: 10.00,
    imageUrl: "https://media.gettyimages.com/id/905563616/pt/foto/preparing-chocolate-chip-cookies.jpg?s=612x612&w=0&k=20&c=-XYuxVs041wykcsj8P7J_q4bli7MxEYjJ-ZCNxoyv-s=",
    category: "Doces",
  ),
];