import 'package:chatter/core/network/network_checker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkCheckerImplemant implements NetworkChecker {
  @override
  Future<bool> get isConnected async {
    return await InternetConnectionChecker.instance.hasConnection;
  }
}