part of 'menu_items_bloc.dart';

sealed class MenuItemsEvent extends Equatable {
  const MenuItemsEvent();

  @override
  List<Object> get props => [];
}

class LoadMenuItems extends MenuItemsEvent {}

class UpdateMenuItems extends MenuItemsEvent {
  final List<MenuItems> menuItems;

  UpdateMenuItems(this.menuItems);

  @override
  List<Object> get props => [menuItems];
}


