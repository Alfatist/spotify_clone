import 'package:fpdart/fpdart.dart';

abstract class SongsRepository {
  Future<Either> getNewsSongs();
}
