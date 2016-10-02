public class SaleZoozCommand  implements IZoozCommand{
	public SaleCommandWrapper SaleInfo{get;set;} 

	public SaleZoozCommand() {
		SaleInfo = new SaleCommandWrapper();
	}

	public String buildCommandBody(){
		return JSON.serializePretty(SaleInfo); 
	}

	public SaleZoozCommand setPaymentToken(String paymentToken){
		this.SaleInfo.paymentToken = paymentToken;
		return this;
	}

	public SaleZoozCommand setPaymentMethodToken(String paymentMethodToken){
		this.SaleInfo.paymentMethod.paymentMethodToken = paymentMethodToken;
		return this;
	}

	public SaleZoozCommand setSaleInfoConfig(SaleCommandWrapper config){
		if(config != null)
		this.SaleInfo = config;
		return this;
	}

	public class SaleCommandWrapper{
		public String command {get; private set;}
		public String  paymentToken{get;set;}
		public ZoozPaymentMethodWrapper paymentMethod {get;set;}		
		public SaleCommandWrapper(){
			command = 'Sale';
			paymentMethod = new ZoozPaymentMethodWrapper();
			paymentMethod.paymentMethodType = 'CreditCard';

		}
	}
	
}