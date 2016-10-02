public class OpenPaymentZoozCommand  implements IZoozCommand{
	public OpenPaymentCommandWrapper PaymentInfo{get;set;} 

	public OpenPaymentZoozCommand() {
		PaymentInfo = new OpenPaymentCommandWrapper();
	}

	public String buildCommandBody(){
		return JSON.serializePretty(PaymentInfo); 
	}
	public OpenPaymentZoozCommand setAmount(Decimal amount){
		this.PaymentInfo.paymentDetails.amount = amount;
		return this;
	}

	public OpenPaymentZoozCommand setCustomerLoginID(String customerLoginID){
		this.PaymentInfo.customerDetails.customerLoginID = customerLoginID;
		return this;
	}
	public OpenPaymentZoozCommand setPaymentInfoConfig(OpenPaymentCommandWrapper config){
		if(config != null)
		this.PaymentInfo = config;
		return this;
	}

	public class OpenPaymentCommandWrapper{
		public String command {get; private set;}
		public ZoozCustomerDetailsWrapper customerDetails{get;set;}		
		public ZoozPaymentDetailsWrapper paymentDetails{get;set;}
		public OpenPaymentCommandWrapper(){
			command = 'openPayment';
			customerDetails = new ZoozCustomerDetailsWrapper();
			paymentDetails = new ZoozPaymentDetailsWrapper();

		}
	}
	
}