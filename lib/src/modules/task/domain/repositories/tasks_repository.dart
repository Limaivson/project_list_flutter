abstract class TaskRepository {
  Future<List<String>> getTasks();
  Future<void> addTask(String task);
  Future<void> updateTask(String task);
  Future<void> deleteTask(int taskId);
}
