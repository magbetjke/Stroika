package utils {
import data.ApartmentData;

import flash.display.Bitmap;

public class Type145Factory implements IBitmapFactory {

    [Embed(source="/assets/floorSquare/type2/55-37.png")]
    private static var ap1:Class;
    [Embed(source="/assets/floorSquare/type2/top57-97.png")]
    private static var topAp1:Class;


    [Embed(source="/assets/floorSquare/type2/49-79.png")]
    private static var ap2:Class;
    [Embed(source="/assets/floorSquare/type2/76-40.png")]
    private static var ap3:Class;
    [Embed(source="/assets/floorSquare/type2/top79-00.png")]
    private static var topAp3:Class;
    [Embed(source="/assets/floorSquare/type2/35-49.png")]
    private static var ap4:Class;
    [Embed(source="/assets/floorSquare/type2/65-60.png")]
    private static var ap5:Class;
    [Embed(source="/assets/floorSquare/type2/top68-20.png")]
    private static var topAp5:Class;
    [Embed(source="/assets/floorSquare/type2/50-15.png")]
    private static var ap6:Class;
    [Embed(source="/assets/floorSquare/type2/41-72.png")]
    private static var ap7:Class;
    [Embed(source="/assets/floorSquare/type2/50-67.png")]
    private static var ap8:Class;
    [Embed(source="/assets/floorSquare/type2/65-60-2.png")]
    private static var ap9:Class;
    [Embed(source="/assets/floorSquare/type2/top68-20-2.png")]
    private static var topAp9:Class;
    [Embed(source="/assets/floorSquare/type2/33-45.png")]
    private static var ap10:Class;

    [Embed(source="/assets/floorSquare/type2/floorPlan.jpg")]
    private static var floorPlan:Class;
    [Embed(source="/assets/floorSquare/type2/topFloorPlan.jpg")]
    private static var topFloorPlan:Class;

    public static const instance:Type145Factory = new Type145Factory();

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