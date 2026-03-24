import 'package:get/get.dart';
import 'package:purplestage/feature/event/widgets/desktop_event_item.dart';
import 'package:purplestage/feature/event/widgets/event_list_view_desktop.dart';
import 'package:purplestage/utils/core_export.dart';

// class EventListview extends StatelessWidget {
//   const EventListview({super.key,});
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<EventController>(
//       builder: (eventController) {
//         return Padding(
//           padding: ResponsiveHelper.isWeb()? EdgeInsets.all(30.0):EdgeInsets.all(8.0),
//           child: Column(
//             children:[
//               eventController.eventDataList!.isNotEmpty ?
//               Expanded(
//                 child: RefreshIndicator(
//                   color: Theme.of(context).primaryColorLight,
//                   backgroundColor: Theme.of(context).cardColor,
//                   onRefresh: () async {
//                     Get.find<EventController>().getEventList(1);
//                   },
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: const AlwaysScrollableScrollPhysics(
//                       parent: ClampingScrollPhysics()
//                     ),
//                     controller: eventController.scrollController,
//                     itemCount: eventController.eventDataList?.length,
//                     padding: EdgeInsets.only(bottom: eventController.isLoading ? 0 :  Dimensions.paddingSizeLarge * 3),
//                     itemBuilder: (ctx,index)=> EventItem(
//                         eventData : eventController.eventDataList![index]
//                     ),
//                   ),
//                 ),
//               ): const SizedBox.shrink(),
//
//               eventController.isLoading ? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink()
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
class EventListview extends StatelessWidget {
  const EventListview({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<EventController>(
      builder: (eventController) {
        final events = eventController.eventDataList ?? [];
        return Padding(
          padding: ResponsiveHelper.isWeb() ? const EdgeInsets.all(30.0) : const EdgeInsets.all(8.0),
          child: Column(
            children: [
              events.isNotEmpty
                  ? Expanded(
                child: RefreshIndicator(
                  color: Theme.of(context).primaryColorLight,
                  backgroundColor: Theme.of(context).cardColor,
                  onRefresh: () async {
                    await Get.find<EventController>().getEventList(1);
                  },
                  child: ResponsiveHelper.isDesktop(context)
                      ? EventListViewDesktop(events: eventController.eventDataList!)
                      : ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: ClampingScrollPhysics(),
                    ),
                    controller: eventController.scrollController,
                    itemCount: events.length,
                    padding: EdgeInsets.only(
                      bottom: eventController.isLoading ? 0 : Dimensions.paddingSizeLarge * 3,
                    ),
                    itemBuilder: (ctx, index) => EventItem(
                      eventData: events[index],
                    ),
                  ),
                ),
              )
                  : const SizedBox.shrink(),

              eventController.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
