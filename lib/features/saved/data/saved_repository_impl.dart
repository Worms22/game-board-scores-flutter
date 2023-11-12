import 'package:game_board_scores/features/saved/data/data_sources/saved_remote_data_source.dart';
import 'package:game_board_scores/features/saved/domain/saved_repository.dart';

class SavedRepositoryImpl extends SavedRepository {
  SavedRepositoryImpl(this._remoteDataSource);

  final SavedRemoteDataSource _remoteDataSource;

}
