package data {
import data.BuildingData;

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

    public var buildings:Vector.<BuildingData>;

    public static const HOST:String = 'http://ostrovmechty.ru';

    [Bindable]
    public var state:String = States.STEP1;
}
}

//Private Singleton class

class SingletonData {
    public function SingletonData():void {
        //private class constructor
    }
}