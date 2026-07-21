enum Flavor {
  casmex,
  lmpay,
  globalexchange,
  cityexchangeuae,
  lakhoos,
  kabayanremit,
  dohaexchange,
  cityexchange,
  royalgrowth,
  sharafexchange,
  unimonioman,
  aljazeeraexchangeqatar,
  hamdanexchange,
  aljadeed,
  omanexchange,
  alsaddexchange,
  kiecoexchange,
  easternexchange,
  alzamanexchange,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.casmex:
        return 'Casmex';
      case Flavor.lmpay:
        return 'LMPAY';
      case Flavor.globalexchange:
        return 'Global Exchange';
      case Flavor.cityexchangeuae:
        return 'City Exchange UAE';
      case Flavor.lakhoos:
        return 'Lakhoos';
      case Flavor.kabayanremit:
        return 'Kabayan Remit';
      case Flavor.dohaexchange:
        return 'Doha Exchange';
      case Flavor.cityexchange:
        return 'City Exchange';
      case Flavor.royalgrowth:
        return 'Royal Growth';
      case Flavor.sharafexchange:
        return 'Sharaf Exchange';
      case Flavor.unimonioman:
        return 'Unimoni Oman';
      case Flavor.aljazeeraexchangeqatar:
        return 'Al Jazeera Exchange Qatar';
      case Flavor.hamdanexchange:
        return 'HamdanPay';
      case Flavor.aljadeed:
        return 'Al Jadeed';
      case Flavor.omanexchange:
        return 'Oman Exchange';
      case Flavor.alsaddexchange:
        return 'Alsadd Exchange';
      case Flavor.kiecoexchange:
        return 'KIECO Exchange';
      case Flavor.easternexchange:
        return 'Eastern Exchange';
      case Flavor.alzamanexchange:
        return 'Alzaman Exchange';
    }
  }

}
