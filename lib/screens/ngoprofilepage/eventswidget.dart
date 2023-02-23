import 'package:flutter/material.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 8, 0, 8),
      child: Text("Feature Coming Soon"),
      // height: MediaQuery.of(context).size.height * 0.5,

      // ListView.builder(
      //   itemCount: 3,
      //   shrinkWrap: true,
      //   scrollDirection: Axis.horizontal,
      //   physics: const ClampingScrollPhysics(),
      //   itemBuilder: (context, index) {
      //     return GestureDetector(
      //       onTap: () {},
      //       child: Container(
      //         margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(20),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey.shade400,
      //               blurRadius: 5,
      //               offset: Offset(2, 2),
      //             ),
      //             BoxShadow(
      //               color: Colors.grey.shade200,
      //               blurRadius: 4,
      //               offset: Offset(-2, -2),
      //             ),
      //           ],
      //         ),
      //         width: 250,
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             ClipRRect(
      //               borderRadius: BorderRadius.only(
      //                 topRight: Radius.circular(20),
      //                 topLeft: Radius.circular(20),
      //               ),
      //               child: Image(
      //                 fit: BoxFit.cover,
      //                 image: AssetImage(
      //                   "images/background.jpeg",
      //                 ),
      //               ),
      //             ),
      //             Text(
      //               "Date",
      //             ),
      //             Text(
      //               "Some More Text",
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
