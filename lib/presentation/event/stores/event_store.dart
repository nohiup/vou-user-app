import 'package:mobx/mobx.dart';
import 'package:vou_user/constant/value.dart';
import 'package:vou_user/core/api/rest_client.dart';
import 'package:vou_user/domain/entity/event_model.dart';

part 'event_store.g.dart';
class EventStore = _EventStore with _$EventStore;

abstract class _EventStore with Store{
  //Observable
  @observable
  List<Event> events = [];

  @observable
  bool isLoading = false;


  final RestClient rest = RestClient(Value.baseUrl);

  //Action
  @action
  Future<void> getEvents() async{
    isLoading = true;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': Value.token
    };

    //TODO: REGISTER IMPLEMENT
    var response = await rest.get(
        "/api/events",
        headers: headers);

    if (response.statusCode == 200 ){
      //TODO: Convert response to List<Event> and add it.
      isLoading = false;
      return;
    } else {
      events = Value.events;
      isLoading = false;
      return;
    }
  }
}