// import 'package:provider_man_app/app/models/model_booking.dart';
// import 'package:provider_man_app/app/models/model_chat.dart';
// import 'package:provider_man_app/app/models/model_message.dart';
// import 'package:provider_man_app/app/models/model_review.dart';

import '../models/model_booking.dart';
import '../models/model_chat.dart';
import '../models/model_country.dart';
import '../models/model_message.dart';
import '../models/model_review.dart';

class DataFile {
  static List<ModelCountry> countryList = [
    ModelCountry("image_fghanistan.jpg", "Afghanistan (AF)", "+93"),
    ModelCountry("image_ax.jpg", "Aland Islands (AX)", "+358"),
    ModelCountry("image_albania.jpg", "Albania (AL)", "+355"),
    ModelCountry("image_andora.jpg", "Andorra (AD)", "+376"),
    ModelCountry("image_islands.jpg", "Aland Islands (AX)", "+244"),
    ModelCountry("image_angulia.jpg", "Anguilla (AL)", "+1"),
    ModelCountry("image_armenia.jpg", "Armenia (AN)", "+374"),
    ModelCountry("image_austia.jpg", "Austria (AT)", "+372"),
  ];

  static List<ModelBooking> bookingList = [
    ModelBooking("Cleaning", "14-02-2025", "08:00 am", "10:00 pm", "4", "1050",
        "booking_owner.png", "Mendy Wilson", "Approved", "14-02-2025",
        status: ModelBooking.bookingStatuses[0]),
    ModelBooking("Cleaning", "14-02-2025", "11:00 am", "1:00 pm", "2", "400",
        "booking_owner1.png", "Jenny Winget", "Approved", "14-02-2025",
        status: ModelBooking.bookingStatuses[1]),
    ModelBooking("Cleaning", "14-02-2025", "03:00 pm", "5:00 pm", "3", "850",
        "booking_owner2.png", "Jacob Jones", "Approved", "14-02-2025",
        status: ModelBooking.bookingStatuses[2]),
    ModelBooking("Cleaning", "13-02-2025", "06:00 pm", "7:00 pm", "1", "200",
        "booking_owner3.png", "Ronald Richards", "Approved", "13-02-2025",
        status: ModelBooking.bookingStatuses[3])
  ];

  static List<ModelReview> reviewList = [
    ModelReview("booking_owner.png", "Mendy Wilson"),
    ModelReview("booking_owner1.png", "Leslie Alexander"),
    ModelReview("booking_owner2.png", "Ralph Edwards"),
    ModelReview("booking_owner3.png", "Ronald Richards")
  ];

  static List<ModelChat> chatList = [
    ModelChat("chat1.png", "Nick Jonas", "1 h ago"),
    ModelChat("chat2.png", "Leslie Alexander", "1 d ago"),
    ModelChat("chat3.png", "Robert Fox", "1 d ago"),
    ModelChat("chat4.png", "Ralph Edwards", "3 d ago"),
    ModelChat("chat5.png", "Arlene McCoy", "4 d ago"),
    ModelChat("chat6.png", "Eleanor Pena", "5 d ago")
  ];

  static List<ModelMessage> messageList = [
    ModelMessage("Lorem ipsum dolor sit amet", "01:00 AM", "receiver"),
    ModelMessage("From its medieval origins", "01:01 AM", "sender"),
    ModelMessage(
        "Duis aute irure dolor in reprehenderit", "01:02 AM", "receiver"),
    ModelMessage("Reserunt mollit anim id est labor.", "01:03 AM", "sender"),
    ModelMessage("voluptate velit esse cillum", "01:03 AM", "receiver")
  ];
}
