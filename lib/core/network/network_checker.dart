import 'package:chatter/core/network/network_state.dart';

abstract class NetworkChecker {
  Future<bool> get isConnected;
  Stream<NetworkState> get onStatusChange;
}
