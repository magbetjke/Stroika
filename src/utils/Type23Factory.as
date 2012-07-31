package utils {
import data.ApartmentData;

import flash.display.Bitmap;

public class Type23Factory implements IBitmapFactory {

    [Embed(source="/assets/floorSquare/type1/65-76.png")]
    private static var ap1:Class;
    [Embed(source="/assets/floorSquare/type1/top68-36.png")]
    private static var topAp1:Class;


    [Embed(source="/assets/floorSquare/type1/38-56.png")]
    private static var ap2:Class;
    [Embed(source="/assets/floorSquare/type1/74-17.png")]
    private static var ap3:Class;
    [Embed(source="/assets/floorSquare/type1/top76-78.png")]
    private static var topAp3:Class;
    [Embed(source="/assets/floorSquare/type1/36-32.png")]
    private static var ap4:Class;
    [Embed(source="/assets/floorSquare/type1/65-68.png")]
    private static var ap5:Class;
    [Embed(source="/assets/floorSquare/type1/top68-25.png")]
    private static var topAp5:Class;
    [Embed(source="/assets/floorSquare/type1/50-12.png")]
    private static var ap6:Class;
    [Embed(source="/assets/floorSquare/type1/39-43.png")]
    private static var ap7:Class;
    [Embed(source="/assets/floorSquare/type1/34-11.png")]
    private static var ap8:Class;
    [Embed(source="/assets/floorSquare/type1/83-68.png")]
    private static var ap9:Class;
    [Embed(source="/assets/floorSquare/type1/top85-75.png")]
    private static var topAp9:Class;
    [Embed(source="/assets/floorSquare/type1/33-32.png")]
    private static var ap10:Class;

    [Embed(source="/assets/floorSquare/type1/floorPlan.png")]
    private static var floorPlan:Class;
    [Embed(source="/assets/floorSquare/type1/topFloorPlan.png")]
    private static var topFloorPlan:Class;

    public static const instance:Type23Factory = new Type23Factory();

    public function getBitmap(type:String, topFloor:Boolean = false):Bitmap {
        switch (type) {
            case ApartmentData.APARTMENT_1:
                return topFloor ? new topAp1 : new ap1;
                break;
            case ApartmentData.APARTMENT_2:
                return new ap2;
                break;
            case ApartmentData.APARTMENT_3:
                return topFloor ? new topAp3 : new ap3;
                break;
            case ApartmentData.APARTMENT_4:
                return new ap4;
                break;
            case ApartmentData.APARTMENT_5:
                return topFloor ? new topAp5 : new ap5;
                break;
            case ApartmentData.APARTMENT_6:
                return new ap6;
                break;
            case ApartmentData.APARTMENT_7:
                return new ap7;
                break;
            case ApartmentData.APARTMENT_8:
                return new ap8;
                break;
            case ApartmentData.APARTMENT_9:
                return topFloor ? new topAp9 : new ap9;
                break;
            case ApartmentData.APARTMENT_10:
                return new ap10;
                break;
            case 'floorPlan':
                return topFloor ? new topFloorPlan : new floorPlan;
                break;
            default:
                return BitmapFactory.getBitmap(type);
        }
    }
}
}