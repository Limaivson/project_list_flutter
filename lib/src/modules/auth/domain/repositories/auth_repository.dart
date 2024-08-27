abstract class AuthRepository {
  //recebe o objeto User
  Future<String> login(String username, String password);
  
  Future<bool> isLogout();
  Future<bool> register(String username, String password);
  Future<bool> isLoggedIn();
}
