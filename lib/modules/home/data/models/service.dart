import '../../../../core/constants/assets/app_icons.dart';

class Service {
  final String name;
  final String icon;
  final String price;

  Service({required this.name, required this.icon, required this.price});
}

List<Service> services = [
  Service(name: 'غسيل داخلى', icon: AppIcons.internalWashing, price: 'SAR  25.00'),
  Service(name: 'غسيل خارجى', icon: AppIcons.externalWashing, price: 'SAR  25.00'),
  Service(name: 'تلميع', icon: AppIcons.lightning, price: 'SAR  25.00'),
  Service(name: 'غسيل كيماوى', icon: AppIcons.chemicalWashing, price: 'SAR  25.00'),
];
