class BankDetailsModel {
  int? id;
  late String bankName;
  late String branch;
  late String accountType;
  late String accountNo;
  late String IFSCcode;

  BankDetailsModel(this.id,
      this.bankName,
      this.branch,
      this.accountType,
      this.accountNo,
      this.IFSCcode);
}
