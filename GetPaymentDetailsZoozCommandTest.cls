@isTest
private class GetPaymentDetailsZoozCommandTest {
@isTest static void test() {
		GetPaymentDetailsZoozCommand command = new GetPaymentDetailsZoozCommand('test');
		command.buildCommandBody();
	}
}