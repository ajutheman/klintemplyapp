import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/subscription_schedule/subscription_schedule_bloc.dart';
import '../../../bloc/subscription_schedule/subscription_schedule_event.dart';
import '../../../repository/api_client.dart';
// import '../../../repository/subscription_schedule_repository.dart';
import '../booking/repositories/subscription_schedule_repository.dart';

class ScheduleBlocProvider extends StatelessWidget {
  final Widget child;

  const ScheduleBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubscriptionScheduleBloc(
          SubscriptionScheduleRepository(ApiClient(context)))
        ..add(LoadAssignments()),
      child: child,
    );
  }
}
