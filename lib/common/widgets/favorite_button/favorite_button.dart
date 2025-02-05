import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:spotify_clone/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  final Function? function;
  const FavoriteButton({super.key, required this.songEntity, this.function});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
          builder: (context, state) {
        if (state is FavoriteButtonInitial) {
          bool isFavorite = songEntity.isFavorite;
          ValueNotifier<bool> pressed = ValueNotifier(false);
          return ValueListenableBuilder(
              valueListenable: pressed,
              builder: (_, __, ___) {
                return IconButton(
                    onPressed: () {
                      pressed.value = true;
                      context
                          .read<FavoriteButtonCubit>()
                          .favoriteButtonUpdated(songEntity.songId);
                      if (function != null) {
                        function!();
                      }
                    },
                    icon: pressed.value
                        ? Icon(
                            !isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            size: 25,
                            color: AppColors.darkGrey,
                          )
                        : Icon(
                            isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            size: 25,
                            color: AppColors.darkGrey,
                          ));
              });
        }
        if (state is FavoriteButtonUpdated) {
          bool isFavorite = state.isFavorite;
          ValueNotifier<bool> pressed = ValueNotifier(false);
          return ValueListenableBuilder(
              valueListenable: pressed,
              builder: (_, __, ___) {
                return IconButton(
                    onPressed: () {
                      pressed.value = true;
                      context
                          .read<FavoriteButtonCubit>()
                          .favoriteButtonUpdated(songEntity.songId);
                    },
                    icon: pressed.value
                        ? Icon(
                            !isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            size: 25,
                            color: AppColors.darkGrey,
                          )
                        : Icon(
                            isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            size: 25,
                            color: AppColors.darkGrey,
                          ));
              });
        }
        return Container();
      }),
    );
  }
}
