import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/appbar.dart';
import 'package:spotify_clone/common/widgets/favorite_button/favorite_button.dart';
import 'package:spotify_clone/core/configs/constants/app_urls.dart';
import 'package:spotify_clone/presentation/profile/bloc/favorite_songs_cubit.dart';
import 'package:spotify_clone/presentation/profile/bloc/favorite_songs_state.dart';
import 'package:spotify_clone/presentation/profile/bloc/profile_info_cubit.dart';
import 'package:spotify_clone/presentation/profile/bloc/profile_info_state.dart';
import 'package:spotify_clone/presentation/song_player/pages/song_player.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        title: Text("Profile"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileInfo(context),
          const SizedBox(
            height: 30,
          ),
          _favoriteSongs(context)
        ],
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getUser(),
      child: Container(
        decoration: BoxDecoration(
            color: context.isDarkMode ? const Color(0xff2C2B2B) : Colors.white,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(50))),
        height: MediaQuery.sizeOf(context).height / 3.5,
        width: double.infinity,
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
            builder: (context, state) {
          if (state is ProfileInfoLoading) {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }
          if (state is ProfileInfoLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(state.userEntity.imageUrl!))),
                ),
                const SizedBox(height: 15),
                Text(state.userEntity.email!),
                const SizedBox(height: 15),
                Text(state.userEntity.fullName!,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
              ],
            );
          }
          if (state is ProfileInfoFailure) {
            const Text("Please try again.");
          }
          return Container();
        }),
      ),
    );
  }

  Widget _favoriteSongs(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteSongsCubit()..getFavoriteSongs(),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("FAVORITE SONGS"),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<FavoriteSongsCubit, FavoriteSongsState>(
              builder: (context, state) {
            if (state is FavoriteSongsLoading) {
              return const CircularProgressIndicator();
            }
            if (state is FavoriteSongsLoaded) {
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SongPlayerPage(
                                          songEntity:
                                              state.favoriteSongs[index])));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${AppURLs.firestorage}${Uri.encodeComponent("${state.favoriteSongs[index].artist} - ${state.favoriteSongs[index].title}")}.jpg?${AppURLs.mediaAlt}'))),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.favoriteSongs[index].title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      state.favoriteSongs[index].artist,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(state.favoriteSongs[index].duration
                                    .toStringAsFixed(2)
                                    .replaceAll(".", ":")),
                                SizedBox(
                                  width: 20,
                                ),
                                FavoriteButton(
                                    function: () => context
                                        .read<FavoriteSongsCubit>()
                                        .removeSong(index),
                                    key: UniqueKey(),
                                    songEntity: state.favoriteSongs[index])
                              ],
                            )
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: state.favoriteSongs.length);
            }
            if (state is FavoriteSongsFailure) {
              return const Text("Please try again");
            }
            return Container();
          })
        ],
      ),
    );
  }
}
