// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventStore on _EventStore, Store {
  late final _$eventsAtom = Atom(name: '_EventStore.events', context: context);

  @override
  List<Event> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(List<Event> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_EventStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getEventsAsyncAction =
      AsyncAction('_EventStore.getEvents', context: context);

  @override
  Future<void> getEvents() {
    return _$getEventsAsyncAction.run(() => super.getEvents());
  }

  @override
  String toString() {
    return '''
events: ${events},
isLoading: ${isLoading}
    ''';
  }
}
