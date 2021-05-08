import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nueva_app/Place/model/place.dart';
import 'package:nueva_app/Place/ui/widgets/card_image.dart';
import 'package:nueva_app/User/model/user.dart';
import 'package:nueva_app/User/repository/cloud_firestore_api.dart';
import 'package:nueva_app/User/ui/widgets/photo_card.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreAPI.updatePlaceData(place);

  List<PhotoCard> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);

  List<CardImageWithFabIcon> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreAPI.buildPlaces(placesListSnapshot);
}
