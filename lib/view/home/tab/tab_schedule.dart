// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../base/color_data.dart';
// import '../../../base/resizer/fetch_pixels.dart';
// import '../../../base/widget_utils.dart';
// import '../../../bloc/subscription_schedule/subscription_schedule_bloc.dart';
// import '../../../bloc/subscription_schedule/subscription_schedule_event.dart';
// import '../../../bloc/subscription_schedule/subscription_schedule_state.dart';
// // import '../../../models/subscription_schedule_model.dart';
// import '../../../repository/api_client.dart';
// import '../booking/repositories/subscription_schedule_repository.dart';
// // import '../../../repository/subscription_schedule_repository.dart';
//
// class TabSchedule extends StatefulWidget {
//   const TabSchedule({Key? key}) : super(key: key);
//
//   @override
//   State<TabSchedule> createState() => _TabScheduleState();
// }
//
// class _TabScheduleState extends State<TabSchedule> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<SubscriptionScheduleBloc>().add(LoadAssignments());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     FetchPixels(context);
//     return BlocProvider(
//       create: (_) => SubscriptionScheduleBloc(
//         SubscriptionScheduleRepository(ApiClient(context)),
//       )..add(LoadAssignments()),
//       child: SafeArea(
//         child: Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               getVerSpace(FetchPixels.getPixelHeight(16)),
//               getCustomFont("Subscription Assignments", 22, Colors.black, 1,
//                   fontWeight: FontWeight.bold),
//               getVerSpace(FetchPixels.getPixelHeight(16)),
//               Expanded(
//                 child: BlocBuilder<SubscriptionScheduleBloc,
//                     SubscriptionScheduleState>(
//                   builder: (context, state) {
//                     if (state is ScheduleLoading) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (state is ScheduleLoaded) {
//                       final assignments = state.assignments;
//                       if (assignments.isEmpty) {
//                         return Center(
//                           child: getCustomFont(
//                               "No assignments yet", 16, Colors.grey, 1),
//                         );
//                       }
//                       return ListView.builder(
//                         physics: const BouncingScrollPhysics(),
//                         itemCount: assignments.length,
//                         itemBuilder: (context, index) {
//                           final item = assignments[index];
//                           return Container(
//                             margin: EdgeInsets.only(
//                                 bottom: FetchPixels.getPixelHeight(20)),
//                             padding:
//                                 EdgeInsets.all(FetchPixels.getPixelHeight(16)),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(
//                                   FetchPixels.getPixelHeight(12)),
//                               boxShadow: const [
//                                 BoxShadow(
//                                     color: Colors.black12,
//                                     blurRadius: 10,
//                                     offset: Offset(0, 4)),
//                               ],
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 getCustomFont(
//                                     item.customer.name, 16, Colors.black, 1,
//                                     fontWeight: FontWeight.w600),
//                                 getVerSpace(4),
//                                 getCustomFont(
//                                     "Date: ${item.workDate} (${item.dayOfWeek})",
//                                     14,
//                                     textColor,
//                                     1),
//                                 getCustomFont("Total: AED ${item.order.total}",
//                                     14, textColor, 1),
//                                 getCustomFont(
//                                     "Employees: ${item.order.employeeCount}",
//                                     14,
//                                     textColor,
//                                     1),
//                                 getCustomFont("Category: ${item.category.name}",
//                                     14, textColor, 1),
//                                 getCustomFont("Schedule ID: ${item.scheduleId}",
//                                     14, textColor, 1),
//                                 getCustomFont("Status: ${item.workStatus}", 14,
//                                     textColor, 1),
//                                 getVerSpace(10),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         context
//                                             .read<SubscriptionScheduleBloc>()
//                                             .add(
//                                               UpdateAssignmentStatus(
//                                                   item.assignmentId,
//                                                   "accepted"),
//                                             );
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                           backgroundColor: greenColor,
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 16)),
//                                       child: const Text("Accept"),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       );
//                     } else if (state is ScheduleError) {
//                       return Center(child: Text("Error: ${state.error}"));
//                     } else {
//                       return const SizedBox();
//                     }
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../base/color_data.dart';
import '../../../base/openMap.dart';
import '../../../base/resizer/fetch_pixels.dart';
import '../../../base/widget_utils.dart';
import '../../../bloc/subscription_schedule/subscription_schedule_bloc.dart';
import '../../../bloc/subscription_schedule/subscription_schedule_event.dart';
import '../../../bloc/subscription_schedule/subscription_schedule_state.dart';
import '../../../repository/api_client.dart';
import '../booking/repositories/subscription_schedule_repository.dart';

