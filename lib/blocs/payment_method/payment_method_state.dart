part of 'payment_method_bloc.dart';

abstract class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {}

class PaymentMethodLoading extends PaymentMethodState {}

class PaymentMethodFailed extends PaymentMethodState {
  final String e;
  PaymentMethodFailed(this.e);
  @override
  // TODO: implement props
  List<Object> get props => [e];
}

class PaymentMethodSuccess extends PaymentMethodState {
  final List<PaymentMethodModel> paymentMethods;
  PaymentMethodSuccess(this.paymentMethods);

  @override
  // TODO: implement props
  List<Object> get props => [paymentMethods];
}
