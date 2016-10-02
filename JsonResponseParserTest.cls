@isTest
private class 
JsonResponseParserTest {
	
	@isTest static void test() {
	//TBD: seprator logic is broken
	JsonResponseParser response = new JsonResponseParser('{"key":{"v1":"value1","v2":"value2"},"key2":[{"v1":"v1"},{"v1":"v1"}], "key3":["1", "2"]}');
		//system.assertEquals('0',response.getValue('responseStatus'));
	JsonResponseParser tmpResponseObj = response.getObject('key');
	System.debug(tmpResponseObj);
	tmpResponseObj.getValue('v1');
	System.debug(response.getValueArray('key3')[0]);
	System.debug(response.getObjectArray('key2')[0].getValue('v1'));
		//system.assertEquals('QAMO6NYW27SHIYIF5DZTPWMVMM', tmpResponseObj.getValue('paymentToken'));
		//system.assertEquals('1', response.getValueArray('array')[0]);
		//system.assertEquals('1', response.getObjectArray('arrayO')[0].getValue('test'));
	response = new 	JsonResponseParser('{"responseStatus": 0}');
		//system.assertEquals('0',response.getValue('responseStatus'));
	}
	
	
	
}