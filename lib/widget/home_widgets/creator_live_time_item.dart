import 'package:tetralive/utils/img.dart';

//livedate

// List<dynamic> livesdate = [
//   {
//     'image': Imag.live_img2,
//     'image_poster': Imag.live_img5,
//     'title': 'ElectrifiedHorse',
//     'sub_title': '- Fusion music and Rock',
//     'title_date': 'Going live on ',
//     'live_date': '15 Aug | 06:00PM',
//     'comment': '50 ',
//   },
//   {
//     'image': Imag.live_img3,
//     'image_poster': Imag.live_img7,
//     'title': 'ElectrifiedHorse',
//     'sub_title': '- Fusion music and Rock',
//     'title_date': 'Going live on ',
//     'live_date': '15 Aug | 06:00PM',
//     'comment': '30 ',
//   },
//   {
//     'image': Imag.live_img1,
//     'image_poster': Imag.live_img5,
//     'title': 'ElectrifiedHorse',
//     'sub_title': '- Fusion music and Rock',
//     'title_date': 'Going live on ',
//     'live_date': '15 Aug | 06:00PM',
//     'comment': '20 ',
//   },
// ];

List<LiveDate> liveDate = <LiveDate>[
  LiveDate(
      image: Imag.live_img1,
      imagePoster: Imag.live_img4,
      title: "ElectrifiedHorse",
      subTitle: "- Fusion music and Rock",
      dateTitle: "Going live on ",
      liveDate: "15 Aug | 06:00PM",
      comment: "20"),
  LiveDate(
      image: Imag.live_img3,
      imagePoster: Imag.live_img4,
      title: "ElectrifiedHorse",
      subTitle: "- Fusion music and Rock",
      dateTitle: "Going live on ",
      liveDate: "15 Aug | 06:00PM",
      comment: "20"),
];

class LiveDate {
  final String? image;
  final String? imagePoster;
  final String? title;
  final String? subTitle;
  final String? dateTitle;
  final String? liveDate;
  final String? comment;

  LiveDate(
      {this.image,
      this.imagePoster,
      this.title,
      this.subTitle,
      this.dateTitle,
      this.liveDate,
      this.comment});
}
