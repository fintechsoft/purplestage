import 'package:get/get.dart';
import 'package:purplestage/feature/event/widgets/desktop_event_item.dart';
import 'package:purplestage/utils/core_export.dart';

class EventListViewDesktop extends StatelessWidget {
  final List<EventData> events;

  const EventListViewDesktop({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // Dynamically calculate number of columns
    final int crossAxisCount = (screenWidth ~/ 340).clamp(1, 5); // Each card ~320 + spacing

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: events.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.7, // controls height/width ratio
        ),
        itemBuilder: (context, index) {
          final event = events[index];
          return DeskTopEventItem(
            imageUrl: event.eventPosterFullPath ?? '',
            title: event.eventName ?? '',
            venue: event.venue ?? '',
            institution: event.institutionName ?? '',
            type: event.typeOfEvent ?? '',
            time: event.eventTime ?? '',
            contact: event.contactNo ?? '',
            description: event.eventDescription ?? '',
            onViewMore: () => Get.to(()=>EventDetailsScreen(id: event.id ?? "",eventDataDetails: event,)),
          );
        },
      ),
    );
  }
}
