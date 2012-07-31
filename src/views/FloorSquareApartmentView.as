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
    
    private var _selectedArea:Bitmap = BitmapFactory.getBitmap('selectedArea');
    
    private var _selectionFlag:Bitmap = BitmapFactory.getBitmap('selectionFlag');
    
    private var _state:String;

    private var _stroke:DropShadowFilter = new DropShadowFilter(0, 0, 0x000000, .6, 2, 2, 10, 1, true);

    private var _dataProvider:ApartmentData;
    
    public static const NORMAL:String = 'normal';
    public static const OVER:String = 'over';
    public static const SELECTED:String = 'selected';
    //public static const NOT_SELECTED:String = 'unselected';

    public function FloorSquareApartmentView():void {
    }

    private function set bitmap(value:Bitmap):void {
        if (_bitmap == value) return;

        _bitmap = value;
        if (_bitmap){
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
        _selectedArea.visible = false;
        _selectedArea.cacheAsBitmap = true;
        _selectedArea.smoothing = true;
        _selectedArea.alpha = .5;
        addChild(_selectedArea);
        
        _selectionFlag.x = (_bitmap.width - _selectionFlag.width + 18) >> 1;
        _selectionFlag.y = (_bitmap.height - _selectionFlag.height) >> 1;
        _selectionFlag.visible = false;
        _selectedArea.filters = [_stroke];
        addChild(_selectionFlag);

        _selectedArea.mask = _bitmap;
        _selectedArea.visible = true;
        
    }
    
    private function scaleChildren():void {
        if (width > 0 || height > 0){
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
        
/*         switch (_state){
             case NORMAL:
                 _selectedArea.mask = null;
                 _selectedArea.visible = false;
                 _selectionFlag.visible = false;
                 break;
             case OVER:
                 _selectedArea.mask = _bitmap;
                 _selectedArea.visible = true;
                 break;
             case SELECTED:
                 _selectedArea.mask = _bitmap;
                 _selectedArea.visible = true;
                 _selectionFlag.visible = true;
                 break;
         }*/
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
}
}