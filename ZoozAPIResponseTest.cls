@isTest
private class ZoozAPIResponseTest {
	
	@isTest static void test() {
		new ZoozAPIResponse('{"test":"test"}').getResponseMap();
	}
}