import 'package:purplestage/utils/core_export.dart';
import 'package:purplestage/feature/search/widget/realtime_search_suggestion.dart';
import 'package:purplestage/feature/search/widget/recommended_search.dart';
import 'package:get/get.dart';

class SearchSuggestionDialog extends StatelessWidget {
  const SearchSuggestionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllSearchController>(builder: (searchController){
      return Container(
        margin: EdgeInsets.only(top: ResponsiveHelper.isDesktop(context) ? 0 : 72),
        padding: const EdgeInsets.symmetric(horizontal:Dimensions.paddingSizeDefault),
        alignment: Alignment.topCenter,
        child: Column( mainAxisSize: MainAxisSize.min, children: [
          ResponsiveHelper.isDesktop(context) ? const WebMenuBar(openSearchDialog: false,) : const SearchInputBoxApp(),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall + 2,),
          SizedBox(
            width: Dimensions.webMaxWidth,
            child: Material(
              borderRadius: ResponsiveHelper.isDesktop(context)
                  ? const BorderRadius.vertical(bottom: Radius.circular(Dimensions.radiusDefault),)
                  : BorderRadius.circular(Dimensions.radiusDefault),

              color: Theme.of(context).cardColor,
              child: Padding(
                padding:  const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: searchController.searchController.text.isNotEmpty
                    ? _SearchResults(searchController: searchController) : const Column( children: [
                  RecentSearch(),
                  SizedBox(height: Dimensions.paddingSizeLarge,),
                  RecommendedSearch()
                ]),
              ),
            ),
          ),

        ]),
      );
    });
  }
}
class _SearchResults extends StatelessWidget {
  final AllSearchController searchController;
  const _SearchResults({required this.searchController});

  @override
  Widget build(BuildContext context) {
    final bool hasServices =
        searchController.searchSuggestionModel != null &&
            searchController.searchSuggestionList.isNotEmpty;
    print("services is ${hasServices}");
    final bool hasProviders = searchController.providerSuggestionModel != null &&
        searchController.providerSuggestionList.isNotEmpty;
    print("Providers is ${hasProviders}");
    if (!hasServices && !hasProviders) {
      return const SizedBox(
        height: 120,
        child: Center(child: Text("No results found")),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ================= SERVICES =================
        const SizedBox(height: 12),
        Text(
          "Services",
          style: ubuntuMedium.copyWith(
            fontSize: Dimensions.fontSizeDefault,
          ),
        ),
        const SizedBox(height: 8),
        if (hasServices) ...[
          RealTimeSearchSuggestion(
            suggestionList: searchController.searchSuggestionList,
          ),
        ],
        const SizedBox(height: 12),
        Text(
          "Providers",
          style: ubuntuMedium.copyWith(
            fontSize: Dimensions.fontSizeDefault,
          ),
        ),
        const SizedBox(height: 8),
        if (hasProviders) ...[
          RealTimeProviderSuggestion(
            suggestionList: searchController.providerSuggestionList,
          ),
        ],
        /// ================= PROVIDERS =================
        // if (hasProviders) ...[
        //   const SizedBox(height: 12),
        //   Text(
        //     "Providers",
        //     style: ubuntuMedium.copyWith(
        //       fontSize: Dimensions.fontSizeDefault,
        //     ),
        //   ),
        //   const SizedBox(height: 8),
        //   ...searchController.providerSuggestions.map((provider) {
        //     return ListTile(
        //       contentPadding: EdgeInsets.zero,
        //       leading: ClipRRect(
        //         borderRadius: BorderRadius.circular(8),
        //         child: Image.network(
        //           provider.logoFullPath ?? "",
        //           height: 36,
        //           width: 36,
        //           fit: BoxFit.cover,
        //           errorBuilder: (_, __, ___) =>
        //           const Icon(Icons.business),
        //         ),
        //       ),
        //
        //       title: Text(
        //         provider.companyName ?? "",
        //         maxLines: 1,
        //         overflow: TextOverflow.ellipsis,
        //       ),
        //
        //       subtitle: Text(
        //         provider.companyAddress ?? "",
        //         maxLines: 1,
        //         overflow: TextOverflow.ellipsis,
        //       ),
        //
        //       onTap: () {
        //         Get.back();
        //         Get.toNamed(RouteHelper.getProviderDetails(provider.id!));
        //       },
        //     );
        //   }),
        // ],
      ],
    );
  }
}
