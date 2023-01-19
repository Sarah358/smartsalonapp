import 'package:nb_utils/nb_utils.dart';

import '../models/BMAppointmentModel.dart';
import '../models/BMCommentModel.dart';
import '../models/BMCommonCardModel.dart';
import '../models/BMDashboardModel.dart';
import '../models/BMMasterModel.dart';
import '../models/BMMessageModel.dart';
import '../models/BMServiceListModel.dart';
import '../models/BMShoppingModel.dart';

List<WalkThroughModelClass> getWalkThroughList() {
  List<WalkThroughModelClass> list = [];

  list.add(WalkThroughModelClass(image: 'images/model_one.jpg', title: 'Book a visit easy & fast', subTitle: 'Book your favourite stylist by a few clicks.'));
  list.add(WalkThroughModelClass(image: 'images/model_two.jpg', title: 'Online Services Booking', subTitle: 'For when visiting the shop or salon is not an option, experience beauty in new way.'));
  list.add(WalkThroughModelClass(image: 'images/model_three.jpg', title: 'Book anytime, anywhere', subTitle: 'Access calenders, services, and reviews wuth the freedom to book as you please.'));

  return list;
}

List<BMDashboardModel> getDashboardList() {
  List<BMDashboardModel> list = [];

  list.add(BMDashboardModel(selectedIcon: 'images/home.png', unSelectedIcon: 'images/house.png'));
  list.add(BMDashboardModel(selectedIcon: 'images/magnifier.png', unSelectedIcon: 'images/search.png'));
  list.add(BMDashboardModel(selectedIcon: 'images/calendar_selected.png', unSelectedIcon: 'images/calendar.png'));
  list.add(BMDashboardModel(selectedIcon: 'images/chat_selected.png', unSelectedIcon: 'images/chat.png'));
  list.add(BMDashboardModel(selectedIcon: 'images/more_selected.png', unSelectedIcon: 'images/more.png'));

  return list;
}

List<BMMasterModel> getMyMastersList() {
  List<BMMasterModel> list = [];

  list.add(BMMasterModel(image: 'images/face_two.jpg', name: 'Sarah Brians'));
  list.add(BMMasterModel(image: 'images/face_one.png', name: 'John Mark'));
  list.add(BMMasterModel(image: 'images/model_three.jpg', name: 'Oliver Benson'));

  return list;
}

List<BMMasterModel> getTopServicesHomeList() {
  List<BMMasterModel> list = [];

  list.add(BMMasterModel(image: 'images/salon.png', name: 'Hair'));
   list.add(BMMasterModel(image: 'images/nail-polish.png', name: 'Nails'));
  list.add(BMMasterModel(image: 'images/makeup.png', name: 'Facial'));
  list.add(BMMasterModel(image: 'images/massage.jpg', name: 'Massage'));
  list.add(BMMasterModel(image: 'images/barber.jpg', name: 'Barber'));
  list.add(BMMasterModel(image: 'images/makeup_kit.png', name: 'Makeup'));

  return list;
}

List<BMCommonCardModel> getSpecialOffersList() {
  List<BMCommonCardModel> list = [];

  list.add(BMCommonCardModel(
    title: 'Stitch Lines',
    image: 'images/stitches.jpg',
    saveTag: true,
    subtitle: 'Get the best stitch lines at 20% off',
    rating: '5.0',
    comments: '240',
    distance: 'ksh 1500',
    liked: true,
  ));
  list.add(BMCommonCardModel(
    title: 'Cornrows',
    image: 'images/screen-8.jpg',
    saveTag: true,
    subtitle: 'Get the best cornrow styles at an affordable price',
    rating: '4.9',
    comments: '192',
    distance: 'Ksh 1500',
    liked: false,
  ));
  list.add(BMCommonCardModel(
    title: 'Fresh Cuts',
    image: 'images/cuts.jpeg',
    saveTag: true,
    subtitle: 'Enjoy our fresh haircuts at 20% off',
    rating: '5.0',
    comments: '240',
    distance: 'Ksh 500',
    liked: true,
  ));
  list.add(BMCommonCardModel(
    title: 'Aclyrics Nails',
    image: 'images/nails.jpg',
    saveTag: true,
    subtitle: 'Aclyrics nails at 20% off ',
    rating: '4.8',
    comments: '120',
    distance: 'Ksh 1000',
    liked: false,
  ));

  list.shuffle();

  return list;
}

