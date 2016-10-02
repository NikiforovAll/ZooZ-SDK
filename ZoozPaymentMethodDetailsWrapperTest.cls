@isTest
private class ZoozPaymentMethodDetailsWrapperTest {
	
	@isTest static void test() {
		ZoozPaymentMethodDetailsWrapper wrapper = new ZoozPaymentMethodDetailsWrapper();
		wrapper.cardHolderName = 'TEST';
		wrapper.cardNumber = '123123123';
		wrapper.cvvNumber = '123';
		wrapper.expirationDate = '01/01/1980';
	}
	
}