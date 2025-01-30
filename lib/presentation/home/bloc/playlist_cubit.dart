import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_playlist.dart';
import 'package:spotify_clone/presentation/home/bloc/playlist_state.dart';

import 'package:spotify_clone/service_locator.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistLoading());

  Future<void> getPlaylist() async {
    var returnedSongs = await sl<GetPlaylistUsecase>().call();

    returnedSongs.fold(
      (l) {
        emit(PlaylistLoadFailure());
      },
      (data) {
        emit(PlaylistLoaded(songs: data));
      },
    );
  }
}
