package data {
import flash.display.Bitmap;

import utils.IBitmapFactory;

import utils.Type23Factory;

public class ApartmentData {
    
    public static const OCCUPIED:String = 'occupied';
    public static const SOLD:String = 'sold';
    public static const FREE:String = 'free';

    public static const APARTMENT_1:String = 'apartment1';
    public static const APARTMENT_2:String = 'apartment2';
    public static const APARTMENT_3:String = 'apartment3';
    public static const APARTMENT_4:String = 'apartment4';
    public static const APARTMENT_5:String = 'apartment5';
    public static const APARTMENT_6:String = 'apartment6';
    public static const APARTMENT_7:String = 'apartment7';
    public static const APARTMENT_8:String = 'apartment8';
    public static const APARTMENT_9:String = 'apartment9';
    public static const APARTMENT_10:String = 'apartment10';

    public var rooms:int = 2;
    public var state:String = FREE;
    public var square:Number = 0;
    public var liveSquare:Number = 0;
    public var wctype:Boolean;
    public var balcony:Boolean;
    public var price:Number = 0;
    public var gallery:Vector.<String> = new <String>[];

    private var _roomNumber:int;
    private var _floorNumber:int;
    private var _buildingType:String;
    
    public var bitmap:Bitmap;

    private function updateBitmap():void {
        if (!_floorNumber || !_buildingType || !_roomNumber) return;

        var factory:IBitmapFactory;

        if (_buildingType == BuildingData.TYPE_145) {
            //not yet
        } else if (_buildingType == BuildingData.TYPE_23) {
            factory = Type23Factory.instance;
        } else {
            throw new Error('wrong building type');
        }

        bitmap = factory.getBitmap('apartment' + _roomNumber, _floorNumber >= 12);
        
    }

    public function ApartmentData():void {
    }

    public function set floorNumber(value:int):void {
        if (_floorNumber == value) return;

        _floorNumber = value;

        updateBitmap();
    }

    public function set buildingType(value:String):void {
        if (_buildingType == value) return;

        _buildingType = value;

        updateBitmap();
    }

    public function set roomNumber(value:int):void {
        if (_roomNumber == value) return;

        _roomNumber = value;

        updateBitmap();
    }
}
}