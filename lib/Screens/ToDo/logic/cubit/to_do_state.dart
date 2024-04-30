part of 'to_do_cubit.dart';

@immutable
sealed class ToDoState {}

final class ToDoInitial extends ToDoState {}


class InsertState extends ToDoState {}

class UpdateState extends ToDoState {}

class DeleteState extends ToDoState {}

class GetRecordsState extends ToDoState {}

class GetRecordsLoadingState extends ToDoState {}




class ChangeCurrentIndexState extends ToDoState {}
