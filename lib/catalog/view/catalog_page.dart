import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/bloc/app_bloc.dart';
import '../../app/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../../app/custom_drawer_bar/custom_drawer.dart';
import '../../cart/cart.dart';
import '../../catalog/catalog.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});
  static Page<void> page() => MaterialPage<void>(child: CatalogPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Home'),
        // automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutRequested());
            },
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Badge(
                  label: Text('5'),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CartPage()));
                    },
                  ),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert),
              )),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // const CatalogAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          BlocBuilder<CatalogBloc, CatalogState>(
            builder: (context, state) {
              return switch (state) {
                CatalogLoading() => const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                CatalogError() => const SliverFillRemaining(
                    child: Text('Something went wrong!'),
                  ),
                CatalogLoaded() => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => CatalogListItem(
                        state.catalog.getByPosition(index),
                      ),
                      childCount: state.catalog.itemNames.length,
                    ),
                  )
              };
            },
          ),
        ],
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({required this.item, super.key});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return switch (state) {
          CartLoading() => const CircularProgressIndicator(),
          CartError() => const Text('Something went wrong!'),
          CartLoaded() => Builder(
              builder: (context) {
                final isInCart = state.cart.items.contains(item);
                return TextButton(
                  style: TextButton.styleFrom(
                    disabledForegroundColor: theme.primaryColor,
                  ),
                  onPressed: isInCart
                      ? null
                      : () => context.read<CartBloc>().add(CartItemAdded(item)),
                  child: isInCart
                      ? const Icon(Icons.check, semanticLabel: 'ADDED')
                      : const Text('ADD'),
                );
              },
            )
        };
      },
    );
  }
}

class CatalogAppBar extends StatelessWidget {
  const CatalogAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('Catalog'),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.of(context).pushNamed('/cart'),
        ),
      ],
    );
  }
}

class CatalogListItem extends StatelessWidget {
  const CatalogListItem(this.item, {super.key});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleLarge;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(aspectRatio: 1, child: ColoredBox(color: item.color)),
            const SizedBox(width: 24),
            Expanded(child: Text(item.name, style: textTheme)),
            const SizedBox(width: 24),
            AddButton(item: item),
          ],
        ),
      ),
    );
  }
}
