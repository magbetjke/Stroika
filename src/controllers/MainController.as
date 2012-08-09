package controllers {
import data.ApartmentData;
import data.BuildingData;
import data.FloorData;
import data.MainModel;

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
        var levels:XMLList = xml.children();
        for each (var level:XML in levels){
            for each (var building:XML in level.children()) {
                var buildingData:BuildingData = new BuildingData();
                buildingData.buildingType = uint(building.@number) == 2 || uint(building.@number) == 3 ? BuildingData.TYPE_23 : BuildingData.TYPE_145;
                var floors:XMLList = building.children();
                for each (var floor:XML in floors) {
                    var floorData:FloorData = new FloorData();
                    floorData.floorNumber = uint(floor.@number);
                    floorData.buildingType = buildingData.buildingType;
                    var apartments:XMLList = floor.children();
                    for each (var apartment:XML in apartments) {
                        var apartmentData:ApartmentData = new ApartmentData();
                        apartmentData.roomNumber = int(apartment.@number);
                        apartmentData.balcony = false;
                        apartmentData.rooms = int(apartment.roomcount);
                        apartmentData.buildingType = buildingData.buildingType;
                        apartmentData.floorNumber = floorData.floorNumber;
                        apartmentData.liveSquare = Number(apartment.livesquare);
                        apartmentData.square = Number(apartment.square);
                        apartmentData.price =  Number(apartment.price);
                        trace(XML(apartment.status).toString());
                        switch (XML(apartment.status).toString()) {
                            case ApartmentData.SOLD:
                                apartmentData.state = ApartmentData.SOLD;
                                break;
                            case ApartmentData.FREE:
                                apartmentData.state = ApartmentData.FREE;
                                break;
                            case ApartmentData.OCCUPIED:
                                apartmentData.state = ApartmentData.OCCUPIED;
                                break;
                            default:
                                apartmentData.state = ApartmentData.OCCUPIED;
                        }
                        //if (apartment.gallery){
                        var photos:XMLList = XML(apartment.gallery).children();
                        for each (var photo:XML in photos) {
                            apartmentData.gallery.push(XML(photo.view).toString());
                        }
                        //}
                        floorData.apartments[apartmentData.roomNumber - 1] = apartmentData;
                    }
                    buildingData.floors[floorData.floorNumber - 1] = floorData;
                }
                MainModel.instance.buildings[building.@number - 1] = buildingData;

            }
        }

        populateEmptyData();
    }

    private function populateEmptyData():void {
        for (var i:int = 0; i < 5; i++) {
            var buildings:Object = MainModel.instance.buildings;
            trace(buildings);
            var buildingData:BuildingData = MainModel.instance.buildings[i];
            if (!MainModel.instance.buildings[i]){
                buildingData = new BuildingData();
                buildingData.buildingType = (i == 1 || i == 2) ? BuildingData.TYPE_23 : BuildingData.TYPE_145;
                var endIndex:int = buildingData.buildingType == BuildingData.TYPE_23 ? 2 : 1;
                trace(endIndex);
                for (var j:int = 19; j > endIndex; j--) {
                    var floorData:FloorData = new FloorData();
                    floorData.floorNumber = j;
                    floorData.buildingType = buildingData.buildingType;
                    for (var k:int = 0; k < 10; k++) {
                        var apartmentData:ApartmentData = new ApartmentData();
                        apartmentData.balcony = false;
                        apartmentData.buildingType = buildingData.buildingType;
                        apartmentData.floorNumber = floorData.floorNumber;
                        apartmentData.liveSquare = 0;
                        apartmentData.square = 0;
                        apartmentData.roomNumber = 5;
                        apartmentData.price = 0;
                        floorData.apartments[k - 1] = apartmentData;
                    }
                    buildingData.floors[j - 1] = floorData;
                }

                MainModel.instance.buildings[i] = buildingData;
            }
        }
        var buildings:Object = MainModel.instance.buildings;
        trace(buildings);
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