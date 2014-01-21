package 
{
	import flash.display.MovieClip;
	import flash.net.*;
	import flash.events.*;
	import flash.xml.*;
	import flash.text.*;
	

	public class milestone1_3 extends MovieClip
	{
		var initXmlData:XML;
		var newXmlData:XML;
		var localData:SharedObject;
		
		var weatherArray:Array;
		var dayArray:Array;
		var textInfoArray:Array;
		var daysOfWeek:Array = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
		var weatherClipArray:Array;
		var detailedClip:MovieClip;
		var detailedInfo:TextField;
		
		var today:Date;

		public function processInitXml(e: Event):void
		{
			initXmlData = new XML(e.target.data);
			var format:TextFormat = new TextFormat();
			format.align = TextFormatAlign.CENTER;
			with(format)
			{
				bold = true;
			}
			
			var date1:String = initXmlData.forecast.time[0].@day;
			var day1MaxTemp:String = initXmlData.forecast.time[0].temperature.@max;
			var day1MinTemp:String = initXmlData.forecast.time[0].temperature.@min;
			var day1WeatherCode:int = initXmlData.forecast.time[0].symbol.@number;
			textInfoArray[0].defaultTextFormat = format;
			textInfoArray[0].appendText(date1.substring(5,10) + "\nMax temp: " + day1MaxTemp  + "C" + "\nMin temp: " + day1MinTemp + "C");
			
			var date2:String = initXmlData.forecast.time[1].@day;
			var day2MaxTemp:String = initXmlData.forecast.time[1].temperature.@max;
			var day2MinTemp:String = initXmlData.forecast.time[1].temperature.@min;
			var day2WeatherCode:int = initXmlData.forecast.time[1].symbol.@number;
			textInfoArray[1].defaultTextFormat = format;
			textInfoArray[1].appendText(date2.substring(5,10) + "\nMax temp: " + day2MaxTemp  + "C" + "\nMin temp: " + day2MinTemp + "C");
			
			var date3:String = initXmlData.forecast.time[2].@day;
			var day3MaxTemp:String = initXmlData.forecast.time[2].temperature.@max;
			var day3MinTemp:String = initXmlData.forecast.time[2].temperature.@min;
			var day3WeatherCode:int = initXmlData.forecast.time[2].symbol.@number;
			textInfoArray[2].defaultTextFormat = format;
			textInfoArray[2].appendText(date3.substring(5,10) + "\nMax temp: " + day3MaxTemp  + "C" + "\nMin temp: " + day3MinTemp + "C");
			
			var date4:String = initXmlData.forecast.time[3].@day;
			var day4MaxTemp:String = initXmlData.forecast.time[3].temperature.@max;
			var day4MinTemp:String = initXmlData.forecast.time[3].temperature.@min;
			var day4WeatherCode:int = initXmlData.forecast.time[3].symbol.@number;
			textInfoArray[3].defaultTextFormat = format;
			textInfoArray[3].appendText(date4.substring(5,10) + "\nMax temp: " + day4MaxTemp  + "C" + "\nMin temp: " + day4MinTemp + "C");
			
			var date5:String = initXmlData.forecast.time[4].@day;
			var day5MaxTemp:String = initXmlData.forecast.time[4].temperature.@max;
			var day5MinTemp:String = initXmlData.forecast.time[4].temperature.@min;
			var day5WeatherCode:int = initXmlData.forecast.time[4].symbol.@number;
			textInfoArray[4].defaultTextFormat = format;
			textInfoArray[4].appendText(date5.substring(5,10) + "\nMax temp: " + day5MaxTemp  + "C" + "\nMin temp: " + day5MinTemp + "C");
			
			var date6:String = initXmlData.forecast.time[5].@day;
			var day6MaxTemp:String = initXmlData.forecast.time[5].temperature.@max;
			var day6MinTemp:String = initXmlData.forecast.time[5].temperature.@min;
			var day6WeatherCode:int = initXmlData.forecast.time[5].symbol.@number;
			textInfoArray[5].defaultTextFormat = format;
			textInfoArray[5].appendText(date6.substring(5,10) + "\nMax temp: " + day6MaxTemp  + "C" + "\nMin temp: " + day6MinTemp + "C");
			
			var date7:String = initXmlData.forecast.time[6].@day;
			var day7MaxTemp:String = initXmlData.forecast.time[6].temperature.@max;
			var day7MinTemp:String = initXmlData.forecast.time[6].temperature.@min;
			var day7WeatherCode:int = initXmlData.forecast.time[6].symbol.@number;
			textInfoArray[6].defaultTextFormat = format;
			textInfoArray[6].appendText(date7.substring(5,10) + "\nMax temp: " + day7MaxTemp  + "C" + "\nMin temp: " + day7MinTemp + "C");
			
			var weatherCodeArray:Array = [day1WeatherCode, day2WeatherCode, day3WeatherCode, day4WeatherCode, day5WeatherCode, day6WeatherCode, day7WeatherCode];
			
			trace(initXmlData.*);
			
			
			for(var i:int = 0; i < 7; i++)
			{
				addChild(textInfoArray[i]);
				determineWeather(weatherCodeArray[i], i);
			}
			
			initializeMoviePositions();
		}
		
		public function processXml(e: Event):void
		{
			newXmlData = new XML(e.target.data);
			
			clearText();
			
			var date1:String = newXmlData.forecast.time[0].@day;
			var day1MaxTemp:String = newXmlData.forecast.time[0].temperature.@max;
			var day1MinTemp:String = newXmlData.forecast.time[0].temperature.@min;
			var day1WeatherCode:int = newXmlData.forecast.time[0].symbol.@number;
			//textInfoArray[0].text = "";
			textInfoArray[0].appendText(date1.substring(5,10) + "\nMax temp: " + day1MaxTemp  + "C" + "\nMin temp: " + day1MinTemp + "C");
			
			var date2:String = newXmlData.forecast.time[1].@day;
			var day2MaxTemp:String = newXmlData.forecast.time[1].temperature.@max;
			var day2MinTemp:String = newXmlData.forecast.time[1].temperature.@min;
			var day2WeatherCode:int = newXmlData.forecast.time[1].symbol.@number;
			//textInfoArray[1].text = "";
			textInfoArray[1].appendText(date2.substring(5,10) + "\nMax temp: " + day2MaxTemp  + "C" + "\nMin temp: " + day2MinTemp + "C");
			
			var date3:String = newXmlData.forecast.time[2].@day;
			var day3MaxTemp:String = newXmlData.forecast.time[2].temperature.@max;
			var day3MinTemp:String = newXmlData.forecast.time[2].temperature.@min;
			var day3WeatherCode:int = newXmlData.forecast.time[2].symbol.@number;
			//textInfoArray[2].text = "";
			textInfoArray[2].appendText(date3.substring(5,10) + "\nMax temp: " + day3MaxTemp  + "C" + "\nMin temp: " + day3MinTemp + "C");
			
			var date4:String = newXmlData.forecast.time[3].@day;
			var day4MaxTemp:String = newXmlData.forecast.time[3].temperature.@max;
			var day4MinTemp:String = newXmlData.forecast.time[3].temperature.@min;
			var day4WeatherCode:int = newXmlData.forecast.time[3].symbol.@number;
			//textInfoArray[3].text = "";
			textInfoArray[3].appendText(date4.substring(5,10) + "\nMax temp: " + day4MaxTemp  + "C" + "\nMin temp: " + day4MinTemp + "C");
			
			var date5:String = newXmlData.forecast.time[4].@day;
			var day5MaxTemp:String = newXmlData.forecast.time[4].temperature.@max;
			var day5MinTemp:String = newXmlData.forecast.time[4].temperature.@min;
			var day5WeatherCode:int = newXmlData.forecast.time[4].symbol.@number;
			//textInfoArray[4].text = "";
			textInfoArray[4].appendText(date5.substring(5,10) + "\nMax temp: " + day5MaxTemp  + "C" + "\nMin temp: " + day5MinTemp + "C");
			
			var date6:String = newXmlData.forecast.time[5].@day;
			var day6MaxTemp:String = newXmlData.forecast.time[5].temperature.@max;
			var day6MinTemp:String = newXmlData.forecast.time[5].temperature.@min;
			var day6WeatherCode:int = newXmlData.forecast.time[5].symbol.@number;
			//textInfoArray[5].text = "";
			textInfoArray[5].appendText(date6.substring(5,10) + "\nMax temp: " + day6MaxTemp  + "C" + "\nMin temp: " + day6MinTemp + "C");
			
			var date7:String = newXmlData.forecast.time[6].@day;
			var day7MaxTemp:String = newXmlData.forecast.time[6].temperature.@max;
			var day7MinTemp:String = newXmlData.forecast.time[6].temperature.@min;
			var day7WeatherCode:int = newXmlData.forecast.time[6].symbol.@number;
			//textInfoArray[6].text = "";
			textInfoArray[6].appendText(date7.substring(5,10) + "\nMax temp: " + day7MaxTemp  + "C" + "\nMin temp: " + day7MinTemp + "C");
			
			var weatherCodeArray:Array = [day1WeatherCode, day2WeatherCode, day3WeatherCode, day4WeatherCode, day5WeatherCode, day6WeatherCode, day7WeatherCode];
			
			trace(newXmlData.*);
			
			
			for(var i:int = 0; i < 7; i++)
			{
				addChild(textInfoArray[i]);
				determineWeather(weatherCodeArray[i], i);
			}
			
			initializeMoviePositions();
		}
		
		public function determineWeather(type:int, dayNum:int)
		{
			if(type >= 200 && type <= 202)
			{
				//thunder
				weatherClipArray[dayNum] = new tStormRain_mc;//weatherArray[4];
				weatherClipArray[dayNum].addEventListener(MouseEvent.CLICK, clickHandler);
				addChild(weatherClipArray[dayNum]);
				trace("thunder w/ rain");
			}
			if(type >= 203 && type <= 232)
			{
				//thunder
				weatherClipArray[dayNum] = new thunderstorm_mc;//weatherArray[3];
				weatherClipArray[dayNum].addEventListener(MouseEvent.CLICK, clickHandler);
				addChild(weatherClipArray[dayNum]);
				trace("thunder");
			}
			else if(type >= 500 && type <= 522)
			{
				//rain
				weatherClipArray[dayNum] = new rainyDay_mc;//weatherArray[2];
				weatherClipArray[dayNum].addEventListener(MouseEvent.CLICK, clickHandler);
				addChild(weatherClipArray[dayNum]);
				trace("rain");
			}
			else if(type >= 600 && type <= 621)
			{
				//snowy
				weatherClipArray[dayNum] = new snowyDay_mc;//weatherArray[5];
				weatherClipArray[dayNum].addEventListener(MouseEvent.CLICK, clickHandler);
				addChild(weatherClipArray[dayNum]);
				trace("snow");
			}
			else if(type == 800)
			{
				//sunny
				weatherClipArray[dayNum] = new sunnyDay_mc;//weatherArray[0];
				weatherClipArray[dayNum].addEventListener(MouseEvent.CLICK, clickHandler);
				addChild(weatherClipArray[dayNum]);
				trace("sun");
			}
			else if(type >= 801 && type <= 804)
			{
				//cloudy
				weatherClipArray[dayNum] = new cloudyDay_mc;//weatherArray[1];
				weatherClipArray[dayNum].addEventListener(MouseEvent.CLICK, clickHandler);
				addChild(weatherClipArray[dayNum]);
				trace("cloud");
			}
		}
		
		public function determineDetailedWeather()
		{
			trace("Determining detailed weather for selected day");
		}
		
		public function initializeMoviePositions()
		{
			//detailedClip.x = 375;
//			detailedClip.y = 200;
//			detailedInfo.x = 375;
//			detailedInfo.y = 300;
			
			weatherClipArray[0].x = 195;
			weatherClipArray[0].y = 200;
			textInfoArray[0].x = 150;
			textInfoArray[0].y = 200;
			
			weatherClipArray[1].x = 345;
			weatherClipArray[1].y = 200;
			textInfoArray[1].x = 300;
			textInfoArray[1].y = 200;
			
			weatherClipArray[2].x = 495;
			weatherClipArray[2].y = 200;
			textInfoArray[2].x = 450;
			textInfoArray[2].y = 200;
			
			weatherClipArray[3].x = 645;
			weatherClipArray[3].y = 200;
			textInfoArray[3].x = 600;
			textInfoArray[3].y = 200;
			
			weatherClipArray[4].x = 270;
			weatherClipArray[4].y = 500;
			textInfoArray[4].x = 225;
			textInfoArray[4].y = 500;
			
			weatherClipArray[5].x = 420;
			weatherClipArray[5].y = 500;
			textInfoArray[5].x = 375;
			textInfoArray[5].y = 500;
			
			weatherClipArray[6].x = 570;
			weatherClipArray[6].y = 500;
			textInfoArray[6].x = 525;
			textInfoArray[6].y = 500;
		}
		
		public function initializeAnims()
		{
			today = new Date(2014, 0, 16);
			
			weatherArray = new Array(new sunnyDay_mc, new cloudyDay_mc, new rainyDay_mc, new thunderstorm_mc, new tStormRain_mc, new snowyDay_mc);
			weatherClipArray = new Array(new MovieClip(), new MovieClip(), new MovieClip(), new MovieClip(), new MovieClip(), new MovieClip(), new MovieClip());
			dayArray = new Array(today, new Date(2014, 0, 17), new Date(2014, 0, 18), new Date(2014, 0, 19), 
												 new Date(2014, 0, 20), new Date(2014, 0, 21), new Date(2014, 0, 22), new Date(2014, 0, 23));
			textInfoArray = new Array(new TextField(), new TextField(), new TextField(), new TextField(), new TextField(), new TextField(), new TextField());
		}

		public function milestone1_3()
		{
			initializeAnims();
			//localData = SharedObject.getLocal("milestoneLocalData");
//			trace(localData.data.cityName);
			
			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("http://api.openweathermap.org/data/2.5/forecast/daily?q=Salt+Lake+City&mode=xml&units=metric&cnt=7"));
			myLoader.addEventListener(Event.COMPLETE, processInitXml);
			cityInputText.addEventListener(KeyboardEvent.KEY_DOWN, textHandler);
		}
		
		public function clearStage()
		{
			for(var i:int = 0; i < weatherClipArray.length; i++)
			{
				this.removeChild(weatherClipArray[i]);
			}
		}
		
		public function clearText()
		{
			for(var i:int = 0; i < textInfoArray.length; i++)
			{
				textInfoArray[i].text = "";
			}
			
		}
		
		public function showDetailedInfo()
		{
			clearStage();
			clearText();
			
			var format:TextFormat = new TextFormat();
			format.size = 72;
			format.bold = true;
			var doesntWork:TextField = new TextField();
			doesntWork.defaultTextFormat = format;
			doesntWork.text = "DOESN'T WORK";
			doesntWork.width = 600;
			doesntWork.x = 125;
			doesntWork.y = 200;
			addChild(doesntWork);
			//determineDetailedWeather();
		}
		
		
		//Movie clip mouse listener
		function clickHandler(event:MouseEvent) :void
		{
			trace("Clearing stage and getting detailed info");
			showDetailedInfo();
		}
		
		//Text input listener
		function textHandler(event:KeyboardEvent)
		{
		   // if enter is pressed
		   if(event.charCode == 13)
		   {
			   //Replaces spaces used in city names with + so that they can be sent in the url
			   //Ex. Salt Lake City is renamed to Salt+Lake+City
			   var cityInputString = cityInputText.text;
			   cityInputString.replace("\ ", "+");
			   
			   //Clears stage of previous animations
			   clearStage();
			   var myLoader:URLLoader = new URLLoader();
			   myLoader.load(new URLRequest("http://api.openweathermap.org/data/2.5/forecast/daily?q=" + cityInputString + "&mode=xml&units=metric&cnt=7"));
			   myLoader.addEventListener(Event.COMPLETE, processXml);
			   trace("Enter was pressed");
		   }
		}
	}
}

//Old code
//for(var i:int = 0; i < weatherClipArray.length; i++)
//{
//	trace("adding mouse listener to movie clip");
//	weatherClipArray[i].addEventListener(MouseEvent.CLICK, clickHandler);
//	trace("successfully added mouse listener");
//}