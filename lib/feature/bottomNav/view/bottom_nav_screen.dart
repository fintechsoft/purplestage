import 'package:purplestage/utils/core_export.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatefulWidget {
  final AddressModel ? previousAddress;
  final bool showServiceNotAvailableDialog;
  final int pageIndex;
  const  BottomNavScreen({super.key, required this.pageIndex, this.previousAddress, required this.showServiceNotAvailableDialog});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _pageIndex = 0;
  bool _canExit = GetPlatform.isWeb ? true : false;

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.pageIndex;

    if(_pageIndex==1){
      Get.find<BottomNavController>().changePage(BnbItem.collab);
    }else if(_pageIndex==2){
      Get.find<BottomNavController>().changePage(BnbItem.events);
    }
    else if(_pageIndex==3){
      Get.find<BottomNavController>().changePage(BnbItem.collabs);
    }else{
      Get.find<BottomNavController>().changePage(BnbItem.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn = Get.find<AuthController>().isLoggedIn();
    return CustomPopScopeWidget(
      canPop: ResponsiveHelper.isWeb() ? true : false,
      onPopInvoked: () {
        if (Get.find<BottomNavController>().currentPage.value != BnbItem.home) {
          Get.find<BottomNavController>().changePage(BnbItem.home);
        } else {
          if (_canExit) {
            if(!GetPlatform.isWeb) {
              exit(0);
            }
          } else {
            customSnackBar('back_press_again_to_exit'.tr, type : ToasterMessageType.info);
            _canExit = true;
            Timer(const Duration(seconds: 2), () {
              _canExit = false;
            });
          }
        }
      },

      child: Scaffold(
        floatingActionButton: ResponsiveHelper.isDesktop(context) ? null : InkWell(
          onTap: () {
            if (!isUserLoggedIn) {
              Get.toNamed(RouteHelper.getSignInRoute(fromPage: RouteHelper.home));
            } else {
              Get.toNamed(RouteHelper.eventList);
            }
          },
          child: Container(
            height: 70, width: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _pageIndex == 2 ? null : Get.isDarkMode ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
              gradient: _pageIndex == 2 ? const LinearGradient(
                colors: [Color(0xFFFBBB00), Color(0xFFFF833D)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ) : null,
            ),
            child: EventWidget(color: Get.isDarkMode ? Theme.of(context).primaryColorLight : Colors.white, size: 35),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,

        bottomNavigationBar: ResponsiveHelper.isDesktop(context) ? const SizedBox() :
        SafeArea(
          child: Container(
            height: ResponsiveHelper.isMobile(context) ?  75  : 80 + MediaQuery.of(context).padding.top,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
            color:Get.isDarkMode ? Theme.of(context).cardColor.withOpacity(.5) : Theme.of(context).primaryColor,
            child: Row(children: [
              _bnbItem(
                icon: Images.home, bnbItem: BnbItem.home, context: context,
                onTap: () => Get.find<BottomNavController>().changePage(BnbItem.home),
              ),
              _bnbItem(
                icon: Images.adminChat, bnbItem: BnbItem.collab, context: context,
                onTap: (){
                  if(Get.find<AuthController>().isLoggedIn()){
                    Get.toNamed(RouteHelper.getCreatePostScreen());
                  }else{
                    Get.toNamed(RouteHelper.getNotLoggedScreen(RouteHelper.home.tr,"create_post"));
                  }
                },
              ),
              _bnbItem(
                icon: '', bnbItem: BnbItem.events, context: context,
                onTap: () {
                  if (!isUserLoggedIn) {
                    Get.toNamed(RouteHelper.getSignInRoute(fromPage: RouteHelper.home));
                  } else {
                    Get.find<BottomNavController>().changePage(BnbItem.events);
                  }
                },
              ),
              // _bnbItem(
              //   icon: '', bnbItem: BnbItem.cart, context: context,
              //   onTap: () {
              //     if (!isUserLoggedIn) {
              //       Get.toNamed(RouteHelper.getSignInRoute(fromPage: RouteHelper.home));
              //     } else {
              //       Get.find<BottomNavController>().changePage(BnbItem.cart);
              //     }
              //   },
              // ),
              _bnbItem(
                icon: Images.bookings, bnbItem: BnbItem.collabs, context: context,
                onTap: () {
                  if (!isUserLoggedIn && Get.find<SplashController>().configModel.content?.guestCheckout == 1) {
                    Get.toNamed(RouteHelper.getTrackBookingRoute());
                  } else  if(!isUserLoggedIn){
                    Get.toNamed(RouteHelper.getNotLoggedScreen("booking","my_bookings"));
                  } else {
                    Get.find<BottomNavController>().changePage(BnbItem.collabs);
                  }
                },
              ),
              //
              // _bnbItem(
              //   icon: Images.offerMenu, bnbItem: BnbItem.offers, context: context,
              //   onTap: () => Get.find<BottomNavController>().changePage(BnbItem.offers),
              // ),

              _bnbItem(
                icon: Images.menu, bnbItem: BnbItem.more,context: context,
                onTap: () => Get.bottomSheet(const MenuScreen(),
                  backgroundColor: Colors.transparent, isScrollControlled: true,
                ),

              ),
            ]),
          ),
        ),

        body: Obx(() => _bottomNavigationView(widget.previousAddress, widget.showServiceNotAvailableDialog)),

      ),
    );
  }

  Widget _bnbItem({required String icon, required BnbItem bnbItem, required GestureTapCallback onTap, context}) {
    return Obx(() => Expanded(
      child: InkWell(
        onTap: bnbItem != BnbItem.events ? onTap : null,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
          icon.isEmpty ? const SizedBox(width: 20, height: 20) : Image.asset(icon, width: 20, height: 20,
            color: Get.find<BottomNavController>().currentPage.value == bnbItem ? Colors.white : Colors.white60,
          ),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          Text(bnbItem.name.tr,
            style: ubuntuRegular.copyWith( fontSize: Dimensions.fontSizeExtraSmall,
              color: Get.find<BottomNavController>().currentPage.value == bnbItem ? Colors.white : Colors.white60,
            ),textAlign: TextAlign.center,
          ),

        ]),
      ),
    ));
  }

  _bottomNavigationView(AddressModel? previousAddress, bool showServiceNotAvailableDialog) {
    PriceConverter.getCurrency();
    switch (Get.find<BottomNavController>().currentPage.value) {
      case BnbItem.home:
        return HomeScreen(addressModel: previousAddress, showServiceNotAvailableDialog: showServiceNotAvailableDialog,);
      case BnbItem.collab:
        if (!Get.find<AuthController>().isLoggedIn()) {
          break;
        } else {
          return const CreatePostScreen();
        }
      case BnbItem.events:
        if (!Get.find<AuthController>().isLoggedIn()) {
          break;
        } else {
          return Get.toNamed(RouteHelper.eventList);
        }
      // case BnbItem.offers:
      //   return const OfferScreen();
      case BnbItem.collabs:
        if (!Get.find<AuthController>().isLoggedIn()) {
          break;
        } else {
          return const BookingListScreen();
        }
      case BnbItem.more:
        break;
    }
  }
}

