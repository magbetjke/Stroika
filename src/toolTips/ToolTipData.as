package toolTips {
import flash.display.DisplayObject;
import flash.events.Event;
import flash.geom.Point;
import flash.utils.clearTimeout;
import flash.utils.setTimeout;

import mx.containers.VBox;
import mx.core.Application;
import mx.core.FlexGlobals;
import mx.core.UIComponent;
import mx.events.FlexMouseEvent;
import mx.managers.PopUpManager;
import mx.managers.SystemManager;

public class ToolTipData extends VBox {
    private var _dataToolTip:Object;
    public var target:UIComponent;
    protected var preferX:Number;
    protected var preferY:Number;

    public function ToolTipData() {
        mouseChildren = false;
        mouseEnabled = false;

        verticalScrollPolicy = "off";
        horizontalScrollPolicy = "off";
    }

    private function onMouseDown(event:Event):void {
        //   (event.currentTarget as UIComponent).removeEventListener(MouseEvent.MOUSE_OVER, onMouseDown);
        closeToolTip();
    }

    protected function changeDataToolTip(newValue:Object):void {

    }

    public var dataToolTipChanged:Boolean;

    [Bindable]
    public function get dataToolTip():Object {
        return _dataToolTip;
    }

    public function set dataToolTip(value:Object):void {
        if (_dataToolTip != value) {
            _dataToolTip = value;
            dataToolTipChanged = true;
            invalidateProperties();
        }
    }

    protected override function commitProperties():void {
        super.commitProperties();
        if (dataToolTipChanged) {
            changeDataToolTip(_dataToolTip);
            dataToolTipChanged = false;
        }
    }

    //============= OPEN ====================================
    private static var timer:uint;


    protected function isEmptyData(data:Object):Boolean {
        return !Boolean(data);
    }

    public function openToolTip(dataToolTip:Object, context:UIComponent, toolTipDelay:int = 400, x:Number = NaN,  y:Number = NaN, ...rest):void {

        this.dataToolTip = dataToolTip;
        if (isEmptyData(dataToolTip)) {
            closeToolTip();
            return;
        }

        this.target = context;

        clearTimeout(timer);
        timer = setTimeout(showToolTip, toolTipDelay);
        
        preferX = x;
        preferY = y;

    }

    public function closeToolTip():void {


        clearTimeout(timer);

        PopUpManager.removePopUp(this);

        removeEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, onMouseDown);
        //removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
        _dataToolTip = null;

    }

    public static const offset:Point = new Point(-15, 5);

    protected function showToolTip():void {

        try {
            var app:UIComponent = UIComponent(Application.application);

            if (!app)throw new Error("Application.application is null");

            try {
                PopUpManager.removePopUp(this);
            } catch (e:Error) {
                throw new Error("PopUpManager.removePopUp");
            }

           // try {
            var systemManager:SystemManager = SystemManager(SystemManager.getSWFRoot(this));
            if (systemManager) var parent:DisplayObject = DisplayObject(systemManager.application);
            if (!parent) parent = DisplayObject(FlexGlobals.topLevelApplication);
           PopUpManager.addPopUp(this, parent, false);
           visible = false;
          /*  } catch (e:Error) {
                throw new Error("PopUpManager.addPopUp");
            }*/

            validatePosition();

            addEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, onMouseDown, false, 0, true);
            //addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown, false, 0, true);

        } catch (e:Error) {
            //sendException(e, true);
        }
    }

    protected function validatePosition():void {
        var scale:Number = 1;

        var app:UIComponent = UIComponent(Application.application);

        var p:Point = new Point(app.mouseX * scale, app.mouseY * scale);
        p.offset(offset.x, offset.y);


        p.x = Math.min(app.width - width, p.x);
        if (p.y + height > app.height && (p.y - height - offset.y > 0))p.y -= height + offset.y;

        this.x = p.x;
        this.y = p.y;
    }

    //============= SINGLETON ===========================
    private static var _instance:ToolTipData;

    public static function getInstance():ToolTipData {
        if (!_instance) _instance = new ToolTipData();
        return _instance;
    }

    //===================================================
}
}