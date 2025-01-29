import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/repository/song/song_repository_imp.dart';
import 'package:spotify_clone/service_locator.dart';

class GetNewsSongsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepositoryImp>().getNewsSongs();
  }
}
