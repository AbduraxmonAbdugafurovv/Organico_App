abstract class ChangePasswordState {
  ChangePasswordState();
}
class ChangePasswordInitialState extends ChangePasswordState {
  ChangePasswordInitialState();
}
class ChangePAsswordLoadingState extends ChangePasswordState{
  ChangePAsswordLoadingState();
}
class ChangeErrorState extends ChangePasswordState{
  ChangeErrorState();
}