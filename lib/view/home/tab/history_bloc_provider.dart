import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/history/history_bloc.dart';
import '../../../../repository/api_client.dart';
import '../booking/repositories/HistoryRepository.dart';

class HistoryBlocProvider extends StatelessWidget {
  final Widget child;

  const HistoryBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient(context);
    final historyRepository = HistoryRepository(apiClient);

    return BlocProvider(
      create: (_) => HistoryBloc(historyRepository),
      child: child,
    );
  }
}
