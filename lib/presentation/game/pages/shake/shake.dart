import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:social_sharing_plus/social_sharing_plus.dart';
import 'package:vou_user/di/service_locator.dart';
import 'package:vou_user/presentation/game/stores/shake_store/shake_store.dart';
import 'package:vou_user/utils/routes/routes.dart';

class ShakePage extends StatefulWidget {
  @override
  _ShakePageState createState() => _ShakePageState();
}

class _ShakePageState extends State<ShakePage> {
  final ShakeStore gameStore = getIt<ShakeStore>();
  StreamSubscription<AccelerometerEvent>? accelerometerStreamSubscription;
  late ReactionDisposer stageReactionDisposer;

  void startShakeDetection() {
    accelerometerStreamSubscription = accelerometerEventStream().listen((AccelerometerEvent event) {
      if (!gameStore.isGameStarted) return;

      // Tính độ mạnh của lực lắc
      double shakeForce = (event.x * event.x) +
          (event.y * event.y) +
          (event.z * event.z);

      gameStore.updateShakeForce(shakeForce);
    });
  }

  @override
  void initState() {
    super.initState();
    startShakeDetection();


    // Add a reaction to listen for changes in the stage observable
    stageReactionDisposer = reaction<int>((_) => gameStore.stage, (stage) {
      if (stage == 2) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            gameStore.stopGame();
            return AlertDialog(
              title: const Text('Stage 2 Reached'),
              content: const Text('You got 1 letter V.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    accelerometerStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shake Game"),
        actions: [
          IconButton(
            onPressed: (){
              SocialSharingPlus.shareToSocialMedia(
              SocialPlatform.facebook,  "Play this game with me!",);
            },
            //TODO: Increase 1 play count, only first share in the day.
            icon: const Icon(Icons.share),
          ),

          IconButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  TextEditingController controller = TextEditingController();
                  return AlertDialog(
                    title: const Text('Send play turn'),
                    content: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'Enter receiver email',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          //TODO: Send play count to account email.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Play turn sent!'),
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.send),
          ),
          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed(Routes.inventory);
            },
            icon: const Icon(Icons.backpack),
          ),


        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Hiển thị số lượt chơi
              Observer(
                builder: (_) => Text(
                  "Lượt chơi: ${gameStore.playCount}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 20),

              // Hình ảnh trứng tương ứng với giai đoạn
              Observer(
                builder: (_) {
                  String assetName = 'assets/egg_whole.jpg';
                  if (gameStore.stage == 1) {
                    assetName = 'assets/egg_cracked.jpg';
                  } else if (gameStore.stage == 2) {
                    assetName = 'assets/egg_broken.jpg';
                  }
                  return Image.asset(assetName, width: 300, height: 400);
                },
              ),

              const SizedBox(height: 20),

              // Hiển thị lực lắc hiện tại
              Observer(
                builder: (_) => Text(
                  "Shake Force: ${gameStore.currentShakeForce.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 18),
                ),
              ),

              const SizedBox(height: 20),

              // Hiển thị trạng thái hiện tại
              Observer(
                builder: (_) => Text(
                  "Stage: ${
                      gameStore.stage == 0 ? 'Whole' :
                      gameStore.stage == 1 ? 'Cracked' : 'Broken'
                  }",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 30),

              // Nút "Bắt đầu"
              Observer(
                builder: (_) => ElevatedButton(
                  onPressed: gameStore.isGameStarted
                      ? gameStore.stopGame
                      : gameStore.startGame,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    gameStore.isGameStarted ? "Dừng lại" : "Bắt đầu",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