List<BMCommonCardModel> getFavList() {
  List<BMCommonCardModel> list = [];

  list.add(BMCommonCardModel(
    title: 'Natural Hairstyles',
    image: 'images/natural.jpg',
    saveTag: false,
    subtitle: 'Get natural hairstyles from our best hairstyles',
    rating: '5.0',
    comments: '240',
    distance: 'from ksh 500',
    liked: true,
  ));
  list.add(BMCommonCardModel(
    title: 'Makeup',
    image: 'images/makeuplook.jpg',
    saveTag: false,
    subtitle: 'Makeup services at the best rates',
    rating: '4.9',
    comments: '192',
    distance: 'from Ksh 1000',
    liked: true,
  ));
  list.add(BMCommonCardModel(
    title: 'Knotless Braids',
    image: 'images/knotless.jpg',
    saveTag: false,
    subtitle: 'painless and light knotless braids ',
    rating: '5.0',
    comments: '240',
    distance: 'from Ksh 2000',
    liked: true,
  ));
  list.add(BMCommonCardModel(
    title: 'DreadLocs',
    image: 'images/locs.jpg',
    saveTag: false,
    subtitle: 'We offer the best dreadlocs styles ',
    rating: '4.8',
    comments: '150',
    distance: 'from Ksh 1000',
    liked: true,
  ));

  list.shuffle();

  return list;
}

List<BMCommonCardModel> getRecommendedList() {
  List<BMCommonCardModel> list = [];

  list.add(BMCommonCardModel(
    title: 'Natural Hairstyles',
    image: 'images/natural.jpg',
    saveTag: false,
    subtitle: 'Get natural hairstyles from our best hairstyles',
    rating: '4.8',
    comments: '1.2k',
    distance: 'from ksh 500',
    liked: false,
    likes: '124',
  ));
  list.add(BMCommonCardModel(
    title: 'Makeup Looks ',
    image: 'images/makeuplook.jpg',
    saveTag: false,
    subtitle: 'Makeup services at the best rates',
    rating: '5.0',
    comments: '240',
    distance: 'from ksh 1000',
    liked: true,
    likes: '23',
  ));

  list.add(BMCommonCardModel(
    title: 'Knotless Braids',
    image: 'images/knotless.jpg',
    saveTag: false,
    subtitle: 'Easy,painless and light knotless braids',
    rating: '5.0',
    comments: '240',
    distance: 'from ksh 2000',
    liked: true,
    likes: '258',
  ));
  list.add(BMCommonCardModel(
    title: 'DreadLocs',
    image: 'images/locs.jpg',
    saveTag: false,
    subtitle: 'We offer the best dreadlocs styles',
    rating: '4.9',
    comments: '192',
    distance: 'from ksh 2000',
    liked: false,
    likes: '501',
  ));

  return list;
}

List<BMServiceListModel> getPopularServiceList() {
  List<BMServiceListModel> list = [];

  list.add(BMServiceListModel(name: 'Men\'s Hair cut', cost: 'ksh 500', time: '1h'));
  list.add(BMServiceListModel(name: 'Men\'s Hair cut with beard', cost: 'ksh 450', time: '30min'));
  list.add(BMServiceListModel(name: 'Full makeup', cost: 'ksh 1500', time: '1h'));

  return list;
}

List<BMServiceListModel> getOtherServiceList() {
  List<BMServiceListModel> list = [];

  list.add(BMServiceListModel(name: 'Knottless Braids', cost: 'ksh 2500', time: '35min'));
  list.add(BMServiceListModel(name: 'Full body massage', cost: 'Ksh 1800', time: '30min'));
  list.add(BMServiceListModel(name: 'Manicure with aclyrics', cost: 'ksh 1200', time: '45min'));
  list.add(BMServiceListModel(name: 'Body scrubbing + sauna', cost: 'ksh 2000', time: '30min'));
  list.add(BMServiceListModel(name: 'Men\'s Hair cut', cost: 'ksh 500', time: '15min'));
  list.add(BMServiceListModel(name: 'Edge w/Beard trim beard', cost: 'ksh 500', time: '30min'));

  return list;
}

