import 'package:evently_project/screens/eventCreation/eventInfo/eventModel.dart';
import 'package:evently_project/utils/appAssets.dart';

class EventRepository {
  static List<EventModel> events = [];
  static Map<String, String> categoryImages = {
    'sport': AppAssets.sportEventImg,
    'birthday': AppAssets.birthdayEventImg,
    'meeting': AppAssets.meetingEventImg,
    'gaming': AppAssets.gamingEventImg,
    'eating': AppAssets.eatingEventImg,
    'holiday': AppAssets.holidayEventImg,
    'exhibition': AppAssets.exhibitionEventImg,
    'workshop': AppAssets.workshopEventImg,
    'bookclub': AppAssets.bookClubEventImg,
  };
}