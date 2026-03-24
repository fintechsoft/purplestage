import 'package:get/get.dart';
import 'package:purplestage/utils/core_export.dart';

class EventItem extends StatelessWidget {
  final EventData eventData;
  const EventItem({
    super.key, required this.eventData,});

 // @override
  // Widget build(BuildContext context) {
  //   return GetBuilder<EventController>(builder: (eventController){
  //     return Container(
  //       decoration: BoxDecoration(
  //         color: Theme.of(context).cardColor.withOpacity(Get.isDarkMode?0.5:1),
  //         borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
  //         boxShadow: Get.find<ThemeController>().darkTheme ? null : lightShadow,
  //       ),
  //       margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeExtraSmall),
  //       child: Column(crossAxisAlignment: CrossAxisAlignment.start , children: [
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault,
  //             Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault, Dimensions.paddingSizeExtraSmall+3,
  //           ),
  //           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween , crossAxisAlignment: CrossAxisAlignment.start, children: [ Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Text("Event",
  //                       style: ubuntuMedium.copyWith(
  //                         fontSize: Dimensions.fontSizeLarge,
  //                         color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(0.7),
  //                       ),
  //                     ),
  //                     Text(" : ${eventData.eventName}",
  //                       style: ubuntuBold.copyWith(
  //                         color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.8),
  //                         fontSize: Dimensions.fontSizeLarge,
  //                       ),
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                     const SizedBox(width: Dimensions.paddingSizeDefault,),
  //                   ],
  //                 ),
  //                 const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
  //               ],
  //             ),),
  //           ],
  //           ),
  //         ),
  //
  //         Container(height: 2,width: double.infinity,
  //           decoration: BoxDecoration(
  //             color: Theme.of(context).primaryColor.withOpacity(0.1),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault,
  //             Dimensions.paddingSizeExtraSmall, Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault,
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Expanded(
  //                 child: Column(children: [
  //                   Row(
  //                     children: [
  //                       Text("${'Event Id '}: ",
  //                           style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall,   color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.6))
  //                       ),
  //                       Text("# ${eventData.readableId!}",
  //                         style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall,   color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.6)),
  //                         textDirection: TextDirection.ltr,
  //                         maxLines: 1,
  //                         overflow: TextOverflow.ellipsis,
  //                       )
  //                     ],
  //                   ),
  //                   const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
  //                   Row(
  //                     children: [
  //                       Text("${'Event Created '}: ",
  //                           style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall,   color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.6))
  //                       ),
  //                       Text(" ${DateConverter.isoStringToLocalDateOnly(eventData.createdAt!)}",
  //                         style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall,   color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.6)),
  //                         textDirection: TextDirection.ltr,
  //                         maxLines: 1,
  //                         overflow: TextOverflow.ellipsis,
  //                       )
  //                     ],
  //                   ),
  //                   const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
  //                   Row(
  //                     children: [
  //                       Text("Event Date: ",
  //                         style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall ,  color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.6)),
  //                       ),
  //                       Text("${DateConverter.stringToLocalDateOnly(eventData.eventTime??"")}",
  //                         style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall ,  color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.6)),
  //                         textDirection: TextDirection.ltr,
  //                         maxLines: 1,
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                     ],
  //                   ),
  //                 ],),
  //               ),
  //               InkWell(
  //                 onTap: () => Get.to(()=>EventDetailsScreen(id: eventData.id ?? "",eventDataDetails: eventData,)),
  //                 child: Container(
  //                   margin: const EdgeInsets.only(top: Dimensions.paddingSizeExtraSmall),
  //                   padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeExtraSmall),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
  //                     color: Theme.of(context).primaryColor.withOpacity(0.1),
  //                   ),
  //                   child: Icon(Icons.arrow_forward_rounded, color: Theme.of(context).primaryColor.withOpacity(0.6),),
  //                 ),
  //               )
  //             ],
  //           ),
  //         )
  //       ],),
  //     );
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(()=>EventDetailsScreen(id: eventData.id ?? "",eventDataDetails: eventData,)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Event Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                eventData.eventPosterFullPath ?? "",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 90,
                  height: 90,
                  color: Colors.grey[300],
                  child: Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Event Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Event : ${eventData.eventName ?? ""}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(height: 4),
                  Text('Date  : ${DateConverter.stringToLocalDateOnly(eventData.eventTime ?? "")}'),
                  Text('Time  : ${DateConverter.stringToLocalTimeOnly(eventData.eventTime ?? "")}'),
                  Text('Venue : ${eventData.venue ?? "-"}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
