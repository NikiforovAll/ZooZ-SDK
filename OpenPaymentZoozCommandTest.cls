@isTest
private class OpenPaymentZoozCommandTest {
	
	@isTest static void test() {
		OpenPaymentZoozCommand command = new OpenPaymentZoozCommand()
			.setAmount(10.0)
			.setCustomerLoginID('qwerty');
		command.buildCommandBody();

	}
	
}