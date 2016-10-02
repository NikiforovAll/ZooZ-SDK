@isTest
private class GetTokenZooZCommandTest {
	
	@isTest static void test() {
		GetTokenZoozCommand command = new GetTokenZoozCommand()
			.setCustomerLoginID('test')
			.setCustomerLoginName('test')
			.setCustomerDetailsConfig(new GetTokenZoozCommand.GetTokenCommandWrapper());
		command.buildCommandBody();
	}

}