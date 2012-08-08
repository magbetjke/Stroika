package lightboxGallery {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;
import flash.display.Shape;
import flash.display.Sprite;

import mx.core.UIComponent;

//Singleton Class

public class GalleryProgressBar extends Sprite {

    //-------------Singleton Start--------------//

    private static var _instance:GalleryProgressBar;

    public static function get instance():GalleryProgressBar {
        if (!_instance) _instance = new GalleryProgressBar(new SingletonData());
        return _instance;
    }

    //--------------Singleton End---------------//

    [Embed(source="assets/progress.png")]
    private var ProgressBMP:Class;

    private var _progressBar:Bitmap;

    private var _preloaderWidth:uint = 150;
    private var _preloaderHeight:uint = 10;

    private var _generalWidth:Number = 263;
    private var _generalHeight:Number = 157;

    private var _mask:Shape;

    private var _parent:DisplayObjectContainer;

    private var _shape:Shape = new Shape();
    
    public function GalleryProgressBar(singletonData:SingletonData):void {
        init();
    }


    private function init():void {
        _progressBar = new ProgressBMP;

        _progressBar.width = _preloaderWidth;
        _progressBar.height = _preloaderHeight;

        
        _shape.graphics.clear();
        _shape.graphics.beginFill(0xFFFFFF, .8);
        _shape.graphics.drawRect(0, 0, 1000, 1000);
        _shape.graphics.endFill();

        addChild(_shape);


        _progressBar.cacheAsBitmap = true;
        _progressBar.x = (_generalWidth - _progressBar.width) >> 1;
        _progressBar.y = (_generalHeight - _progressBar.height) >> 1;
        addChild(_progressBar);

        _mask = new Shape();
        _mask.graphics.clear();
        _mask.graphics.beginFill(0x00FF00);
        _mask.graphics.drawRect(0, 0, _progressBar.width, _progressBar.height);

        _mask.graphics.endFill();
        _mask.cacheAsBitmap = true;
        _mask.x = _progressBar.x;
        _mask.y = _progressBar.y;
        addChild(_mask);

        _progressBar.mask = _mask;
    }
    
    private function updatePositions(width:Number,  height:Number):void {
         _shape.width = width;
         _shape.height = height;
        
        _progressBar.x = (width - _progressBar.width) >> 1;
        _progressBar.y = (height - _progressBar.height) >> 1;
        
        _mask.x = _progressBar.x;
        _mask.y = _progressBar.y;
    }

    public function open(parent:DisplayObjectContainer):void {
        close();

        _parent = parent;
        
        updatePositions(_parent.width, _parent.height);
        
        _parent.mouseEnabled = false;
        _parent.addChild(this);
        _mask.width = 1;
    }

    public function progress(value:Number):void {
        _mask.width = _progressBar.width * value;
    }

    public function close():void {
        if (!_parent || !_parent.contains(this)) return;

        _parent.removeChild(this);
        _parent.mouseEnabled = true;
    }
}
}

//Private Singleton class

class SingletonData {
    public function SingletonData():void {
        //private class constructor
    }
}