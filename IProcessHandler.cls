/**
* @author Noam Dgani	
* @date 24/02/2013
* @description The interface is used to create classes that can be dynamically invoked using 
*  'TriggerProcessingManager' class.			   
*/
public interface IProcessHandler {

	/**
	* @author Noam Dgani
	* @date 24/02/2013
	* @description The main method, called from any trigger and performs all actions required to in the context of the trigger.
	* @return void
	*/
	void handle();
}