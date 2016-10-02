public class ZoozAPIRequest {
	private final static ZoozAPIMerchantAppProfile settings = ZoozAPIMerchantAppProfile.getInstance();
	private HttpRequest req; 
	public ZoozAPIRequest() {
		req = new HttpRequest();
	}

	public ZoozAPIResponse send(IZoozCommand zoozCommand){
		Http http = new Http();
		configureMerchantAppProfile();
		String body = zoozCommand.buildCommandBody();
		req.setBody(body); 
		req.setMethod('POST');
		req.setHeader('Content-Length', String.valueOf(body.length()));
		HttpResponse res = http.send(req);
		System.debug('ZoozAPIRequest.send - request: ' + body);
		System.debug('ZoozAPIRequest.send - EndPoint: ' + req.getEndpoint());
		System.debug('ZoozAPIRequest.send - statusCode: ' + res.getStatus());
		System.debug('ZoozAPIRequest.send - response: ' + res.getBody());
		//System.debug('ZoozAPIRequest.send - content type: ' + res.getHeader('Content-Type'));
		return new ZoozAPIResponse(res.getBody());
	}

	private void configureMerchantAppProfile(){
		req.setEndpoint(settings.getValue('Environment').toLowerCase() == 'production' ? settings.getValue('productionUrl') : settings.getValue('sandboxUrl'));
		req.setHeader('Content-Type', 'Application/Json');
		req.setHeader('ZoozResponseType', 'Json');
		req.setHeader('programId', settings.getValue('programId'));
		req.setHeader('programKey', settings.getValue('programKey'));
		req.setHeader('ZoozDeveloperId', settings.getValue('ZoozDeveloperId'));
		req.setHeader('ZoozServerAPIKey', settings.getValue('ZoozServerAPIKey'));
		req.setTimeout(30000);
	}
}