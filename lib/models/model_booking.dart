class ModelBooking {
  String? serviceName;
  String? date;
  String? startTime;
  String? endTime;
  String? noOfRooms;
  String? squareFeet;
  String? image;
  String? providerName;
  String? tag;
  String? day;
  String? status; // Current status of the booking

  // Static list of possible booking statuses
  static const List<String> bookingStatuses = [
    "Pending",
    "Travelling",
    "Started",
    "Completed"
  ];

  ModelBooking(
      this.serviceName,
      this.date,
      this.startTime,
      this.endTime,
      this.noOfRooms,
      this.squareFeet,
      this.image,
      this.providerName,
      this.tag,
      this.day, {
        this.status = "Pending", // Default status is "Pending"
      });
}
