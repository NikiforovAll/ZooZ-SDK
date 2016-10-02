@isTest
private class SaleZoozCommandTest {
	
	@isTest static void test() {
		SaleZoozCommand command = new SaleZoozCommand()
			.setPaymentToken('123qwe123')
			.setPaymentMethodToken('123123qwe');
		command.buildCommandBody();
	}
	
}