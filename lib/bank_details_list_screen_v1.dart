import 'package:flutter/material.dart';
import 'package:flutter_database_bank_details/bank_details_form_screen.dart';
import 'package:flutter_database_bank_details/bank_details_list_screen_v1.dart';
import 'bank_details_model.dart';
import 'database_helper.dart';
import 'edit_bank_details_form_screen.dart';
import 'main.dart';

class BankDetailsListScreenv1 extends StatefulWidget {
  const BankDetailsListScreenv1({super.key});

  @override
  State<BankDetailsListScreenv1> createState() => _BankDetailsListScreenv1State();
}

class _BankDetailsListScreenv1State extends State<BankDetailsListScreenv1> {
  late List<BankDetailsModel> _bankDetailsList;

  @override
  void initState() {
    super.initState();
    getAllBankDetails();
  }

  getAllBankDetails() async {
    _bankDetailsList = <BankDetailsModel>[];

    var bankDetailRecords =
    await dbHelper.queryAllRows(DatabaseHelper.bankDetailsTable);

    bankDetailRecords.forEach((bankDetail) {
      setState(() {

        print(bankDetail['_id']);
        print(bankDetail['_bankName']);
        print(bankDetail['_branch']);
        print(bankDetail['_accountType']);
        print(bankDetail['_accountNo']);
        print(bankDetail['_IFSCcode']);

        var bankDetailsModel = BankDetailsModel(
          bankDetail['_id'],
          bankDetail['_bankName'],
          bankDetail['_branch'],
          bankDetail['_accountType'],
          bankDetail['_accountNo'],
          bankDetail['_IFSCcode'],
        );

        _bankDetailsList.add(bankDetailsModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Details'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            new Expanded(
              child: new ListView.builder(
                itemCount: _bankDetailsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return new InkWell(
                    onTap: () {
                      print('---------->Edit or Delete invoked: Send Data');
                      print(_bankDetailsList[index].id);
                      print(_bankDetailsList[index].bankName);
                      print(_bankDetailsList[index].branch);
                      print(_bankDetailsList[index].accountType);
                      print(_bankDetailsList[index].accountNo);
                      print(_bankDetailsList[index].IFSCcode);

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditBankDetailsFormScreen(),
                        settings: RouteSettings(
                          arguments: _bankDetailsList[index],
                        ),
                      ));
                    },
                    child: ListTile(
                      title: Text(
                          _bankDetailsList[index].bankName +'\n' +
                              _bankDetailsList[index].branch +'\n' +
                              _bankDetailsList[index].accountType +'\n' +
                              _bankDetailsList[index].accountNo +'\n' +
                              _bankDetailsList[index].IFSCcode),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('----------> Launch Bank Details Form Screen');
          Navigator.of(context).push(
              MaterialPageRoute(builder: (Context) => BankDetailsFormScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
/*
 print(_bankDetailsList[index].id);
                      print(_bankDetailsList[index].bankName);
                      print(_bankDetailsList[index].branch);
                      print(_bankDetailsList[index].accountType);
                      print(_bankDetailsList[index].accountNo);
                      print(_bankDetailsList[index].IFSCcode);
*/


