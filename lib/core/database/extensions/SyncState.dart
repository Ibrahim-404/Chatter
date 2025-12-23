enum SyncState {
   pending,
  synced,
  failed,
}
extension SyncStateExtension on SyncState {
  int toInt() {
    switch (this) {
      case SyncState.pending:
        return 0;
      case SyncState.synced:
        return 1;
      case SyncState.failed:
        return 2;
    }
  }

  static SyncState fromInt(int value) {
    switch (value) {
      case 0:
        return SyncState.pending;
      case 1:
        return SyncState.synced;
      case 2:
        return SyncState.failed;
      default:
        throw ArgumentError('Invalid integer value for SyncState: $value');
    }
  }
}