List<BMCommentModel> getCommentsList() {
  List<BMCommentModel> list = [];

  list.add(BMCommentModel(image: 'images/face_one.png', likes: '4', time: '3m', name: 'John', message: 'Nice work, bro!', isSubComment: false, isLiked: false));
  list.add(BMCommentModel(image: 'images/face_two.jpg', likes: '2', time: '3m', name: 'Sarah', message: 'How many time for this style?', isSubComment: false, isLiked: true));
  list.add(BMCommentModel(image: 'images/face_one.png', likes: '2', time: '3m', name: 'John', message: '45 minutes. maybe.', isSubComment: true, isLiked: false));
  list.add(BMCommentModel(image: 'images/face_two.jpg', likes: '4', time: '20m', name: 'Sarah', message: 'Good work!', isSubComment: false, isLiked: false));
  list.add(BMCommentModel(image: 'images/face_one.png', likes: '4', time: '2d', name: 'John', message: 'Suite with me, let\'s go!', isSubComment: false, isLiked: false));

  return list;
}

List<BMAppointmentModel> getAppointments() {
  List<BMAppointmentModel> list = [];

  list.add(BMAppointmentModel(
    image: 'images/face_one.png',
    time: '3:00 PM - 4.00 PM (1h)',
    isSelected: true,
    product: 'Hair services',
    salonName: 'Knotless Braids (2000)',
    service: 'John  (5)' ,
  ));

  return list;
}

List<BMAppointmentModel> getMoreAppointmentsList() {
  List<BMAppointmentModel> list = [];

  list.add(BMAppointmentModel(
    image: 'images/model_three.jpg',
    time: '8:00 AM - 9.00 AM (1d)',
    isSelected: false,
    product: 'makeup services',
    salonName: 'Full makeup (1500)',
    service: 'Sarah(4.5)',
  ));
  list.add(BMAppointmentModel(
    image: 'images/face_two.jpg',
    time: '2:00 PM - 3:00 PM',
    isSelected: false,
    product: 'Barber services',
    salonName: 'Shave (500)',
    service: 'Olive (3)',
  ));

  return list;
}

List<BMMessageModel> getActiveList() {
  List<BMMessageModel> list = [];

  list.add(BMMessageModel(image: 'images/face_two.jpg', name: 'Sarah', message: 'Hello!', isActive: true, lastSeen: ''));
  list.add(BMMessageModel(image: 'images/face_two.jpg', name: 'Sarah', message: 'How can I help you?', isActive: true, lastSeen: ''));

  return list;
}

List<BMMessageModel> getMessageList() {
  List<BMMessageModel> list = [];

  list.add(BMMessageModel(image: 'images/face_two.jpg', name: 'Sarah', message: 'Hello!', isActive: true, lastSeen: ''));
  list.add(BMMessageModel(image: 'images/face_one.png', name: 'John', message: 'Do you want to confirm yor appointment?', isActive: false, lastSeen: 'today , at 11:30 am'));
  list.add(BMMessageModel(image: 'images/model_three.jpg', name: 'Oliver', message: 'How can I help you?', isActive: true, lastSeen: ''));

  return list;
}

List<BMShoppingModel> getProductList() {
  List<BMShoppingModel> list = [];

  list.add(BMShoppingModel(
    name: 'Intensive Theraphy Choco Gotas Shine',
    image: 'images/product_one.jpg',
    cost: '\$35.00',
    isAdded: true,
    items: 1,
    mrp: '\$40.29',
    rate: '4.9',
    views: '(135)',
  ));
  list.add(BMShoppingModel(
    name: 'Kiwi Skin boosterz',
    image: 'images/product_two.png',
    cost: '\$29.99',
    isAdded: false,
    items: 1,
    mrp: '\$35.00',
    rate: '4.9',
    views: '(240)',
  ));
  list.add(BMShoppingModel(
    name: 'Intensive Theraphy Choco Gotas Shine',
    image: 'images/product_three.jpg',
    cost: '\$35.00',
    isAdded: false,
    items: 1,
    mrp: '\$40.29',
    rate: '4.9',
    views: '(135)',
  ));

  return list;
}

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(id: 1, name: 'English', languageCode: 'en', fullLanguageCode: 'en-US', flag: 'images/flag/ic_us.png'),
    LanguageDataModel(id: 2, name: 'Hindi', languageCode: 'hi', fullLanguageCode: 'hi-IN', flag: 'images/flag/ic_hi.png'),
    LanguageDataModel(id: 3, name: 'Arabic', languageCode: 'ar', fullLanguageCode: 'ar-AR', flag: 'images/flag/ic_ar.png'),
    LanguageDataModel(id: 4, name: 'French', languageCode: 'fr', fullLanguageCode: 'fr-FR', flag: 'images/flag/ic_fr.png'),
  ];
}
