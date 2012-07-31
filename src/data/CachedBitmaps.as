package data {
import flash.display.Bitmap;
import flash.utils.Dictionary;

public class CachedBitmaps {
    
    public static var bitmapByUrl:Dictionary = new Dictionary();

    public function CachedBitmaps():void {
    }
    
    public static function cache(url:String,  bitmap:Bitmap):void {
        bitmapByUrl[url] = bitmap;
    }
    
    public static function isCached(url:String):Boolean {
        return Boolean(bitmapByUrl[url]);
    }
}
}