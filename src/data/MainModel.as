package data {
import data.BuildingData;

import flash.events.Event;

import mx.states.State;

//Singleton Class

public class MainModel {

    //-------------Singleton Start--------------//

    private static var _instance:MainModel;

    public static function get instance():MainModel {
        if (!_instance) _instance = new MainModel(new SingletonData());
        return _instance;
    }

    public function MainModel(singletonData:SingletonData):void {
    }

    //--------------Singleton End---------------//

    [Bindable]
    public var selectedApartment:ApartmentData;

    [Bindable]
    public var selectedFloor:FloorData;

    [Bindable]
    public var selectedBuilding:BuildingData;

    public var buildings:Vector.<BuildingData> = new Vector.<BuildingData>(5, true);

    public static const HOST:String = 'http://www.ostrovmechty.ru';

    private var _allowActions:Boolean = false;

    [Bindable]
    public var state:String = States.STEP1;

    [Bindable]
    public var selectedBuildingIndex:int = 0;

    public static const XML_URL:String = /*'http://www.ostrovmechty.ru/xml/data.xml'*/'/xml/data.xml'/*'/files/test/data.xml'*//*'assets/data.xml'*/;

    public function get allowActions():Boolean {
        return _allowActions;
    }

    public function set allowActions(value:Boolean):void {
        _allowActions = value;

        if (_allowActions)
            dispatchEvent(new Event('xmlLoadingComplete'));
    }
}
}

//Private Singleton class

class SingletonData {
    public function SingletonData():void {
        //private class constructor
    }
}