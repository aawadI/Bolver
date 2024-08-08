import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../components/components.dart';
import '../riverpod/provider/main_provider.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainProvider);
    return state.isSearchLoading
        ? const ProductSearchShimmer()
        :  NewProductSearchBody(
                isSearchLoading: state.isSearchLoading,
                products: state.searchedProducts,
                brands: state.searchedBrands,
                shops: state.searchedShops,
                categories: state.searchedCategories,
                query: state.query.trim(),
              );
  }
}
