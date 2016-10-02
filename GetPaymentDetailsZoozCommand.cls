public class GetPaymentDetailsZoozCommand  implements IZoozCommand{
	PaymentDetailsRequestWrapper DetailsRequest {get;set;}
	public GetPaymentDetailsZoozCommand(String token) {
		DetailsRequest = new PaymentDetailsRequestWrapper(token);
	}
	public String buildCommandBody(){
		return JSON.serializePretty(DetailsRequest); 
	}
	public class PaymentDetailsRequestWrapper{
		public String command;
		public String paymentToken {get;set;}
		public PaymentDetailsRequestWrapper(String token){
			paymentToken = token;
			command = 'getPaymentDetails';
		} 
	}
}