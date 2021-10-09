import 'package:mobile_customer/models/user.dart';

class Talkshow {
  int ID;
  String image;
  String timeStart;
  String timeFinish;
  int price;
  User speaker;
  String description;

  Talkshow(
      {this.ID,
      this.image,
      this.timeStart,
      this.timeFinish,
      this.price,
      this.speaker,
      this.description});

  static List<Talkshow> createListTalkshow() {
    List<Talkshow> list = [];
    for (int i = 0; i < 10; i++) {
      Talkshow newTalkshow = Talkshow(
        ID: i + 1,
        image:
            'https://www.vjl.com.vn/img/baiviet/Talkshow-Bi-quyet-kh-fpkvo.png',
        timeStart: '${i + 1}0:20',
        timeFinish: '${i + 2}:20',
        speaker: User(
          email: 'demo$i@gmail.com',
          fullName: 'Demo$i',
          phone: '096119173$i',
          image:
              'https://danongonline.com.vn/wp-content/uploads/2018/02/anh-girl-xinh-mat-moc-9.jpg',
          address:
              'A1$i/5 Đường sô 441, Lê Văn Việt, Quận 9, Thành Phố Thủ Đức',
          description: 'I am a handsome boy, I love pink and hate lies $i',
          gender: 'Male $i',
          birthday: '03/07/1998',
        ),
        price: i + 2,
        description:
            'This is a talkshow about FPT University. We have alot of story about this university.',
      );
      list.add(newTalkshow);
    }
    return list;
  }
}
