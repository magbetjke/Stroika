package data {
import flash.display.Bitmap;

import utils.IBitmapFactory;
import utils.Type145Factory;
import utils.Type23Factory;

public class FloorData {
    
    public static const APARTMENTS_COUNT:int = 10;
    
    private var _floorNumber:uint;
    
    public var type:String = FloorType.LIVING_FLOOR; //FloorType

    private var _buildingType:String;
    
    public var bitmap:Bitmap;

    public var apartments:Vector.<ApartmentData> = new Vector.<ApartmentData>(0);

    public function FloorData():void {
        //test
        buildingType = BuildingData.TYPE_23;

        for (var i:int = 0; i < 10; i++) {
            var ap:ApartmentData = new ApartmentData();
            ap.state = ApartmentData.SOLD;
            ap.roomNumber = i + 1;
            ap.floorNumber = _floorNumber;
            ap.buildingType = _buildingType;
            if (i == 3) {
                ap.gallery = new <String>['/upload/iblock/8e2/8e2a65a366063305a27f7b23821e8aa2.jpg', '/upload/iblock/8e2/8e2a65a366063305a27f7b23821e8aa2.jpg'];
            }

            apartments.push(ap);
        }
    }

    public function set floorNumber(value:uint):void {
        if (_floorNumber == value) return;

        _floorNumber = value;

        for each (var apartmentData:ApartmentData in apartments) {
            apartmentData.floorNumber = _floorNumber;
        }

        updateBitmap();
    }

    public function set buildingType(value:String):void {
        if (_buildingType == value) return;

        _buildingType = value;

        updateBitmap();
    }

    public function get floorNumber():uint {
        return _floorNumber;
    }

    private function updateBitmap():void {
        if (!_floorNumber || !_buildingType) return;

        var factory:IBitmapFactory;

        if (_buildingType == BuildingData.TYPE_145) {
            factory = Type145Factory.instance;
        } else if (_buildingType == BuildingData.TYPE_23) {
            factory = Type23Factory.instance;
        } else {
            throw new Error('wrong building type');
        }

        bitmap = factory.getBitmap('floorPlan', _floorNumber >= 12);

    }
}
}