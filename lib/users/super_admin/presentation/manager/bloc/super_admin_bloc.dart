import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'super_admin_event.dart';
part 'super_admin_state.dart';

class SuperAdminBloc extends Bloc<SuperAdminEvent, SuperAdminState> {
  SuperAdminBloc() : super(SuperAdminInitial()) {
    on<SuperAdminEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
