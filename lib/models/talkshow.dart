import '../models/major.dart';
import '../models/university.dart';

import '../models/counselor.dart';
import 'address.dart';

class Talkshow {
  int ID;
  String image;
  String timeStart;
  String timeFinish;
  String date;
  int price;
  Counselor counselor;
  String description;
  Major major;

  Talkshow({
    this.ID,
    this.image,
    this.timeStart,
    this.timeFinish,
    this.date,
    this.price,
    this.counselor,
    this.description,
    this.major,
  });

  static List<Talkshow> createListTalkshow() {
    List<Talkshow> list = [];
    for (int i = 0; i < 10; i++) {
      List<University> listUniversity = University.createListUniversity();
      Talkshow newTalkshow = Talkshow(
        ID: i + 1,
        image:
            'https://www.vjl.com.vn/img/baiviet/Talkshow-Bi-quyet-kh-fpkvo.png',
        timeStart: '${i + 1}0:20',
        timeFinish: '${i + 2}:20',
        date: ' on  20-10-2021',
        counselor: Counselor(
          ID: i,
          email: 'demo$i@gmail.com',
          fullName: 'Lê Văn Tài',
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
        major: Major(
          code: 'code $i',
          name: 'Software Engineer ($i)',
          listUniversity: listUniversity,
        ),
      );
      list.add(newTalkshow);
    }
    return list;
  }
}
