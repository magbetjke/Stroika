package data {
public class BuildingData {

    public static const TYPE_145:String = 'type145';
    public static const TYPE_23:String = 'type23';

    public var buildingType:String;
    
    public var floors:Vector.<FloorData> = new Vector.<FloorData>(20);

    public function BuildingData():void {
/*        buildingType = BuildingData.TYPE_23;

        for (var i:int = 19; i > 2; i--) {
            var floorData:FloorData = new FloorData();
            floorData.floorNumber = i;
            floors.push(floorData);

        }*/
    }
}
}