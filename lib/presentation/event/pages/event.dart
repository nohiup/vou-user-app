import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vou_user/di/service_locator.dart';
import 'package:vou_user/presentation/event/stores/event_store.dart';
import 'package:vou_user/presentation/event/widgets/event_tile.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await eventStore.getEvents();
    });
  }

  final EventStore eventStore = getIt<EventStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return eventStore.isLoading? _buildProgressIndicator() : _buildMainBody();
    });
  }

  Widget _buildMainBody(){
    return ListView.builder(
        itemCount: eventStore.events.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final event = eventStore.events[index];
          // if (event.endTime.isBefore(DateTime.now())) return const SizedBox.shrink();
          return EventTile(
              name: event.name,
              imageUrl: event.imgUrl?? "",
              voucherCount: event.voucherCount,
              startTime: event.startTime,
              endTime: event.endTime,
              brandName: event.brandName ?? "",
            gameName: event.gameName,
          );
        }
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: LoadingAnimationWidget.twistingDots(
          size: 50,
          leftDotColor: Colors.blue,
          rightDotColor: Colors.green,
        ),
      ),
    );
  }
}
