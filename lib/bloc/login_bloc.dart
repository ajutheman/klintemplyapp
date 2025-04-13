// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../data/model/user_model.dart';
// import '../data/prefs.dart';
// import '../repository/auth_repository.dart';
//
// part 'login_event.dart';
// part 'login_state.dart';
//
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final AuthRepository authRepository;
//
//   LoginBloc({required this.authRepository}) : super(LoginInitial()) {
//     on<LoginButtonPressed>(_onLoginPressed);
//   }
//
//   Future<void> _onLoginPressed(
//     LoginButtonPressed event,
//     Emitter<LoginState> emit,
//   ) async {
//     emit(LoginLoading());
//     try {
//       UserModel user = await authRepository.login(event.email, event.password);
//       await Prefs.saveUser(user);
//       emit(LoginSuccess(user));
//     } catch (e) {
//       emit(LoginFailure(e.toString()));
//     }
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/user_model.dart';
import '../data/prefs.dart';
import '../repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginPressed);
  }

  Future<void> _onLoginPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      UserModel user = await authRepository.login(
        event.email,
        event.password,
        event.fcmToken, // ✅ Pass FCM token
      );

      await Prefs.saveUser(user); // ✅ Save updated user info with FCM token

      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
