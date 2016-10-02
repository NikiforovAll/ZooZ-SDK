public with sharing class ZoozRegisterDetailsWrapper {
	public String currencyCode{get;set;}
	public ZoozBillingAddress billingAddress{get;set;}
	public ZoozPhone phone{get;set;}
	public ZoozRegisterDetailsWrapper() {
		currencyCode = 'USD';
	}
	public class ZoozBillingAddress{
		public String countryCode{get;set;}
		public String state {get;set;}
		public String city {get;set;}
		public String address1 {get;set;}
		public String address2 {get;set;}
		public String address3 {get;set;}
		public String zipCode {get;set;}
		public String gender {get;set;}
		public String title {get;set;}
		public String firstName{get;set;}
		public String lastName{get;set;}


	}
	public class ZoozPhone{
		public String countryCode{get;set;}
		public String phoneNumber{get;set;}
	}
}