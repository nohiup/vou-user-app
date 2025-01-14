import 'package:mobx/mobx.dart';
import 'package:vou_user/core/api/rest_client.dart';
import 'package:vou_user/domain/entity/event_participant.dart';

import '../../../../constant/value.dart';

part 'shake_store.g.dart';

class ShakeStore = _ShakeStore with _$ShakeStore;

abstract class _ShakeStore with Store {
  @observable
  int stage = 0; // 0: Whole, 1: Cracked, 2: Broken

  @observable
  double currentShakeForce = 0.0;

  @observable
  bool isGameStarted = false;

  @observable
  EventParticipants? currentEp;

  @observable
  int playCount = 2; // Số lượt chơi

  final double shakeThresholdStage1 = 1500.0;
  final double shakeThresholdStage2 = 3000.0;

  @observable
  String? eventId;


  @action
  void setEventId(String eventId){
    this.eventId = eventId;
  }

  @action
  void startGame() {
    if (playCount <= 0) return;
    isGameStarted = true;
    stage = 0;
    currentShakeForce = 0.0;
    playCount--; // Giảm số lượt chơi
  }

  @action
  void stopGame() {
    resetGame();
    isGameStarted = false;
  }

  @action
  void resetGame() {
    isGameStarted = false;
    stage = 0;
    currentShakeForce = 0.0;
    // Không reset playCount để giữ số lượt chơi
  }

  @action
  void updateShakeForce(double shakeForce) {
    currentShakeForce = shakeForce;
    if (shakeForce >= shakeThresholdStage2 && stage < 2) {
      stage = 2;
    } else if (shakeForce >= shakeThresholdStage1 && stage < 1) {
      stage = 1;
    }
  }

  final RestClient rest = RestClient(Value.baseUrl);
  @action
  Future<void> getParticipantData() async{
    //TODO: Impl.
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': Value.token
    };

    //Todo: somehow get user email for global class variable
    var response = await rest.get(
      "/api/userVouchers?email=${Value.userEmail}&eventId=${eventId!}",
      headers: headers
    );

    //TODO: convert to eventParticipants.

    //....
    playCount = currentEp!.playerCredit;

  }
}
