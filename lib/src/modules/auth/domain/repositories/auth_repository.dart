abstract class AuthRepository {
  
  Future<String> login(String username, String password);
  Future<bool> isLogout();
  Future<String> register(String username, String password);
  Future<bool> isLoggedIn();
}
