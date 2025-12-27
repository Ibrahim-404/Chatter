import 'package:chatter/core/network/network_state.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkChecker {
  Future<bool> get isConnected;
  Stream<NetworkState> get onStatusChange;
}
