package utils {
import data.ApartmentData;
import data.FloorType;

import flash.display.Bitmap;

public class BitmapFactory {

    [Embed(source="/assets/buildingFacade/roof.png")]
    private static var Roof:Class;
    [Embed(source="/assets/buildingFacade/livingFloor.png")]
    private static var LivingFloor:Class;
    [Embed(source="/assets/buildingFacade/techFloor.png")]
    private static var TechFloor:Class;

    [Embed(source="/assets/buildingFacade/apartmentFree.png")]
    private static var ApartmentFree:Class;
    [Embed(source="/assets/buildingFacade/apartmentSold.png")]
    private static var ApartmentSold:Class;
    [Embed(source="/assets/buildingFacade/apartmentOccupied.png")]
    private static var ApartmentOccupied:Class;

    [Embed(source="/assets/buildingFacade/floorMarker.png")]
    private static var FloorMarker:Class;
    [Embed(source="/assets/buildingFacade/floorMarkerGreen.png")]
    private static var FloorMarkerGreen:Class;

    [Embed(source="/assets/floorSquare/selectedArea.png")]
    private static var SelectedArea:Class;
    [Embed(source="/assets/floorSquare/selectionFlag.png")]
    private static var SelectionFlag:Class;

    [Embed(source="/assets/common/zoom.png")]
    private static var Zoom:Class;
    [Embed(source="/assets/common/roza.png")]
    private static var Roza:Class;
    [Embed(source="/assets/common/toolTipFacade.png")]
    private static var ToolTipFacade:Class;

    [Embed(source="/assets/step1/maskB1.png")]
    private static var MaskB1:Class;
    [Embed(source="/assets/step1/maskB2.png")]
    private static var MaskB2:Class;
    [Embed(source="/assets/step1/maskB3.png")]
    private static var MaskB3:Class;
    [Embed(source="/assets/step1/maskB4.png")]
    private static var MaskB4:Class;
    [Embed(source="/assets/step1/maskB5.png")]
    private static var MaskB5:Class;

    [Embed(source="/assets/step1/toolTip.png")]
    private static var ToolTipStep1:Class;

    [Embed(source="/assets/common/arrow.png")]
    private static var Arrow:Class;
    [Embed(source="/assets/common/button.png")]
    private static var Button:Class;

    [Embed(source="/assets/step1/topBuilding.png")]
    private static var topBuilding:Class;

    [Embed(source="/assets/step1/topBuildingOver.png")]
    private static var topBuildingOver:Class;



    public static function getBitmap(type:String):Bitmap {
        switch (type) {
            case FloorType.ROOF:
                return new Roof;
            case FloorType.LIVING_FLOOR:
                return new LivingFloor;
            case FloorType.TECH_FLOOR:
                return new TechFloor;
            case ApartmentData.FREE:
                return new ApartmentFree;
            case ApartmentData.SOLD:
                return new ApartmentSold;
            case ApartmentData.OCCUPIED:
                return new ApartmentOccupied;
            case 'floorMarker':
                return new FloorMarker;
            case 'floorMarkerGreen':
                return new FloorMarkerGreen;
            case 'selectedArea':
                return new SelectedArea;
            case 'selectionFlag':
                return new SelectionFlag;
            case 'roza':
                return new Roza;
            case 'zoom':
                return new Zoom;
            case 'toolTipFacade':
                return new ToolTipFacade;
            case 'maskB1':
                return new MaskB1;
            case 'maskB2':
                return new MaskB2;
            case 'maskB3':
                return new MaskB3;
            case 'maskB4':
                return new MaskB4;
            case 'maskB5':
                return new MaskB5;
            case 'toolTipStep1':
                return new ToolTipStep1;
            case 'button':
                return new Button;
            case 'arrow':
                return new Arrow;
            case 'topBuilding':
                return new topBuilding;
            case 'topBuildingOver':
                return new topBuildingOver;
            default:
                return null;
        }
    }

    public function BitmapFactory():void {
    }
}
}