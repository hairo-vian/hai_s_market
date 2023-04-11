import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hai_market/di/factory/view_model.dart';
import 'package:hai_market/model/error/error_model.dart';
import 'package:hai_market/model/state_data/state_data.dart';
import 'package:hai_market/ui/profile/datasource/profile_datasource.dart';
import 'package:injectable/injectable.dart';

class ProfileState extends StateData {
  final String? sample;

  ProfileState({this.sample, ErrorModel? error}) : super(error: error);

  @override
  ProfileState copyWith({String? sample, ErrorModel? error}) => ProfileState(
        sample: sample ?? this.sample,
        error: error ?? this.error,
      );
}

@injectable
class ProfileViewModel extends ViewModel<ProfileState> {
  ProfileViewModel(this._dataSource);

  final ProfileDataSource _dataSource;

  String get userName => _dataSource.name;

  String get userEmail => _dataSource.email;

  String get joinedDate => _dataSource.joinedDate;

  @override
  void onChange(Change<ProfileState> change) {
    super.onChange(change);
    print(change);
  }
}
