
abstract class ILogOutDatasource {
  Future<void> logout();
  // Mesmo caso da outra camada, você pode retornar um booleano para indicar se o logout foi bem sucedido ou não
}
