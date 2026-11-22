import 'package:dartz/dartz.dart';
import 'package:dushka_burger/core/failure/failures.dart';
import 'package:dushka_burger/core/use_case/use_case.dart';
import 'package:dushka_burger/features/menu/domain/repositories/menu_repository.dart';

class GetGuestIdUseCase implements UseCase<String, NoParams> {
  final MenuRepository repository;

  GetGuestIdUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.getGuestId();
  }
}



