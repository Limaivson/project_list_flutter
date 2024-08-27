abstract class IRegisterRepository {
  Future<bool> register(String username, String password);
}
