import 'package:event_bus/event_bus.dart';

class Constants {
  static final EventBus eventBus = new EventBus();
}

class ChangeThemeEvent {
  int index;

  ChangeThemeEvent(this.index);
}
