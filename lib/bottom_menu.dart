class BottomMenu {

  String icon;
  String title;

  BottomMenu(this.icon, this.title);

  Map toJson() => {'value': icon, 'title': title};
}
