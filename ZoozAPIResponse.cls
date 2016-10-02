public class ZoozAPIResponse {
	public String Body {get; private set;}
	public ZoozAPIResponse(String body) {
		this.Body = body;
	}
	public 
	JsonResponseParser getResponseMap(){
		return new JsonResponseParser(Body);
	} 
}