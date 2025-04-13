import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../models/employee_model.dart';
import '../../data/model/employee_model.dart';
import '../../repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;

  ProfileBloc({required this.repository}) : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final employee = await repository.getProfile();
        emit(ProfileLoaded(employee));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
  }
}
