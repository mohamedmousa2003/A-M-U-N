import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/firebase_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<UserEntity> login({required String email, required String password}) async {
    final user = await datasource.login(email, password);
    return UserEntity(uid: user.uid, email: user.email!);
  }

  @override
  Future<UserEntity> register({required String email, required String password}) async {
    final user = await datasource.register(email, password);
    return UserEntity(uid: user.uid, email: user.email!);
  }
}
