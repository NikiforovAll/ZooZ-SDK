@isTest
private class ZoozAPIMerchantAppProfileTest {
	@isTest 
	private static void testSetting(){
		TestUtil.insertZoozSettings();
		ZoozAPIMerchantAppProfile settings = ZoozAPIMerchantAppProfile.getInstance();
		settings.getValue('VERSION');
		settings.getValue('null');
	}
}