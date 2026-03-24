import 'package:purplestage/feature/search/model/provider_suggestion_model.dart';
import 'package:purplestage/utils/core_export.dart';
import 'package:purplestage/feature/search/model/search_suggestion_model.dart';
import 'package:get/get.dart';

class RealTimeSearchSuggestion extends StatelessWidget {
  final List<SearchSuggestion>  suggestionList;
  const RealTimeSearchSuggestion({super.key, required this.suggestionList});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllSearchController>(
      builder: (searchController) {

        final searchQuery =
        searchController.searchController.text.trim().toLowerCase();
        /// 🔎 Filter suggestions based on search text
        final filteredList = suggestionList.where((item) {
          final name = item.name?.toLowerCase() ?? "";
          return searchQuery.isEmpty || name.contains(searchQuery);
        }).toList();

        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 240),
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: filteredList.length,

            itemBuilder: (context, index) {

              final item = filteredList[index].name ?? "";

              return ListTile(
                visualDensity: VisualDensity.compact,
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,

                leading: filteredList[index].isSearched == 1
                    ? Icon(Icons.refresh,
                    color: Theme.of(context).hintColor, size: 18)
                    : Image.asset(
                  Images.searchIcon,
                  color: Theme.of(context).hintColor,
                  width: 18,
                ),

                title: Text(
                  item,
                  style: ubuntuRegular.copyWith(
                      fontSize: Dimensions.fontSizeDefault),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                trailing:
                const Icon(Icons.north_west_rounded, size: 18),

                onTap: () {
                  Get.back();
                  FocusScope.of(context).unfocus();
                  searchController.populatedSearchController(item);
                  Get.toNamed(
                    RouteHelper.getSearchResultRoute(queryText: item),
                  );
                },
              );
            },

            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeExtraSmall),
                child: Divider(
                  height: 0.5,
                  color: Theme.of(context)
                      .hintColor
                      .withOpacity(0.5),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class RealTimeProviderSuggestion extends StatelessWidget {
  final List<ProviderSuggestion>  suggestionList;
  const RealTimeProviderSuggestion({super.key, required this.suggestionList});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllSearchController>(
      builder: (searchController) {
        final searchQuery =
        searchController.searchController.text.trim().toLowerCase();
        /// 🔎 Filter suggestions based on search text
        final filteredList = suggestionList.where((item) {
          final name = item.name?.toLowerCase() ?? "";
          return searchQuery.isEmpty || name.contains(searchQuery);
        }).toList();

        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 240),
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: filteredList.length,

            itemBuilder: (context, index) {

              final item = filteredList[index].name ?? "";
              final itemid = filteredList[index].providerid ?? "";
              return ListTile(
                visualDensity: VisualDensity.compact,
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,

                leading: filteredList[index].isSearched == 1
                    ? Icon(Icons.refresh,
                    color: Theme.of(context).hintColor, size: 18)
                    : Image.asset(
                  Images.searchIcon,
                  color: Theme.of(context).hintColor,
                  width: 18,
                ),

                title: Text(
                  item,
                  style: ubuntuRegular.copyWith(
                      fontSize: Dimensions.fontSizeDefault),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                trailing:
                const Icon(Icons.north_west_rounded, size: 18),

                onTap: () {
                  Get.back();
                  FocusScope.of(context).unfocus();
                  searchController.populatedSearchController(item);
                  Get.toNamed(
                    RouteHelper.getProviderResultRoute(queryText: itemid),
                  );
                },
              );
            },

            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeExtraSmall),
                child: Divider(
                  height: 0.5,
                  color: Theme.of(context)
                      .hintColor
                      .withOpacity(0.5),
                ),
              );
            },
          ),
        );
      },
    );
  }
}