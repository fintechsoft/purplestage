import 'package:purplestage/feature/provider/widgets/provider_details_shimmer.dart';
import 'package:purplestage/utils/core_export.dart';
import 'package:get/get.dart';


class ProviderDetailsScreen extends StatefulWidget {
  final String providerId;
  const ProviderDetailsScreen({super.key,required this.providerId}) ;

  @override
  ProviderDetailsScreenState createState() => ProviderDetailsScreenState();
}

class ProviderDetailsScreenState extends State<ProviderDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    Get.find<ProviderBookingController>().getProviderDetailsData(widget.providerId, true).then((value){
      tabController = TabController(length: Get.find<ProviderBookingController>().categoryItemList.length, vsync: this);
      Get.find<CartController>().updatePreselectedProvider(
          null
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  void _shareProvider() {
    final String url =
        "https://purplestage.in/provider-details?id=${widget.providerId}"; // 👈 change

    final String text =
        "Check out this Artist Profile:\n$url";
    Share.share(text);
  }

  Widget _shareButton(BuildContext context) {
    return InkWell(
      onTap: _shareProvider,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Colors.black.withOpacity(0.15),
            ),
          ],
        ),
        child: Icon(
          Icons.share,
          size: 20,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ResponsiveHelper.isDesktop(context)
          ? const MenuDrawer()
          : null,
      appBar: CustomAppBar(title: "provider_details".tr, showCart: true),
      body: Center(
        child: GetBuilder<ProviderBookingController>(
          builder: (providerBookingController) {
            /// ================= LOADED =================
            if (providerBookingController.providerDetailsContent != null) {
              /// build subcategory string
              List<String> subcategory = [];
              providerBookingController.providerDetailsContent?.subCategories
                  ?.forEach((element) {
                subcategory.add(element.name ?? "");
              });
              String subcategories =
              subcategory.join(', ').replaceAll('&', ' and ');
              /// ================= NO CATEGORY =================
              if (providerBookingController.categoryItemList.isEmpty) {
                return Column(
                  children: [
                    /// availability banner
                    if (providerBookingController
                        .providerDetailsContent
                        ?.provider
                        ?.serviceAvailability ==
                        0)
                      Container(
                        width: Dimensions.webMaxWidth,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .error
                              .withOpacity(0.1),
                          border: Border(
                            bottom: BorderSide(
                                color:
                                Theme.of(context).colorScheme.error),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: Dimensions.paddingSizeDefault,
                          horizontal: Dimensions.paddingSizeLarge,
                        ),
                        child: Center(
                          child: Text(
                            'provider_is_currently_unavailable'.tr,
                            style: ubuntuMedium,
                          ),
                        ),
                      ),

                    /// ========= TOP CARD WITH SHARE =========
                    SizedBox(
                      width: Dimensions.webMaxWidth,
                      child: Stack(
                        children: [
                          ProviderDetailsTopCard(
                            isAppbar: false,
                            subcategories: subcategories,
                            providerId: widget.providerId,
                          ),
                          Positioned(
                            top: 16,
                            right: 16,
                            child: _shareButton(context),
                          ),
                        ],
                      ),
                    ),
                    /// empty content
                    Expanded(
                      child: SizedBox(
                        width: Dimensions.webMaxWidth,
                        child: Center(
                          child: Text(
                              'no_subscribed_subcategories_available'.tr),
                        ),
                      ),
                    ),
                  ],
                );
              }
              /// ================= WITH CATEGORY =================
              return SingleChildScrollView(
                child: Column(
                  children: [
                    /// availability banner
                    if (providerBookingController
                        .providerDetailsContent
                        ?.provider
                        ?.serviceAvailability ==
                        0)
                      SizedBox(
                        width: Dimensions.webMaxWidth,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .error
                                .withOpacity(0.1),
                            border: Border(
                              bottom: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .error),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.paddingSizeDefault,
                            horizontal: Dimensions.paddingSizeDefault,
                          ),
                          child: Center(
                            child: Text(
                              'provider_is_currently_unavailable'.tr,
                              style: ubuntuMedium,
                            ),
                          ),
                        ),
                      ),
                    /// ========= TAB VIEW =========
                    SizedBox(
                      height: Get.height * 0.9,
                      width: Dimensions.webMaxWidth,
                      child: VerticalScrollableTabView(
                        tabController: tabController,
                        listItemData:
                        providerBookingController.categoryItemList,
                        verticalScrollPosition:
                        VerticalScrollPosition.begin,

                        eachItemChild: (object, index) => CategorySection(
                          category: object as CategoryModelItem,
                          providerData:
                          providerBookingController
                              .providerDetailsContent?.provider,
                        ),

                        slivers: [

                          /// ========= SLIVER APP BAR =========
                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            backgroundColor: Get.isDarkMode
                                ? null
                                : Theme.of(context).cardColor,
                            pinned: true,
                            leading: const SizedBox(),
                            elevation: 0,
                            toolbarHeight: 360,

                            flexibleSpace: Stack(
                              children: [

                                ProviderDetailsTopCard(
                                  subcategories: subcategories,
                                  providerId: widget.providerId,
                                ),

                                Positioned(
                                  top: 70,
                                  right: 20,
                                  child: _shareButton(context),
                                ),
                              ],
                            ),

                            bottom: TabBar(
                              isScrollable: true,
                              controller: tabController,
                              indicatorPadding:
                              const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              indicatorColor: Get.isDarkMode
                                  ? Colors.white70
                                  : Theme.of(context).primaryColor,
                              labelColor: Get.isDarkMode
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              unselectedLabelColor: Colors.grey,
                              padding:
                              const EdgeInsets.only(bottom: 10),
                              indicatorWeight: 3.0,
                              tabs: providerBookingController
                                  .categoryItemList
                                  .map((e) => Tab(text: e.title))
                                  .toList(),
                              onTap: (index) {
                                VerticalScrollableTabBarStatus.setIndex(
                                    index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (ResponsiveHelper.isDesktop(context))
                      const FooterView(),
                  ],
                ),
              );
            }

            /// ================= LOADING =================
            return const FooterBaseView(
                child: ProviderDetailsShimmer());
          },
        ),
      ),
    );
  }

}