abstract class IAuthError {
  String get message;
  StackTrace? get stackTrace;
}

class AuthError implements IAuthError {
  @override
  final String message;
  @override
  final StackTrace? stackTrace;

  const AuthError(this.message, [this.stackTrace]);
}

class ExternalError extends AuthError {
  const ExternalError(super.message, [super.stackTrace]);
}

class CredentialsError extends AuthError {
  const CredentialsError(super.message, [super.stackTrace]);
}