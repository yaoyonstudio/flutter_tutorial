class MyItem {
  List<String> items;

  MyItem(this.items);

  void addItem(String item) {
    this.items.add(item);
  }

  void deleteItem() {
    if (this.items.length > 0) {
      this.items.removeLast();
    }
  }
}