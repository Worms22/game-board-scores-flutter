import 'package:flutter_structure/features/saved/data/data_sources/saved_remote_data_source.dart';
import 'package:flutter_structure/features/saved/domain/saved_repository.dart';

class SavedRepositoryImpl extends SavedRepository {
  SavedRepositoryImpl(this._remoteDataSource);

  final SavedRemoteDataSource _remoteDataSource;

}
