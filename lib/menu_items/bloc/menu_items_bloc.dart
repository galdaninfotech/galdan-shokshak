import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../menu_items_repository.dart';
import '../models/models.dart';

part 'menu_items_event.dart';
part 'menu_items_state.dart';

class MenuItemsBloc extends Bloc<MenuItemsEvent, MenuItemsState> {
  final MenuItemsRepository _menuItemsRepository;
  StreamSubscription? _menuItemsSubscription;

  MenuItemsBloc({required MenuItemsRepository menuItemsRepository})
      : _menuItemsRepository = menuItemsRepository,
        super(MenuItemsLoading()) {
    on<LoadMenuItems>(_onLoadMenuItems);
    on<UpdateMenuItems>(_onUpdateMenuItems);
  }

  void _onLoadMenuItems(
    LoadMenuItems event,
    Emitter<MenuItemsState> emit,
  ) {
    _menuItemsSubscription?.cancel();
    _menuItemsSubscription = _menuItemsRepository.getAllMenuItems().listen(
          (menuItems) => add(
            UpdateMenuItems(menuItems),
          ),
        );
  }

  void _onUpdateMenuItems(
    UpdateMenuItems event,
    Emitter<MenuItemsState> emit,
  ) {
    emit(MenuItemsLoaded(menuItems: event.menuItems));
  }
}
