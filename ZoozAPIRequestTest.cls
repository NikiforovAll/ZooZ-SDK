@isTest
private class ZoozAPIRequestTest {
	// also test PayPalResponse 
	@isTest static void requestTest() {
		TestUtil.insertZoozSettings();
		ZoozAPIRequest req = new ZoozAPIRequest();
		String body = '{}';
		Test.setMock(HttpCalloutMock.class, new ZoozMock(200, 'OK', body));
		Test.startTest();
		req.send(new GetTokenZoozCommand());
		Test.stopTest();
	}
}