import 'package:mobx/mobx.dart';
import 'package:vou_user/constant/value.dart';
import 'package:vou_user/domain/entity/event_model.dart';

part 'event_store.g.dart';
class EventStore = _EventStore with _$EventStore;

abstract class _EventStore with Store{
  //Observable
  @observable
  List<Event> events = [];

  @observable
  bool isLoading = false;

  //Action
  @action
  Future<void> getEvents() async{
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));

    events = Value.events;

    isLoading = false;
  }
}