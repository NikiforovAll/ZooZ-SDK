@isTest
private class ZoozRegisterDetailsWrapperTest {
	
	@isTest static void test() {
		ZoozRegisterDetailsWrapper wrapper = new ZoozRegisterDetailsWrapper();
		wrapper.currencyCode = 'USD';
		ZoozRegisterDetailsWrapper.ZoozPhone phone = new ZoozRegisterDetailsWrapper.ZoozPhone();
		phone.countryCode = '123';
		phone.phoneNumber = '123123123';
		wrapper.phone = phone;
		ZoozRegisterDetailsWrapper.ZoozBillingAddress address = new ZoozRegisterDetailsWrapper.ZoozBillingAddress();
		address.address1 = 'test';
		address.address2 = 'test';
		address.address3 = 'test';
		address.city = 'city';
		address.countryCode = '1234';
		address.state = 'state';
		address.zipCode = 'zip';
		address.gender = 'other';
		address.title = 'test';
		address.firstName = 'testName';
		address.lastName = 'testLastName';
	}

}