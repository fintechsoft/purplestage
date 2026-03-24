import 'package:flutter/material.dart';

class DeskTopEventItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String venue;
  final String institution;
  final String type;
  final String time;
  final String contact;
  final String description;
  final VoidCallback onViewMore;

  const DeskTopEventItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.venue,
    required this.institution,
    required this.type,
    required this.time,
    required this.contact,
    required this.description,
    required this.onViewMore,
  });

  @override
  // Widget build(BuildContext context) {
  //   print(imageUrl);
  //   return Card(
  //     elevation: 4,
  //     margin: const EdgeInsets.all(12),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //     child: SizedBox(
  //       width: 320,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           // Image Banner
  //           ClipRRect(
  //             borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
  //             child: Image.network(
  //               imageUrl,
  //               height: 150,
  //               width: double.infinity,
  //               fit: BoxFit.cover,
  //               errorBuilder: (context, error, stackTrace) {
  //                 return Image.asset(
  //                   'assets/images/placeholder.jpg', // Replace with your asset image path
  //                   fit: BoxFit.cover,
  //                 );
  //               },
  //             ),
  //           ),
  //
  //           // Info Section
  //           Padding(
  //             padding: const EdgeInsets.all(12),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(title,
  //                     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //                 const SizedBox(height: 4),
  //
  //                 _infoRow("Venue:", venue),
  //                 _infoRow("Institution:", institution),
  //                 _infoRow("Type:", type),
  //                 _infoRow("Time:", time),
  //                 _infoRow("Contact:", contact),
  //
  //                 if (description.isNotEmpty) ...[
  //                   const SizedBox(height: 6),
  //                   Text(
  //                     description,
  //                     style: const TextStyle(fontSize: 13, color: Colors.grey),
  //                     maxLines: 3,
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                 ],
  //               ],
  //             ),
  //           ),
  //
  //           // View More Button
  //           Align(
  //             alignment: Alignment.bottomRight,
  //             child: Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
  //               child: ElevatedButton(
  //                 onPressed: onViewMore,
  //                 child: const Text("View More"),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Banner
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/placeholder.jpg',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),

          // Info Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  _infoRow("Venue:", venue,context),
                  _infoRow("Institution:", institution,context),
                  _infoRow("Type:", type,context),
                  _infoRow("Time:", time,context),
                  _infoRow("Contact:", contact,context),
                  if (description.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        description,
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: onViewMore,
                      child: const Text("View More"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _infoRow(String label, String value, BuildContext ctx) {
    return Padding(
      // padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).size.height/90,top: MediaQuery.of(ctx).size.height/90),
      padding: EdgeInsets.only(bottom: 3,top: 3),
      child: RichText(
        text: TextSpan(
          text: "$label ",
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
