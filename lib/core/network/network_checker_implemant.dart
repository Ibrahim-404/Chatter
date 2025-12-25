import 'package:chatter/core/network/network_checker.dart';
import 'package:chatter/core/network/network_state.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkCheckerImplemant implements NetworkChecker {
  final InternetConnectionChecker connectionChecker;
  
  NetworkCheckerImplemant({required this.connectionChecker});

  @override
  Future<bool> get isConnected async {
    return await connectionChecker.hasConnection;
  }
  @override
  Stream<NetworkState> get onStatusChange {  
    return connectionChecker.onStatusChange.map((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          return NetworkState.online;
        case InternetConnectionStatus.disconnected:
          return NetworkState.offline;
      default:
        return NetworkState.online;  
      }
    });
  }
}