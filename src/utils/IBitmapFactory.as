package utils {
import flash.display.Bitmap;

public interface IBitmapFactory {

    function getBitmap(type:String, topFloor:Boolean = false):Bitmap;
}
}