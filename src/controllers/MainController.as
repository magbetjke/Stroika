package controllers {
import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;

import mx.controls.Alert;

//Singleton Class

public class MainController {

    //-------------Singleton Start--------------//

    private static var _instance:MainController;

    public static function get instance():MainController {
        if (!_instance) _instance = new MainController(new SingletonData());
        return _instance;
    }

    public function MainController(singletonData:SingletonData):void {
    }

    //--------------Singleton End---------------//

    private var _loader:URLLoader;

    private var _xml:XML;

    public function init(url:String):void {
        fetchXML(url);
    }

    private function fetchXML(url:String):void {
        var urlRequest:URLRequest = new URLRequest(url);
        _loader = new URLLoader();
        _loader.addEventListener(Event.COMPLETE, xmlLoaded);
        _loader.addEventListener(ErrorEvent.ERROR, onError);
        _loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
        _loader.load(urlRequest);
    }

    private function xmlLoaded(event:Event):void {

        XML.ignoreWhitespace = true;

        _xml = XML(event.currentTarget.data);

        if (_xml)
            parseXML(_xml);

        removeLoader();
    }

    private function onError(event:ErrorEvent):void {

        Alert.show('XML loading failed!');

        removeLoader();
    }

    private function parseXML(xml:XML):void {
        trace(xml.toString());
    }

    private function removeLoader():void {
        _loader.removeEventListener(Event.COMPLETE, xmlLoaded);
        _loader.removeEventListener(ErrorEvent.ERROR, onError);
        _loader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
        _loader = null;
    }
    
}
}

//Private Singleton class

class SingletonData {
    public function SingletonData():void {
        //private class constructor
    }
}