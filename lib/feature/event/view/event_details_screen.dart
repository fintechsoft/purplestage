import 'package:purplestage/utils/core_export.dart';
import 'package:get/get.dart';

class EventDetailsScreen extends StatefulWidget {
  final String? id;
  final String? fromNotification;
  final EventData eventDataDetails;

  const EventDetailsScreen({
    super.key,
    required this.id,
    this.fromNotification = "",
    required this.eventDataDetails,
  });

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  // EventData? eventdata;
  @override
  void initState() {
    Get.find<EventController>().setEventData(widget.eventDataDetails);
    // eventdata=widget.eventDataDetails;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
      builder: (eventController) {
        return SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(
              title: "Event Details",
              onBackPressed: () {
                if (widget.fromNotification == "fromNotification") {
                  Get.offAllNamed(RouteHelper.getInitialRoute());
                } else if (Navigator.canPop(context)) {
                  Get.back();
                }
              },
            ),
            // body: eventController.eventData == null
              body: eventController.eventData == null
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Padding(
                padding: ResponsiveHelper.isWeb()? EdgeInsets.all(30.0):EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                    _buildPosterImage(eventController),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        boxShadow: cardShadow,
                      ),
                      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildEventHeader(eventController),
                          const SizedBox(height: Dimensions.paddingSizeDefault),
                          Divider(
                            height: 0.5,
                            color: Theme.of(context).hintColor.withOpacity(0.5),
                          ),
                          const SizedBox(height: Dimensions.paddingSizeDefault),
                          _buildBookingItems(eventController),
                        ],
                      ),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                    _buildServiceInfo(eventController),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                    _buildPosterInfo(eventController),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEventHeader(EventController eventController) {
    String? status = eventController.eventData?.bookingStatus;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Event Id :' + " #${eventController.eventData?.readableId}",
                overflow: TextOverflow.ellipsis,
                style: ubuntuBold.copyWith(
                  fontSize: Dimensions.fontSizeLarge,
                  color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.9),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            // Row(
            //   children: [
            //     Container(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: Dimensions.paddingSizeDefault,
            //         vertical: Dimensions.paddingSizeExtraSmall,
            //       ),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(50),
            //         color: Get.isDarkMode
            //             ? Colors.grey.withOpacity(0.2)
            //             : Colors.grey,
            //       ),
            //       child: Center(
            //         child: Text(
            //           "${eventController.eventData?.bookingStatus}".tr,
            //           style: ubuntuMedium.copyWith(
            //             fontWeight: FontWeight.w500,
            //             fontSize: 12,
            //             color: Get.isDarkMode
            //                 ? Theme.of(context).primaryColorLight
            //                 : Theme.of(context).primaryColorDark,
            //           ),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: Dimensions.paddingSizeExtraSmall),
            //   ],
            // ),
          ],
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        Divider(
          height: 0.5,
          color: Theme.of(context).hintColor.withOpacity(0.5),
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text("${eventController.eventData?.eventName}",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 5,
                style: ubuntuBold.copyWith(
                  fontSize: Dimensions.fontSizeDefault,
                  color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.9),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBookingItems(EventController eventController) {
    return Column(
      children: [
        BookingItem(
          img: Images.iconCalendar,
          title: 'Event Created : ',
          date: DateConverter.isoStringToLocalDateOnly(eventController.eventData?.createdAt ?? ""),
        ),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall + 2),
        BookingItem(
          img: Images.iconCalendar,
          title: 'Event Date : ',
          date: eventController.eventData?.eventTime ?? "",
        ),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall + 2),
        BookingItem(
          img: Images.offlinePayment,
          title: 'Event Fees : ',
          date: eventController.eventData?.isPaid == 1 ? "Paid" : "Free",
        ),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall + 2),
        BookingItem(
          img: Images.adminPlaceHolder,
          title: 'Organiser : ',
          date: eventController.eventData?.institutionName?? "",
        ),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall + 2),
        BookingItem(
          img: Images.customerCare,
          title: 'Contact Details : ',
          date: eventController.eventData?.contactNo?? "",
        ),
      ],
    );
  }

  Widget _buildServiceInfo(EventController eventController) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: cardShadow,
      ),
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("description".tr.replaceAll(":", ""), style: ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeDefault)),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          Text(
            "${eventController.eventData?.eventDescription}",
            style: ubuntuRegular.copyWith(color: Theme.of(context).hintColor),
            textAlign: TextAlign.justify,
            maxLines: 100,
          ),
        ],
      ),
    );
  }
  Widget _buildPosterImage(EventController eventController) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: cardShadow,
      ),
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
              color: Theme.of(context).hintColor.withOpacity(0.1),
              border: Border.all(
                color: Theme.of(context).hintColor.withOpacity(0.2),
              ),
            ),
            padding: const EdgeInsets.only(bottom: 25),
            child: CustomImage(
              image: eventController.eventData!.eventPosterFullPath,
              fit: BoxFit.cover,
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildPosterInfo(EventController eventController) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: cardShadow,
      ),
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Poster Description", style: ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeDefault)),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          Text(
            "${eventController.eventData?.posterDescription}",
            style: ubuntuRegular.copyWith(color: Theme.of(context).hintColor),
            textAlign: TextAlign.justify,
            maxLines: 100,
          ),
        ],
      ),
    );
  }

}


class EventDetailsEmptyScreen extends StatelessWidget {
  final String eventId;
  const EventDetailsEmptyScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
      Image.asset(Images.notAvailableIcon, height: Get.height * 0.1, color: Theme.of(context).primaryColor,),
      const SizedBox(height: Dimensions.paddingSizeLarge,),
      Text("information_not_found".tr, style: ubuntuRegular,),
      const SizedBox(height: Dimensions.paddingSizeLarge,),
      CustomButton(
        height: 35, width: 120, radius: Dimensions.radiusExtraLarge,
        buttonText: "go_back".tr,
        onPressed: () async {
        // await Get.find<EventController>().removeEventItemFromList(eventId, shouldUpdate: true);
        Get.back();
      },)

    ],),);
  }
}
