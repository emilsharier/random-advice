class NotificationService {
  // This method is used to send notification message
  void sendNotification(String data) {}

  Future onSelectNotification(String data) {
    print("Recevied data from notification : $data");
  }
}
