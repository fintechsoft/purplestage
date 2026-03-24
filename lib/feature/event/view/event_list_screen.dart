// import 'package:get/get.dart';
// import 'package:purplestage/utils/core_export.dart';
//
// class EventListScreen extends StatefulWidget {
//   const EventListScreen({super.key});
//   @override
//   State<EventListScreen> createState() => _EventListScreenState();
// }
//
// class _EventListScreenState extends State<EventListScreen>{
//
//   bool? isDataAvailable;
//
//   @override
//   void initState() {
//     super.initState();
//       Get.find<EventController>().getEventList(1,reload: true, isFirst: true);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       appBar: CustomAppBar(title: 'Event List'),
//       body: GetBuilder<EventController>(
//         builder:(eventController){
//           // if(!widget.isDataAvailable){
//             isDataAvailable = Get.find<EventController>().eventDataList != null &&  Get.find<EventController>().eventDataList!.isNotEmpty;
//           print("details : $isDataAvailable");
//             // }else{
//           //   isDataAvailable = widget.isDataAvailable;
//           // }
//           return isDataAvailable != null && !isDataAvailable! ? Center(
//             child: SizedBox(height: Get.height * 0.7,
//               child: NoDataScreen(
//                 text: "No Event Created Yet",
//                 type: NoDataType.event,
//               ),
//             ),
//           ) : Column(children: [
//             Expanded(
//               child: TabBarView(
//                 controller: eventController.listTabController,
//                 dragStartBehavior: DragStartBehavior.down,
//                 children: const [
//                   EventList(),
//                   EventList(),
//                   EventList(),
//                   EventList(),
//                   EventList(),
//                   EventList(),
//                   EventList(),
//                 ],
//               ),
//             ),
//           ],);
//         },
//       ),
//
//     );
//   }
// }
//
// class EventList extends StatefulWidget {
//   const EventList({super.key});
//
//   @override
//   State<EventList> createState() => _EventListState();
// }
//
// class _EventListState extends State<EventList> {
//   int value = 1;
//
//   @override
//   void initState() {
//     super.initState();
//
//     Get.find<EventController>().listTabController?.addListener(() {
//       if(value==1){
//         Future.delayed(const Duration(milliseconds: 100), (){
//           Get.find<EventController>().menuScrollController?.scrollToIndex(
//             Get.find<EventController>().listTabController!.index, preferPosition: AutoScrollPosition.middle,
//             duration: const Duration(milliseconds: 500),
//           );
//           Get.find<EventController>().menuScrollController?.highlight( Get.find<EventController>().listTabController!.index);
//           Get.find<EventController>().getEventList(1, reload: true);
//
//         });
//         value--;
//       }
//     });
//
//     }
//   @override
//   Widget build(BuildContext context) {
//
//     return GetBuilder<EventController>(builder: (eventController){
//       return eventController.eventDataList == null ?
//       const BookingRequestItemShimmer(): eventController.eventDataList!.isEmpty ?
//       Center(
//         child: SizedBox(height: Get.height * 0.7,
//           child: NoDataScreen(
//             text: 'No Event data Yet',
//             type: NoDataType.event,
//           ),
//         ),
//       ) : const EventListview();
//     });
//   }
// }

import 'package:get/get.dart';
import 'package:purplestage/utils/core_export.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key});
  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  bool? isDataAvailable;

  @override
  void initState() {
    super.initState();
    Get.find<EventController>().getEventList(1, reload: true, isFirst: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(title: 'Event List'),
      body: GetBuilder<EventController>(
        builder: (eventController) {
          isDataAvailable = eventController.eventDataList != null && eventController.eventDataList!.isNotEmpty;
          return isDataAvailable != null && !isDataAvailable!
              ? Center(
            child: SizedBox(
              height: Get.height * 0.7,
              child: NoDataScreen(
                text: "No Event Created Yet",
                type: NoDataType.event,
              ),
            ),
          )
              : const EventList();
        },
      ),
    );
  }
}

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
      builder: (eventController) {
        if (eventController.eventDataList == null) {
          return const BookingRequestItemShimmer();
        } else if (eventController.eventDataList!.isEmpty) {
          return Center(
            child: SizedBox(
              height: Get.height * 0.7,
              child: NoDataScreen(
                text: 'No Event data Yet',
                type: NoDataType.event,
              ),
            ),
          );
        } else {
          return const EventListview();
        }
      },
    );
  }
}
