# ZooZ-SDK-API

## Custom setting installation script
```
List<ZoozSettings__c> result = new List<ZoozSettings__c>{ 
  new ZoozSettings__c(Name = 'Environment', Value__c = '<ENV = production, sandbox>'), 
  new ZoozSettings__c(Name ='productionUrl', Value__c = 'https://app.zooz.com/mobile/ZooZPaymentAPI'),
  new ZoozSettings__c(Name = 'sandboxUrl', Value__c = ' https://sandbox.zooz.com/mobile/ZooZPaymentAPI'),
  new ZoozSettings__c(Name ='programId', Value__c = '<Program ID>'),
  new ZoozSettings__c(Name = 'programKey', Value__c = '<Program Key>'),
  new ZoozSettings__c(Name = 'ZoozDeveloperId', Value__c = '<Developer email>'),
  new ZoozSettings__c(Name = 'ZoozServerAPIKey', Value__c = '<Server API key>')}; 
upsert result Name;
```
## Example/Usage
```
// for further assistance check ZoozAPIManager.cls
ZoozAPiManager manager = new ZoozAPiManager();
String customerLoginID = '<uniqueId>';
String customerLoginName = 'John Doe';
manager.getToken(customerLoginID, customerLoginName);
manager.addPaymentMethod('01/2020', '4580458045804580', '123','test@email.com', 'test@email.com', manager.CustomerToken);
manager.openPayment(100, customerLoginID);
manager.sale(zm.PaymentResponse.paymentToken, manager.PaymentMethodToken);
```
