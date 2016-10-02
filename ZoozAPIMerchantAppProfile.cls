public with sharing class ZoozAPIMerchantAppProfile {
	
	private static ZoozAPIMerchantAppProfile classInstance;

    static {
        classInstance = new ZoozAPIMerchantAppProfile();
    }

    public static ZoozAPIMerchantAppProfile getInstance() {
        return classInstance;
    }

    private Map<String, ZoozSettings__c> settingsMap;
    private ZoozAPIMerchantAppProfile() {
        settingsMap = new Map<String, ZoozSettings__c>();
        List<ZoozSettings__c> settingsList = [SELECT Name, Value__c FROM ZoozSettings__c];
        for (ZoozSettings__c setting_i : settingsList) {
        	settingsMap.put(setting_i.Name, setting_i);
        }
    }

    public String getValue(String key) {
    	if (settingsMap.containsKey(key)) {
    		return settingsMap.get(key).Value__c;
		} else {
			return null;
		}
    }
}