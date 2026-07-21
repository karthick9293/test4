class SecuritySettingsParams {
  bool pin, faceId, biometric, uidai, notofications, forexRateAlert, remittanceRateAlert;

  SecuritySettingsParams(
      {this.pin = false,
      this.faceId = false,
      this.biometric = false,
      this.uidai = false,
      this.notofications = false,
      this.forexRateAlert = false,
      this.remittanceRateAlert = false});
}
