public class JsonResponseParser{
	//TBD: bad solution - creates Map at every step 
	// process string without double quotes
	public Map<String, Object> sourceMap{get;private set;}
	public static String KVP_SEPARATOR;//key value pair 
	static{
		KVP_SEPARATOR = '=';
	}
	public JsonResponseParser(Map<String, Object> sourceMap){
		this.sourceMap = sourceMap;
	}

	public JsonResponseParser(String sourceString){
		this.sourceMap = (Map<String, Object>)JSON.deserializeUntyped(sourceString);
	}

	public String getValue(String key){
		return String.valueOf(sourceMap.get(key));
	}

	public List<String> getValueArray(String key){
		List<String> result = new List<String>();
		for(Object obj: (List<Object>)sourceMap.get(key)){
			result.add(String.valueOf(obj));
		}
		return result;
	}

	public JsonResponseParser getObject(String key){
		Map<String, Object> result = new Map<String, Object>();
		//TBD: simplify
		//String src = String.valueOf((sourceMap).get(key));
		//for(String obj: src.remove('{').remove('}').split(',')){
		//	result.put(obj.substringBefore(KVP_SEPARATOR).trim(), obj.substringAfter(KVP_SEPARATOR));
		//}
		//return new JsonResponseParser(result);
		//return new JsonResponseParser((Map<String, Object>)sourceMap.get(key));
		return new JsonResponseParser((Map<String, Object>) sourceMap.get(key));
	}

	public List<JsonResponseParser> getObjectArray(String key){
		List<JsonResponseParser> resultList = new List<JsonResponseParser>();
		for(Object obj_i: (List<Object>)sourceMap.get(key)){
			//Map<String, Object> result = new Map<String, Object>();
			//for(String obj_j: obj_i.remove('{').remove('}').split(',')){
			//	result.put(obj_j.substringBefore(KVP_SEPARATOR), obj_j.substringAfter(KVP_SEPARATOR));
			//}
			resultList.add(new JsonResponseParser((Map<String, Object>)obj_i));
		}
		return resultList;
	}
}