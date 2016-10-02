public class ZoozPaymentDetailsWrapper {
	public Decimal amount {get;set;}
	public String currencyCode {get;set;}
	public ZoozPaymentDetailsWrapper(){
		currencyCode = 'USD';
	}
}