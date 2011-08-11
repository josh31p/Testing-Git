package Data
{
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.soap.WebService;

	public class NesOneIntegration
	{
		// create a new web service
		private var NesOne:WebService = new WebService;
		
		public function NesOneIntegration()
		{
			// load the Nes one WSDL file in the constructor so 
			// the web service is ready to be used.
			NesOne.wsdl="http://vm-internaltest/NesOne/hcrintegration.asmx?WSDL";
			NesOne.loadWSDL();
				
		}
		
		// this function will call the retrieve survey method in the 
		// NESone web service
		public function RetrieveSurvey():void
		{
			var xmlSurveyData:String;
			var xmlContextData:String;
			
			// we add an event listener to handle the result
			NesOne.RetrieveSurvey2.addEventListener(ResultEvent.RESULT,getSurvey);
			NesOne.RetrieveSurvey2.addEventListener(FaultEvent.FAULT,getSurveyError);
			
			NesOne.RetrieveSurvey2("Test1CardBoard","lisa.mcneil@nesltd.co.uk","ch1cken5",71174, false,false,xmlSurveyData,xmlContextData,"")
		}
		
		// we create an event listener to handle the result
		//
		public function getSurvey(event:ResultEvent):void
		{
			
			Alert.show(event.result.toString());   
		}
		
		public function getSurveyError(e:FaultEvent):void
		{
			
			Alert.show(e.fault.toString());   
		}
	}
}