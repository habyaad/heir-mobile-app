import '../../../../../models/user.dart';

class Beneficiary{
  static User beneficiary1 = User(
      firstName: 'Olamide',
      lastName: 'Adekoya',
      email: 'Olakoez@heir.com',
      assetValue: 8266243.95,
      cardBalance: 0);
  static User beneficiary2 = User(
      firstName: 'Junior',
      lastName: 'Adekoya',
      email: 'koyajay21@heir.com',
      assetValue: 8266243.95,
      cardBalance: 0);
  static User beneficiary3 = User(
      firstName: 'Babs',
      lastName: 'Muyiwa',
      email: 'babswa@heir.com',
      assetValue: 8266243.95,
      cardBalance: 0);
  static User beneficiary4 = User(
      firstName: '',
      lastName: 'Priscy',
      email: 'priscychio@heir.com',
      assetValue: 8266243.95,
      cardBalance: 0);
  static List<User> beneficiaryList = [beneficiary1, beneficiary2, beneficiary3, beneficiary4];
}