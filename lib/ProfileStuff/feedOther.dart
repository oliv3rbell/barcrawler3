import 'feedModel.dart';

class TweetHelper {

  static var tweets = [
    TweetItemModel("Weston Has Checkedin to the Box", "BarCheckin", "3m", "WestonSeniw"),
    TweetItemModel("Jeremy Has CheckedOut of the Box ", "BarCheckOut", "5m", "JeremyHansen"),
    TweetItemModel("Jeremy Has Checkin to the Box", "BarCheckIn", "30m", "JeremyHansen"),
    TweetItemModel("Weston Has Checkedin to the Box", "BarCheckin", "35m", "WestonSeniw"),
    TweetItemModel("Jeremy Has CheckedOut of the Box ", "BarCheckOut", "40m", "JeremyHansen"),
    TweetItemModel("Jeremy Has Checkin to the Box", "BarCheckIn", "45m", "JeremyHansen"),
    TweetItemModel("Weston Has Checkedin to the Box", "BarCheckin", "51m", "WestonSeniw"),
    TweetItemModel("Jeremy Has CheckedOut of the Box ", "BarCheckOut", "56m", "JeremyHansen"),
    TweetItemModel("Jeremy Has Checkin to the Box", "BarCheckIn", "60m", "JeremyHansen"),
  ];

  static TweetItemModel getTweet(int position) {
    return tweets[position];
  }

}