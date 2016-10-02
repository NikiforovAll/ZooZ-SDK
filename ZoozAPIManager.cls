public class ZoozAPIManager {
	//TODO: Refactor/Imporove wrapper farm 
	// TODO: manager can call commands with default tokens if flow is appropriate
	public String CustomerToken {get; private set;}
	public String PaymentMethodToken {get; private set;}
	public PaymentResponseWrapper PaymentResponse {get;private set;}
	public ZoozAPiManager(){
		CustomerToken = '';
		PaymentMethodToken = '';
		PaymentResponse = new PaymentResponseWrapper();
	}
	/*
	getToken request
		API command: getToken
	Description
		The getToken request establishes a secure session with the Zooz server, and returns a customerToken
		which represents a customer in the Zooz system. Merchants can use the getToken to add, verify, or
		remove a credit card, or tokenize a credit card for future use
	*/
	public JsonResponseParser getToken(String customerLoginID,
									   String customerLoginName,
									   GetTokenZoozCommand.GetTokenCommandWrapper config){
		
		JsonResponseParser result = new ZoozAPIRequest()
										.send(new GetTokenZoozCommand()
											.setCustomerDetailsConfig(config)
											.setCustomerLoginID(customerLoginID)
											.setCustomerLoginName(customerLoginName))
										.getResponseMap();
		if(Integer.valueOf(result.getValue('responseStatus')) == 0){
			CustomerToken = result.getObject('responseObject').getValue('customerToken');//(String)((Map<String, Object>)((result.get('responseObject')))).get('customerToken');
			System.debug('ZoozAPiManager.getToken - customerToken: ' + CustomerToken);
		}else{
			System.debug('ZoozAPiManager.getToken - customerToken: response status: -1');
		}
		return result;
	}

	public JsonResponseParser getToken(String customerLoginID, String customerLoginName){
		return this.getToken(customerLoginID, customerLoginName, null);
	}
	/*
		addPaymentMethod request (Server Side Request for PCI Compliant Merchants Only)
			API command: addPaymentMethod
		Description
			To add a credit card to the existing payment methods, use the addPaymentMethod request.
	*/
	public JsonResponseParser addPaymentMethod(String expDate,
											   String cardNumber,
											   String cvvNumber,
											   String email,
											   String cardHolderName,
											   String paymentToken,
											   AddPaymentMethodZoozCommand.AddPaymentMethodCommandWrapper config){
		
		JsonResponseParser result = new ZoozAPIRequest()
										.send(new AddPaymentMethodZoozCommand()
											.setPaymentMethodConfig(config)
											.setExpirationDate(expDate)
											.setCardNumber(cardNumber)
											.setCvvNumber(cvvNumber)
											.setEmail(email)
											.setCardHolderName(cardHolderName)
											.setpaymentToken(paymentToken))
										.getResponseMap();
		if(Integer.valueOf(result.getVAlue('responseStatus')) == 0){
			PaymentMethodToken =  result.getObject('responseObject').getValue('paymentMethodToken');//(String)((Map<String, Object>)((result.get('responseObject')))).get('paymentMethodToken');
			System.debug('ZoozAPiManager.AddPaymentMethod - PaymentMethodToken: ' + PaymentMethodToken);
		}else{
			System.debug('ZoozAPiManager.AddPaymentMethod - PaymentMethodToken: response status: -1');
		}
		return result;
	}


	public JsonResponseParser addPaymentMethod(String expDate,
											   String cardNumber,
											   String cvvNumber,
											   String email,
											   String cardHolderName,
											   String paymentToken){
		return this.addPaymentMethod(expDate, cardNumber, cvvNumber, email, cardHolderName, paymentToken, null);
	}
	/*
	openPayment request
		API command: openPayment
	Description
		The openPayment request is used to begin the payment process. This opens a request to the Zooz
		server using a secure channel.
		The openPayment request returns a unique paymentToken, that is used to initiate payments,
		authorizations, refunds, voids, and identify the transaction for future actions, etc.
	*/
	public JsonResponseParser getPaymentDetails(String paymentToken){
		JsonResponseParser result = new ZoozAPIRequest()
										.send(new GetPaymentDetailsZoozCommand(paymentToken))
										.getResponseMap();
		if(Integer.valueOf(result.getVAlue('responseStatus')) == 0){
		}else{
			System.debug('ZoozAPiManager.AddPaymentMethod - PaymentMethodToken: response status: -1');
		}
		return result;
	}
	/*
	openPayment request
		API command: openPayment
	Description
		The openPayment request is used to begin the payment process. This opens a request to the Zooz
		server using a secure channel.
		The openPayment request returns a unique paymentToken, that is used to initiate payments,
		authorizations, refunds, voids, and identify the transaction for future actions, etc.
	*/
	public JsonResponseParser openPayment(Decimal amount,
										   String customerLoginID,
										   OpenPaymentZoozCommand.OpenPaymentCommandWrapper config){
		
		JsonResponseParser result = new ZoozAPIRequest()
										.send(new OpenPaymentZoozCommand()
											.setPaymentInfoConfig(config)
											.setAmount(amount)
											.setCustomerLoginID(customerLoginID))
										.getResponseMap();
        
		if(Integer.valueOf(result.getValue('responseStatus')) == 0){
			
		JsonResponseParser resultTokens = result.getObject('responseObject');
			PaymentResponse = new PaymentResponseWrapper(resultTokens.getValue('paymentId'), resultTokens.getValue('paymentToken'));//(PaymentResponseWrapper)JSON.deserialize(JSON.serialize(result.get('responseObject')), PaymentResponseWrapper.class);
			System.debug('ZoozAPiManager.openPayment - PaymentResponse: ' + PaymentResponse);
		}else{
			System.debug('ZoozAPiManager.openPayment - PaymentResponse: response status: -1');
		}
		return result;
	}

	public JsonResponseParser openPayment(Decimal amount, String customerLoginID){
		return this.openPayment(amount, customerLoginID, null);
	}

	/*
	sale request
		API command: sale
	Description
		This request authorizes and captures the specified amount for a specific credit card or another
		payment source.
	Params
	paymentToken - token from openPayment request 
	paymentMethodToken - token from addPaymentMethod
	*/
	public JsonResponseParser sale(String paymentToken,
								    String paymentMethodToken,
								    SaleZoozCommand.SaleCommandWrapper config){
		
		JsonResponseParser result = new ZoozAPIRequest()
										.send(new SaleZoozCommand()
											.setSaleInfoConfig(config)
											.setPaymentToken(paymentToken)
											.setPaymentMethodToken(paymentMethodToken))
										.getResponseMap();
		if(Integer.valueOf(result.getValue('responseStatus')) == 0){
			System.debug('ZoozAPiManager.Sale - res: ' + result.getObject('responseObject') );

		}else{
			System.debug('ZoozAPiManager.Sale - res: response status: -1');
		}
		return result;
	}

	public JsonResponseParser sale(String paymentToken,
								   String paymentMethodToken){
		return this.sale(paymentToken, paymentMethodToken, null);
	}

	public  class PaymentResponseWrapper{
		public String paymentId {get;set;}
		public String paymentToken {get;set;}
		public PaymentResponseWrapper(String paymentId, String paymentToken){
			this.paymentId = paymentId;
			this.paymentToken = paymentToken;
		}
		public PaymentResponseWrapper(){
		}
	}
}