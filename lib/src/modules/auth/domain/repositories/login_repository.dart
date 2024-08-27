abstract class ILoginRepository {
  //recebe o objeto User
  Future<String> login(String username, String password);
  
}
