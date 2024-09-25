part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}
class ChangeLangLoading extends GlobalState {}
class ChangeLangSuccess extends GlobalState {}
