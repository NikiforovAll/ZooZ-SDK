@isTest
private class ZoozPaymentMethodWrapperTest {
	
	@isTest static void test() {
		ZoozPaymentMethodWrapper wrapper = new ZoozPaymentMethodWrapper();
		wrapper.paymentMethodToken = '123123';
		wrapper.paymentMethodType = 'CreditCard';
		wrapper.paymentMethodDetails = new ZoozPaymentMethodDetailsWrapper();	
	}
}