import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/booking/booking_bloc.dart';
// import '../bloc/booking/booking_event.dart';
// import '../repository/api_client.dart';
import '../../../bloc/booking/booking_bloc.dart';
import '../../../bloc/booking/booking_event.dart';
import '../../../repository/api_client.dart';
import '../booking/repositories/booking_repository.dart';

class BookingBlocProvider extends StatelessWidget {
  final Widget child;

  const BookingBlocProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final apiClient = ApiClient(context);
        return BookingBloc(BookingRepository(apiClient))..add(LoadBookings());
      },
      child: child,
    );
  }
}
