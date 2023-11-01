part of 'menu_items_bloc.dart';

sealed class MenuItemsState extends Equatable {
  const MenuItemsState();
  
  @override
  List<Object> get props => [];
}

final class MenuItemsLoading extends MenuItemsState {}

final class MenuItemsLoaded extends MenuItemsState {
  final List<MenuItems> menuItems;

  MenuItemsLoaded({this.menuItems = const <MenuItems>[]});

  @override
  List<Object> get props => [menuItems];
}

