package utils {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

public class BitmapUtil {

    public function BitmapUtil():void {
    }

    public static function createHitArea(bitmapData:BitmapData, grainSize:uint = 10):Sprite {
        var _hitArea:Sprite = new Sprite();
        _hitArea.graphics.beginFill(0x000000, 1.0);
        for (var x:uint = 0; x < bitmapData.width; x += grainSize) {
            for (var y:uint = grainSize; y < bitmapData.height; y += grainSize) {
                if (x <= bitmapData.width && y <= bitmapData.height && bitmapData.getPixel(x, y) != 0) {
                    _hitArea.graphics.drawRect(x, y, grainSize, grainSize);
                }
            }
        }
        _hitArea.graphics.endFill();
        return _hitArea;
    }
}
}