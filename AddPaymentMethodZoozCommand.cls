public class AddPaymentMethodZoozCommand  implements IZoozCommand{
	public AddPaymentMethodCommandWrapper PaymentMethodInfo{get;set;} 

	public AddPaymentMethodZoozCommand() {
		PaymentMethodInfo = new AddPaymentMethodCommandWrapper();
	}

	public String buildCommandBody(){
		return JSON.serializePretty(PaymentMethodInfo); 
	}

	public AddPaymentMethodZoozCommand setExpirationDate(String expDate){
		this.PaymentMethodInfo.paymentMethod.paymentMethodDetails.expirationDate = expDate;
		return this;
	}
	public AddPaymentMethodZoozCommand setCardNumber(String cardNumber){
		this.PaymentMethodInfo.paymentMethod.paymentMethodDetails.cardNumber = cardNumber;
		return this;
	}
	public AddPaymentMethodZoozCommand setCvvNumber(String cvvNumber){
		this.PaymentMethodInfo.paymentMethod.paymentMethodDetails.cvvNumber = cvvNumber;
		return this;
	}

	public AddPaymentMethodZoozCommand setPaymentToken(String paymentToken){
		this.PaymentMethodInfo.paymentToken = paymentToken;
		return this;
	}

	public AddPaymentMethodZoozCommand setCardHolderName(String cardHolderName){
		this.PaymentMethodInfo.paymentMethod.paymentMethodDetails.cardHolderName = cardHolderName;
		return this;
	}

	public AddPaymentMethodZoozCommand setEmail(String email){
		this.PaymentMethodInfo.email = email;
		return this;
	}

	public AddPaymentMethodZoozCommand setPaymentMethodConfig(AddPaymentMethodCommandWrapper config){
		if(config != null)
		this.PaymentMethodInfo = config;
		return this;
	}

	public class AddPaymentMethodCommandWrapper{
		public String command {get; private set;}
		public String paymentToken {get;set;}
		public String email{get; set;}
		public PaymentMethodWrapper paymentMethod{get;set;}
		public AddPaymentMethodCommandWrapper(){
			command = 'addPaymentMethod';
			paymentMethod = new PaymentMethodWrapper();
		}
	}
	public class PaymentMethodWrapper{
		public ZoozPaymentMethodDetailsWrapper paymentMethodDetails{get;set;}
		public String  paymentMethodType {get; private set;}
		public PaymentMethodWrapper(){
			paymentMethodDetails = new ZoozPaymentMethodDetailsWrapper();
			paymentMethodType = 'CreditCard';
			//TODO: mock!!! expose as param
			paymentMethodDetails.cardHolderName = 'default@email.com';
		}

	}

	
}