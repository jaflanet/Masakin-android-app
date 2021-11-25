class Food {
  String imgUrl;
  String name;
  num price;
  num quantity;
  Food(this.imgUrl, this.name, this.price, this.quantity);

  static List<Food> generatedFood() {
    return [
      Food('assets/images/ayamBakar', 'Ayam Bakar', 20.000, 1),
      Food('assets/images/ayamGoreng', 'Ayam goreng', 16.000, 1),
      Food('assets/images/ayamBakar', 'Paket Ayam Bakar', 24.000, 1),
      Food('assets/images/ayamGoreng', 'Paket Ayam goreng', 22.000, 1),
    ];
  }
}
