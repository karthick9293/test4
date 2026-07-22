// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_details_bv.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GatewayDetailsBV> _$gatewayDetailsBVSerializer =
    _$GatewayDetailsBVSerializer();

class _$GatewayDetailsBVSerializer
    implements StructuredSerializer<GatewayDetailsBV> {
  @override
  final Iterable<Type> types = const [GatewayDetailsBV, _$GatewayDetailsBV];
  @override
  final String wireName = 'GatewayDetailsBV';

  @override
  Iterable<Object?> serialize(Serializers serializers, GatewayDetailsBV object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'PG_REDIRECT_URL',
      serializers.serialize(object.pgRedcirectURL,
          specifiedType: const FullType(String)),
      'Amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(String)),
      'CurrencyCode',
      serializers.serialize(object.currencyCode,
          specifiedType: const FullType(String)),
      'PUN',
      serializers.serialize(object.pun, specifiedType: const FullType(String)),
      'MerchantModuleSessionID',
      serializers.serialize(object.merchantModuleSessionID,
          specifiedType: const FullType(String)),
      'PaymentDescription',
      serializers.serialize(object.paymentDescription,
          specifiedType: const FullType(String)),
      'NationalID',
      serializers.serialize(object.nationalID,
          specifiedType: const FullType(String)),
      'MerchantID',
      serializers.serialize(object.merchantID,
          specifiedType: const FullType(String)),
      'BankID',
      serializers.serialize(object.bankID,
          specifiedType: const FullType(String)),
      'Action',
      serializers.serialize(object.action,
          specifiedType: const FullType(String)),
      'Lang',
      serializers.serialize(object.lang, specifiedType: const FullType(String)),
      'SecureHash',
      serializers.serialize(object.secureHash,
          specifiedType: const FullType(String)),
      'TransactionRequestDate',
      serializers.serialize(object.transactionRequestDate,
          specifiedType: const FullType(String)),
      'ExtraFields_f3',
      serializers.serialize(object.extraFieldsF3,
          specifiedType: const FullType(String)),
      'ExtraFields_f14',
      serializers.serialize(object.extraFieldsF14,
          specifiedType: const FullType(String)),
      'Quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GatewayDetailsBV deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GatewayDetailsBVBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'PG_REDIRECT_URL':
          result.pgRedcirectURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'Amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'CurrencyCode':
          result.currencyCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'PUN':
          result.pun = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'MerchantModuleSessionID':
          result.merchantModuleSessionID = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'PaymentDescription':
          result.paymentDescription = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'NationalID':
          result.nationalID = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'MerchantID':
          result.merchantID = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'BankID':
          result.bankID = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'Action':
          result.action = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'Lang':
          result.lang = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'SecureHash':
          result.secureHash = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'TransactionRequestDate':
          result.transactionRequestDate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'ExtraFields_f3':
          result.extraFieldsF3 = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'ExtraFields_f14':
          result.extraFieldsF14 = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'Quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GatewayDetailsBV extends GatewayDetailsBV {
  @override
  final String pgRedcirectURL;
  @override
  final String amount;
  @override
  final String currencyCode;
  @override
  final String pun;
  @override
  final String merchantModuleSessionID;
  @override
  final String paymentDescription;
  @override
  final String nationalID;
  @override
  final String merchantID;
  @override
  final String bankID;
  @override
  final String action;
  @override
  final String lang;
  @override
  final String secureHash;
  @override
  final String transactionRequestDate;
  @override
  final String extraFieldsF3;
  @override
  final String extraFieldsF14;
  @override
  final String quantity;

  factory _$GatewayDetailsBV(
          [void Function(GatewayDetailsBVBuilder)? updates]) =>
      (GatewayDetailsBVBuilder()..update(updates))._build();

  _$GatewayDetailsBV._(
      {required this.pgRedcirectURL,
      required this.amount,
      required this.currencyCode,
      required this.pun,
      required this.merchantModuleSessionID,
      required this.paymentDescription,
      required this.nationalID,
      required this.merchantID,
      required this.bankID,
      required this.action,
      required this.lang,
      required this.secureHash,
      required this.transactionRequestDate,
      required this.extraFieldsF3,
      required this.extraFieldsF14,
      required this.quantity})
      : super._();
  @override
  GatewayDetailsBV rebuild(void Function(GatewayDetailsBVBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GatewayDetailsBVBuilder toBuilder() =>
      GatewayDetailsBVBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GatewayDetailsBV &&
        pgRedcirectURL == other.pgRedcirectURL &&
        amount == other.amount &&
        currencyCode == other.currencyCode &&
        pun == other.pun &&
        merchantModuleSessionID == other.merchantModuleSessionID &&
        paymentDescription == other.paymentDescription &&
        nationalID == other.nationalID &&
        merchantID == other.merchantID &&
        bankID == other.bankID &&
        action == other.action &&
        lang == other.lang &&
        secureHash == other.secureHash &&
        transactionRequestDate == other.transactionRequestDate &&
        extraFieldsF3 == other.extraFieldsF3 &&
        extraFieldsF14 == other.extraFieldsF14 &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pgRedcirectURL.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, pun.hashCode);
    _$hash = $jc(_$hash, merchantModuleSessionID.hashCode);
    _$hash = $jc(_$hash, paymentDescription.hashCode);
    _$hash = $jc(_$hash, nationalID.hashCode);
    _$hash = $jc(_$hash, merchantID.hashCode);
    _$hash = $jc(_$hash, bankID.hashCode);
    _$hash = $jc(_$hash, action.hashCode);
    _$hash = $jc(_$hash, lang.hashCode);
    _$hash = $jc(_$hash, secureHash.hashCode);
    _$hash = $jc(_$hash, transactionRequestDate.hashCode);
    _$hash = $jc(_$hash, extraFieldsF3.hashCode);
    _$hash = $jc(_$hash, extraFieldsF14.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GatewayDetailsBV')
          ..add('pgRedcirectURL', pgRedcirectURL)
          ..add('amount', amount)
          ..add('currencyCode', currencyCode)
          ..add('pun', pun)
          ..add('merchantModuleSessionID', merchantModuleSessionID)
          ..add('paymentDescription', paymentDescription)
          ..add('nationalID', nationalID)
          ..add('merchantID', merchantID)
          ..add('bankID', bankID)
          ..add('action', action)
          ..add('lang', lang)
          ..add('secureHash', secureHash)
          ..add('transactionRequestDate', transactionRequestDate)
          ..add('extraFieldsF3', extraFieldsF3)
          ..add('extraFieldsF14', extraFieldsF14)
          ..add('quantity', quantity))
        .toString();
  }
}

class GatewayDetailsBVBuilder
    implements Builder<GatewayDetailsBV, GatewayDetailsBVBuilder> {
  _$GatewayDetailsBV? _$v;

  String? _pgRedcirectURL;
  String? get pgRedcirectURL => _$this._pgRedcirectURL;
  set pgRedcirectURL(String? pgRedcirectURL) =>
      _$this._pgRedcirectURL = pgRedcirectURL;

  String? _amount;
  String? get amount => _$this._amount;
  set amount(String? amount) => _$this._amount = amount;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  String? _pun;
  String? get pun => _$this._pun;
  set pun(String? pun) => _$this._pun = pun;

  String? _merchantModuleSessionID;
  String? get merchantModuleSessionID => _$this._merchantModuleSessionID;
  set merchantModuleSessionID(String? merchantModuleSessionID) =>
      _$this._merchantModuleSessionID = merchantModuleSessionID;

  String? _paymentDescription;
  String? get paymentDescription => _$this._paymentDescription;
  set paymentDescription(String? paymentDescription) =>
      _$this._paymentDescription = paymentDescription;

  String? _nationalID;
  String? get nationalID => _$this._nationalID;
  set nationalID(String? nationalID) => _$this._nationalID = nationalID;

  String? _merchantID;
  String? get merchantID => _$this._merchantID;
  set merchantID(String? merchantID) => _$this._merchantID = merchantID;

  String? _bankID;
  String? get bankID => _$this._bankID;
  set bankID(String? bankID) => _$this._bankID = bankID;

  String? _action;
  String? get action => _$this._action;
  set action(String? action) => _$this._action = action;

  String? _lang;
  String? get lang => _$this._lang;
  set lang(String? lang) => _$this._lang = lang;

  String? _secureHash;
  String? get secureHash => _$this._secureHash;
  set secureHash(String? secureHash) => _$this._secureHash = secureHash;

  String? _transactionRequestDate;
  String? get transactionRequestDate => _$this._transactionRequestDate;
  set transactionRequestDate(String? transactionRequestDate) =>
      _$this._transactionRequestDate = transactionRequestDate;

  String? _extraFieldsF3;
  String? get extraFieldsF3 => _$this._extraFieldsF3;
  set extraFieldsF3(String? extraFieldsF3) =>
      _$this._extraFieldsF3 = extraFieldsF3;

  String? _extraFieldsF14;
  String? get extraFieldsF14 => _$this._extraFieldsF14;
  set extraFieldsF14(String? extraFieldsF14) =>
      _$this._extraFieldsF14 = extraFieldsF14;

  String? _quantity;
  String? get quantity => _$this._quantity;
  set quantity(String? quantity) => _$this._quantity = quantity;

  GatewayDetailsBVBuilder();

  GatewayDetailsBVBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pgRedcirectURL = $v.pgRedcirectURL;
      _amount = $v.amount;
      _currencyCode = $v.currencyCode;
      _pun = $v.pun;
      _merchantModuleSessionID = $v.merchantModuleSessionID;
      _paymentDescription = $v.paymentDescription;
      _nationalID = $v.nationalID;
      _merchantID = $v.merchantID;
      _bankID = $v.bankID;
      _action = $v.action;
      _lang = $v.lang;
      _secureHash = $v.secureHash;
      _transactionRequestDate = $v.transactionRequestDate;
      _extraFieldsF3 = $v.extraFieldsF3;
      _extraFieldsF14 = $v.extraFieldsF14;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GatewayDetailsBV other) {
    _$v = other as _$GatewayDetailsBV;
  }

  @override
  void update(void Function(GatewayDetailsBVBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GatewayDetailsBV build() => _build();

  _$GatewayDetailsBV _build() {
    final _$result = _$v ??
        _$GatewayDetailsBV._(
          pgRedcirectURL: BuiltValueNullFieldError.checkNotNull(
              pgRedcirectURL, r'GatewayDetailsBV', 'pgRedcirectURL'),
          amount: BuiltValueNullFieldError.checkNotNull(
              amount, r'GatewayDetailsBV', 'amount'),
          currencyCode: BuiltValueNullFieldError.checkNotNull(
              currencyCode, r'GatewayDetailsBV', 'currencyCode'),
          pun: BuiltValueNullFieldError.checkNotNull(
              pun, r'GatewayDetailsBV', 'pun'),
          merchantModuleSessionID: BuiltValueNullFieldError.checkNotNull(
              merchantModuleSessionID,
              r'GatewayDetailsBV',
              'merchantModuleSessionID'),
          paymentDescription: BuiltValueNullFieldError.checkNotNull(
              paymentDescription, r'GatewayDetailsBV', 'paymentDescription'),
          nationalID: BuiltValueNullFieldError.checkNotNull(
              nationalID, r'GatewayDetailsBV', 'nationalID'),
          merchantID: BuiltValueNullFieldError.checkNotNull(
              merchantID, r'GatewayDetailsBV', 'merchantID'),
          bankID: BuiltValueNullFieldError.checkNotNull(
              bankID, r'GatewayDetailsBV', 'bankID'),
          action: BuiltValueNullFieldError.checkNotNull(
              action, r'GatewayDetailsBV', 'action'),
          lang: BuiltValueNullFieldError.checkNotNull(
              lang, r'GatewayDetailsBV', 'lang'),
          secureHash: BuiltValueNullFieldError.checkNotNull(
              secureHash, r'GatewayDetailsBV', 'secureHash'),
          transactionRequestDate: BuiltValueNullFieldError.checkNotNull(
              transactionRequestDate,
              r'GatewayDetailsBV',
              'transactionRequestDate'),
          extraFieldsF3: BuiltValueNullFieldError.checkNotNull(
              extraFieldsF3, r'GatewayDetailsBV', 'extraFieldsF3'),
          extraFieldsF14: BuiltValueNullFieldError.checkNotNull(
              extraFieldsF14, r'GatewayDetailsBV', 'extraFieldsF14'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'GatewayDetailsBV', 'quantity'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
