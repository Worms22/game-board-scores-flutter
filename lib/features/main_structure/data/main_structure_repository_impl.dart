import 'package:game_board_scores/features/main_structure/data/data_sources/main_structure_data_source.dart';
import 'package:game_board_scores/features/main_structure/domain/main_structure_repository.dart';

class MainStructureRepositoryImpl extends MainStructureRepository {
  MainStructureRepositoryImpl(this._mainStructureDataSource);

  final MainStructureDataSource _mainStructureDataSource;




}
