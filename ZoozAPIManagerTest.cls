@isTest
private class ZoozAPIManagerTest {

	@testSetup
	private static void setup(){
		TestUtil.insertZoozSettings();
	}

	@isTest static void getToken() {
		ZoozAPiManager manager = new ZoozAPiManager();
		String body = '{"responseObject": {"customerToken": "AY4CXZZW23DC3MFUDOXHVN2YCM"},"responseStatus": 0}';
		Test.setMock(HttpCalloutMock.class, new ZoozMock(200, 'OK', body));
		Test.startTest();
		manager.getToken('testLogin', 'customerLoginName');
		Test.stopTest();
	}
	
	@isTest static void addPaymentMethod() {
		ZoozAPiManager manager = new ZoozAPiManager();
		String body = '{"responseObject": {"paymentMethodToken": "G5Q2NILWT73BOVGRUL5KOXMCKI"},"responseStatus": 0}';
		Test.setMock(HttpCalloutMock.class, new ZoozMock(200, 'OK', body));
		Test.startTest();
		manager.addPaymentMethod('01/01/1980', '123123123', '123', 'test@email.com', 'test@email.com', '123123qwe');
		Test.stopTest();
	}
	
	@isTest static void openPayment() {
		ZoozAPiManager manager = new ZoozAPiManager();
		String body = '{"responseObject": {"paymentToken": "5HGHUMKXWLRULE2SECUKDRWX24", "paymentId": "T6KVLGCS4GCEEGROOB5RI5ZPVU"}, "responseStatus": 0}';
		Test.setMock(HttpCalloutMock.class, new ZoozMock(200, 'OK', body));
		Test.startTest();
		manager.openPayment(10.0, '123123qwe');
		Test.stopTest();
	}

	@isTest static void sale() {
		ZoozAPiManager manager = new ZoozAPiManager();
		String body = '{"responseObject": {},"responseStatus": 0}';
		Test.setMock(HttpCalloutMock.class, new ZoozMock(200, 'OK', body));
		Test.startTest();
		manager.sale('123123qwe', '123qwe123');
		Test.stopTest();
	}
}