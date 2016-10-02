@isTest
private class AddPaymentMethodZoozCommandTest {
	
	@isTest static void test() {
		AddPaymentMethodZoozCommand wrapper = new AddPaymentMethodZoozCommand()
			.setExpirationDate('01/01/1980')
			.setCardNumber('123123123')
			.setCvvNumber('123123123')
			.setPaymentToken('123qwe123')
			.setCardHolderName('card@holder.mail')
			.setEmail('card@holder.mail');
		wrapper.buildCommandBody();

	}
	
}