class TabSchedule extends StatelessWidget {
  const TabSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);

    return BlocProvider(
      create: (_) => SubscriptionScheduleBloc(
        SubscriptionScheduleRepository(ApiClient(context)),
      )..add(LoadAssignments()),
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerSpace(FetchPixels.getPixelHeight(16)),
              getCustomFont("Schedule Assignments", 22, Colors.black, 1,
                  fontWeight: FontWeight.bold),
              getVerSpace(FetchPixels.getPixelHeight(16)),
              Expanded(
                child: BlocBuilder<SubscriptionScheduleBloc,
                    SubscriptionScheduleState>(
                  builder: (context, state) {
                    if (state is ScheduleLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ScheduleLoaded) {
                      final assignments = state.assignments;
                      if (assignments.isEmpty) {
                        return Center(
                          child: getCustomFont(
                              "No assignments found", 16, Colors.grey, 1),
                        );
                      }
                      return ListView.builder(
                        itemCount: assignments.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final a = assignments[index];
                          final assignmentDate = DateFormat('dd MMM yyyy')
                              .format(DateTime.parse(a.workDate));

                          return Container(
                            margin: EdgeInsets.only(
                                bottom: FetchPixels.getPixelHeight(20)),
                            padding:
                                EdgeInsets.all(FetchPixels.getPixelHeight(16)),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  FetchPixels.getPixelHeight(12)),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: Offset(0, 4)),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomFont(
                                    a.customer.name, 16, Colors.black, 1,
                                    fontWeight: FontWeight.w600),
                                getVerSpace(6),
                                getCustomFont(
                                    "Date: $assignmentDate (${a.dayOfWeek})",
                                    14,
                                    textColor,
                                    1),
                                getVerSpace(FetchPixels.getPixelHeight(8)),
                                getCustomFont("Schedule ID: ${a.scheduleId}",
                                    14, textColor, 1),
                                getCustomFont("Order ID: ${a.order.id}", 14,
                                    textColor, 1),
                                getCustomFont("Total: AED ${a.order.total}", 14,
                                    textColor, 1),
                                getCustomFont(
                                    "Employees: ${a.order.employeeCount}",
                                    14,
                                    textColor,
                                    1),
                                getCustomFont("Category: ${a.category.name}",
                                    14, textColor, 1),
                                getVerSpace(10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: _getBadgeColor(a.workStatus)
                                            .withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: getCustomFont(
                                        a.workStatus.capitalize(),
                                        12,
                                        _getBadgeColor(a.workStatus),
                                        1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    if (a.workStatus.toLowerCase() == "pending")
                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     context
                                      //         .read<SubscriptionScheduleBloc>()
                                      //         .add(UpdateAssignmentStatus(
                                      //           a.assignmentId,
                                      //           "accepted",
                                      //           notes: "Started the work",
                                      //         ));
                                      //   },
                                      //   style: ElevatedButton.styleFrom(
                                      //     backgroundColor: greenColor,
                                      //   ),
                                      //   child: const Text("Accept"),
                                      // ),
                                      getDivider(dividerColor, 0, 1),
                                    getVerSpace(FetchPixels.getPixelHeight(20)),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            launchWhatsApp(a.customer as String
                                                // .customerName
                                                ); // Make sure mobile number is valid
                                          },
                                          child: Container(
                                            height:
                                                FetchPixels.getPixelHeight(42),
                                            width:
                                                FetchPixels.getPixelHeight(42),
                                            decoration: BoxDecoration(
                                              color: Colors.green[50],
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Center(
                                              child: FaIcon(
                                                  FontAwesomeIcons.whatsapp,
                                                  color: Colors.green),
                                            ),
                                          ),
                                        ),
                                        getHorSpace(
                                            FetchPixels.getPixelWidth(12)),
                                        GestureDetector(
                                          onTap: () {
                                            launchCall(a.customer as String);
                                          },
                                          child: Container(
                                            height:
                                                FetchPixels.getPixelHeight(42),
                                            width:
                                                FetchPixels.getPixelHeight(42),
                                            decoration: BoxDecoration(
                                              image: getDecorationAssetImage(
                                                  context, "call_bg.png"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        final noteController =
                                            TextEditingController();
                                        final result = await showDialog<String>(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title:
                                                const Text("Accept Assignment"),
                                            content: TextField(
                                              controller: noteController,
                                              decoration: const InputDecoration(
                                                labelText:
                                                    "Enter notes (optional)",
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text("Cancel"),
                                              ),
                                              ElevatedButton(
                                                onPressed: () => Navigator.pop(
                                                    context,
                                                    noteController.text),
                                                child: const Text("Accept"),
                                              ),
                                            ],
                                          ),
                                        );

                                        if (result != null) {
                                          context
                                              .read<SubscriptionScheduleBloc>()
                                              .add(
                                                UpdateAssignmentStatus(
                                                    a.assignmentId,
                                                    // item.assignmentId,
                                                    "accepted",
                                                    result),
                                              );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: greenColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                      ),
                                      child: const Text("Accept"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else if (state is ScheduleError) {
                      return Center(
                          child: Text("Error: ${state.error}",
                              style: const TextStyle(color: Colors.red)));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color _getBadgeColor(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return Colors.orange;
      case "accepted":
        return Colors.green;
      case "completed":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}

extension on String {
  String capitalize() => isNotEmpty
      ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
      : this;
}
