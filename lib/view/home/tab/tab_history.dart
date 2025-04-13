import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../base/color_data.dart';
import '../../../base/resizer/fetch_pixels.dart';
import '../../../base/widget_utils.dart';
import '../../../bloc/history/history_bloc.dart';
import '../../../bloc/history/history_event.dart';
import '../../../bloc/history/history_state.dart';
import '../../../repository/api_client.dart';
// import '../booking/modle/history_assignment_model.dart';
import '../booking/repositories/HistoryRepository.dart';
// import '../booking/repositories/history_repository.dart';

class TabHistory extends StatefulWidget {
  const TabHistory({super.key});

  @override
  State<TabHistory> createState() => _TabHistoryState();
}

class _TabHistoryState extends State<TabHistory> {
  late HistoryBloc bloc;
  late DateTime _startDate;
  late DateTime _endDate;

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now().subtract(const Duration(days: 30));
    _endDate = DateTime.now();

    bloc = HistoryBloc(HistoryRepository(ApiClient(context)));
    bloc.add(LoadHistory(
        startDate: DateFormat('yyyy-MM-dd').format(_startDate),
        endDate: DateFormat('yyyy-MM-dd').format(_endDate)));
  }

  void _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
    );

    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
      bloc.add(LoadHistory(
          startDate: DateFormat('yyyy-MM-dd').format(picked.start),
          endDate: DateFormat('yyyy-MM-dd').format(picked.end)));
    }
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return BlocProvider.value(
      value: bloc,
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerSpace(FetchPixels.getPixelHeight(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getCustomFont("Assignment History", 22, Colors.black, 1,
                      fontWeight: FontWeight.bold),
                  TextButton(
                    onPressed: _pickDateRange,
                    child: const Text("Pick Date"),
                  )
                ],
              ),
              getVerSpace(FetchPixels.getPixelHeight(16)),
              Expanded(child: BlocBuilder<HistoryBloc, HistoryState>(
                builder: (context, state) {
                  if (state is HistoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HistoryLoaded) {
                    if (state.assignments.isEmpty) {
                      return Center(
                        child: getCustomFont(
                            "No history found", 16, Colors.grey, 1),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.assignments.length,
                      itemBuilder: (_, index) {
                        final item = state.assignments[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 14),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 4))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomFont("Customer: ${item.customerName}",
                                  16, Colors.black, 1,
                                  fontWeight: FontWeight.w600),
                              getVerSpace(4),
                              getCustomFont(
                                  "Date: ${item.formattedDate} (${item.dayOfWeek})",
                                  14,
                                  textColor,
                                  1),
                              getCustomFont("Status: ${item.workStatus}", 14,
                                  textColor, 1),
                              if (item.notes != null)
                                getCustomFont("Notes: ${item.notes!}", 14,
                                    Colors.grey[800]!, 1),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is HistoryError) {
                    return Center(
                        child: Text("Error: ${state.message}",
                            style: const TextStyle(color: Colors.red)));
                  } else {
                    return const SizedBox();
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
