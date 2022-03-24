import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_patient_frontend/infrastructure/models/bills.dart' as m;
import 'package:hms_patient_frontend/providers/api/api_cubit.dart';
import 'package:hms_patient_frontend/ui/screen/profile/bills/bill_tile.dart';
import 'package:hms_patient_frontend/ui/widgets/flush_toast.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../../widgets/loaders.dart';
import '../../../widgets/no_item_tile.dart';


class Bills extends StatelessWidget {
	const Bills({ Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: BlocConsumer<ApiCubit,ApiState>(
				listenWhen: (p,c) => p.inProgress.difference(c.inProgress).contains(API.getBills),
				listener: (context, state) {
				  if(!state.inProgress.contains(API.getBills)){
						state.apiFailureOrSuccessOption.fold(
							(){}, (e) => e.fold(
								(l) => Toast.createApiError(l), 
								(r) {}));
					}
				},
				buildWhen: (p,c) => p.inProgress.difference(c.inProgress).contains(API.getBills),
				builder: (context, state) {
					final List<m.Bills> _bills = state.apiFailureOrSuccessOption.fold(
									() => [], (e) => e.fold(
										(l) => [], 
										(r) => r as List<m.Bills>));
					if (state.inProgress.contains(API.getBills)) {
					  return _bills.isNotEmpty == true?
							Container()
						:Center(
								child: ListView(
									physics: const AlwaysScrollableScrollPhysics(),
									children: [
										Padding(
											padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
											child: const NoItemTile(
													value: 'No bills available right now',),
										),
									],
								),
						);
					}
					return InfiniteLoader();
					
				},
			)
		);
	}
}

class BillsBody extends StatelessWidget {
	final List<m.Bills> bills;
	const BillsBody({ Key? key, required this.bills }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SearchableList<m.Bills>(
                initialList: bills,
                builder: (m.Bills bill) => BillTile(bill: bill),
                filter: _filterBillList,
                emptyWidget: const EmptyView(),
                inputDecoration: InputDecoration(
                  labelText: "Search Bill",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // addActor();
          //     },
          //     child: Text('Add actor'),
          //   ),
          // )
        ],
      ),
    );
	}
	List<m.Bills> _filterBillList(String sVal) {
		return bills
				.where(
					(b) => b.typeOfBill.toLowerCase().contains(sVal)
				).toList();
	}
}


class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text('no actor is found with this name'),
      ],
    );
  }
}