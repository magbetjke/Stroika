package views {
import data.ApartmentData;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.filters.DropShadowFilter;

import mx.core.UIComponent;

import spark.filters.GlowFilter;

import utils.BitmapFactory;

import utils.BitmapUtil;

public class FloorSquareApartmentView extends UIComponent {

    private var _bitmap:Bitmap = new Bitmap();

    private var _hitArea:Sprite = new Sprite;

    public var selectedArea:Bitmap = BitmapFactory.getBitmap('selectedArea');

    private var _selectionFlag:Bitmap = BitmapFactory.getBitmap('selectionFlag');

    private var _state:String;

    private var _stroke:DropShadowFilter = new DropShadowFilter(0, 0, 0x000000, .6, 2, 2, 10, 1, true);

    private var _dataProvider:ApartmentData;

    public var flagRight:int = 0;

    public static const NORMAL:String = 'normal';
    public static const OVER:String = 'over';
    public static const SELECTED:String = 'selected';

    public function FloorSquareApartmentView():void {
    }

    private function set bitmap(value:Bitmap):void {
        if (_bitmap == value) return;

        _bitmap = value;
        if (_bitmap) {
            _bitmap.width = _bitmap.bitmapData.width;
            _bitmap.height = _bitmap.bitmapData.height;
            _hitArea = BitmapUtil.createHitArea(_bitmap.bitmapData);
            updateChildren();
        }
    }

    private function updateChildren():void {
        if (numChildren > 0)
            removeChildren();


        scaleChildren();

        _bitmap.cacheAsBitmap = true;
        addChild(_bitmap);
        _hitArea.visible = false;
        addChild(_hitArea);
        hitArea = _hitArea;
        selectedArea.visible = false;
        selectedArea.cacheAsBitmap = true;
        selectedArea.smoothing = true;
        selectedArea.scaleX = selectedArea.scaleY = 1.7;
        selectedArea.alpha = .5;
        addChild(selectedArea);

        _selectionFlag.scaleX = _selectionFlag.scaleY = 1.7;
        _selectionFlag.x = flagRight ? _bitmap.width - flagRight : (_bitmap.width - _selectionFlag.width + 18) >> 1;
        _selectionFlag.y = (_bitmap.height - _selectionFlag.height) >> 1;
        _selectionFlag.visible = _state == SELECTED;
        selectedArea.filters = [_stroke];
        addChild(_selectionFlag);

        selectedArea.mask = _bitmap;
        selectedArea.visible = true;

    }

    private function scaleChildren():void {
        if (width > 0 || height > 0) {
            var scaleX:Number = width > 0 ? width / _bitmap.width : 1;
            var scaleY:Number = height > 0 ? height / _bitmap.height : 1;
            var resultScale:Number = Math.min(scaleX, scaleY);

            _bitmap.scaleX = resultScale;
            _bitmap.scaleY = resultScale;

            _hitArea.scaleX = resultScale;
            _hitArea.scaleY = resultScale;
        }
    }


    public function set state(state:String):void {
        if (_state == state) return;

        _state = state;

        _selectionFlag.visible = _state == SELECTED;
    }

    public function get state():String {
        return _state;
    }

    public function get dataProvider():ApartmentData {
        return _dataProvider;
    }

    public function set dataProvider(value:ApartmentData):void {
        if (_dataProvider == value) return;

        _dataProvider = value;

        bitmap = _dataProvider.bitmap;
    }

    public function updateView():void {
        removeChild(selectedArea);
        selectedArea = null;
        selectedArea = new Bitmap();
        selectedArea = BitmapFactory.getBitmap('selectedArea');


        //updateChildren();
    }
}
}