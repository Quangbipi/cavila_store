import 'package:cavila_store/models/voucher_model.dart';
import 'package:equatable/equatable.dart';

class VoucherState extends Equatable{
  @override
  List<Object?> get props => [];

}

class GetVoucherLoading extends VoucherState{

}

class GetVoucherSuccess extends VoucherState{
  final List<Voucher> vouchers;
  GetVoucherSuccess(this.vouchers);
}

class GetVoucherFail extends VoucherState{

}