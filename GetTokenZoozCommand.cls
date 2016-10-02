public class GetTokenZoozCommand  implements IZoozCommand{
	public GetTokenCommandWrapper TokenInfo{get; private set;} 

	public GetTokenZoozCommand() {
		TokenInfo = new GetTokenCommandWrapper();
	}

	public String buildCommandBody(){
		return JSON.serializePretty(TokenInfo); 
	}
	public GetTokenZoozCommand setCustomerLoginID(String customerLoginID){
		this.TokenInfo.customerDetails.customerLoginID = customerLoginID;
		return this;
	}
	public GetTokenZoozCommand setCustomerLoginName(String customerLoginName){
		this.TokenInfo.customerDetails.customerLoginName = customerLoginName;
		return this;
	}

	public GetTokenZoozCommand setCustomerDetailsConfig(GetTokenCommandWrapper config){
		if(config != null )
		this.TokenInfo = config;
		return this;
	}

	public class GetTokenCommandWrapper{
		public String command {get; private set;}
		public String tokenType{get; private set;}
		public ZoozRegisterDetailsWrapper registerDetails{get;set;}
		public ZoozCustomerDetailsWrapper customerDetails{get;set;} 
		public GetTokenCommandWrapper(){
			command = 'getToken';
			tokenType = 'customerToken';
			registerDetails = new ZoozRegisterDetailsWrapper();
			customerDetails = new ZoozCustomerDetailsWrapper();
		}
	}
}