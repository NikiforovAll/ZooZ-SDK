@isTest
public class TestUtil {
	public static List<ZoozSettings__c> insertZoozSettings(){
		List<ZoozSettings__c> result = new List<ZoozSettings__c>{ new ZoozSettings__c(Name = 'contractSite', Value__c = 'http://contract-signup-developer-edition.eu6.force'),
																  new ZoozSettings__c(Name = 'Environment', Value__c = 'sandbox'), 
																  new ZoozSettings__c(Name ='productionUrl', Value__c = 'https://app.zooz.com/mobile/ZooZPaymentAPI'),
																  new ZoozSettings__c(Name ='programId', Value__c = 'PAPI_ZooZNP_PZZF3PLBGL22NDFF4QP7INFFHU_2'),
																  new ZoozSettings__c(Name = 'programKey', Value__c = 'af681543-c4be-449e-a473-f46e5d27a17e'),
																  new ZoozSettings__c(Name = 'sandboxUrl', Value__c = '	https://sandbox.zooz.com/mobile/ZooZPaymentAPI'),
																  new ZoozSettings__c(Name = 'ZoozDeveloperId', Value__c = 'synebozoozpayments@gmail.com'),
																  new ZoozSettings__c(Name = 'ZoozServerAPIKey', Value__c = 'PTVDIADNAV224NI5ISZSTNZSQI')};	

		insert result;
		return result;
	}

	public static Account createAccount(){
		return new Account(Name = 'AccountName');
	}

	public static Contact createContact(Account acc){
		return new Contact(FirstName = 'FName', LastName = 'LName', AccountId = acc.Id);
	}

	public static Business__c creteBusiness(Account acc){
		return new Business__c(Name = 'TestBusiness', Account__c  = acc.Id, App_Locations__c = 10);
	}
	public static Subscription__c creteSubscription(Business__c business){
		return new Subscription__c(Name = 'TestSubscription', 
								   Business__c  = business.Id,
								   Price_Per_Member__c = 1,
								   Currency__c = 'USD',
								   Minimum_Value_Per_Business__c = 150.0,
								   Service_Price__c = 649.0,
								   //Final_Price__c = 649,
								   VAT__c = 110.330, 
								   Credited_End_Users__c = 1);
	}

	public static Payment__c createPayment(Subscription__c subscription){
		return new Payment__c(Subscription__c = subscription.Id);
	}
}