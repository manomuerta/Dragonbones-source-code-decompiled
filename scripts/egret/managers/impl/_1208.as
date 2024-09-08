package egret.managers.impl
{
   import _1045._1082;
   import egret.core._1116;
   import egret.core._1121;
   import egret.core._1130;
   import egret.core._1133;
   import egret.core._1134;
   import egret.core._1141;
   import egret.core.ns_egret;
   import egret.managers._1210;
   import egret.managers._1211;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   
   use namespace ns_egret;
   
   public class _1208 extends EventDispatcher implements _1210
   {
      private static const REMOVE_FROM_SYSTEMMANAGER:String = "removeFromSystemManager";
      
      private var _8980:Array;
      
      private var _8970:Vector.<PopUpData>;
      
      private var _8976:uint = 0;
      
      private var _8975:Number = 0.5;
      
      private var _8967:Vector.<_1211>;
      
      private var _8966:Boolean = false;
      
      private var _8973:Dictionary;
      
      public function _1208()
      {
         this._8980 = [];
         this._8970 = new Vector.<PopUpData>();
         this._8967 = new Vector.<_1211>();
         this._8973 = new Dictionary(true);
         super();
      }
      
      public function get _8981() : Array
      {
         return this._8980.concat();
      }
      
      private function _8971(param1:_1133) : PopUpData
      {
         var _loc2_:PopUpData = null;
         for each(_loc2_ in this._8970)
         {
            if(_loc2_.popUp == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function addPopUp(param1:_1133, param2:Boolean = false, param3:Boolean = true, param4:_1211 = null) : void
      {
         if(!param4)
         {
            param4 = _1141.ns_egret::_8713[0];
         }
         if(!param4)
         {
            return;
         }
         var _loc5_:PopUpData = this._8971(param1);
         if(_loc5_)
         {
            _loc5_._2507 = param2;
            param1.removeEventListener(REMOVE_FROM_SYSTEMMANAGER,this._4330);
         }
         else
         {
            _loc5_ = new PopUpData(param1,param2);
            this._8970.push(_loc5_);
            this._8980.push(param1);
         }
         param4._8969.addElement(param1);
         if(param3)
         {
            this._8974(param1);
         }
         if(param1 is _1130)
         {
            _1130(param1)._8574 = true;
         }
         if(param2)
         {
            this._8968(param4);
         }
         param1.addEventListener(REMOVE_FROM_SYSTEMMANAGER,this._4330);
      }
      
      private function _4330(param1:Event) : void
      {
         var _loc3_:PopUpData = null;
         var _loc2_:int = 0;
         for each(_loc3_ in this._8970)
         {
            if(_loc3_.popUp == param1.target)
            {
               if(_loc3_.popUp is _1130)
               {
                  _1130(_loc3_.popUp)._8574 = false;
               }
               _loc3_.popUp.removeEventListener(REMOVE_FROM_SYSTEMMANAGER,this._4330);
               this._8970.splice(_loc2_,1);
               this._8980.splice(_loc2_,1);
               this._8968(_loc3_.popUp.parent as _1211);
               break;
            }
            _loc2_++;
         }
      }
      
      public function get _8979() : uint
      {
         return this._8976;
      }
      
      public function set _8979(param1:uint) : void
      {
         var _loc2_:_1211 = null;
         if(this._8976 == param1)
         {
            return;
         }
         this._8976 = param1;
         for each(_loc2_ in _1141.ns_egret::_8713)
         {
            this._8968(_loc2_);
         }
      }
      
      public function get _8978() : Number
      {
         return this._8975;
      }
      
      public function set _8978(param1:Number) : void
      {
         var _loc2_:_1211 = null;
         if(this._8975 == param1)
         {
            return;
         }
         this._8975 = param1;
         for each(_loc2_ in _1141.ns_egret::_8713)
         {
            this._8968(_loc2_);
         }
      }
      
      private function _8968(param1:_1211) : void
      {
         if(!param1)
         {
            return;
         }
         if(this._8967.indexOf(param1) == -1)
         {
            this._8967.push(param1);
         }
         if(!this._8966)
         {
            this._8966 = true;
            _1141.ns_egret::stage.addEventListener(Event.ENTER_FRAME,this._8972);
            _1141.ns_egret::stage.addEventListener(Event.RENDER,this._8972);
            _1141.ns_egret::stage.invalidate();
         }
      }
      
      private function _8972(param1:Event) : void
      {
         var _loc2_:_1211 = null;
         this._8966 = false;
         _1141.ns_egret::stage.removeEventListener(Event.ENTER_FRAME,this._8972);
         _1141.ns_egret::stage.removeEventListener(Event.RENDER,this._8972);
         for each(_loc2_ in this._8967)
         {
            this._8977(_loc2_);
         }
         this._8967.length = 0;
      }
      
      private function _8977(param1:_1211) : void
      {
         var _loc6_:_1133 = null;
         var _loc7_:PopUpData = null;
         var _loc2_:_1116 = param1._8969;
         var _loc3_:Boolean = false;
         var _loc4_:int = _loc2_._2249 - 1;
         while(_loc4_ >= 0)
         {
            _loc6_ = _loc2_.getElementAt(_loc4_);
            _loc7_ = this._8971(_loc6_);
            if((Boolean(_loc7_)) && _loc7_._2507)
            {
               _loc3_ = true;
               break;
            }
            _loc4_--;
         }
         var _loc5_:_1082 = this._8973[param1];
         if(_loc3_)
         {
            if(!_loc5_)
            {
               this._8973[param1] = _loc5_ = new _1082();
               _loc5_.top = _loc5_.left = _loc5_.right = _loc5_.bottom = 0;
            }
            (_loc5_ as _1082).fillColor = this._8976;
            _loc5_.alpha = this._8975;
            if(_loc5_.parent == param1)
            {
               if(_loc2_.getElementIndex(_loc5_) < _loc4_)
               {
                  _loc4_--;
               }
               _loc2_.setElementIndex(_loc5_,_loc4_);
            }
            else
            {
               _loc2_.addElementAt(_loc5_,_loc4_);
            }
         }
         else if(Boolean(_loc5_) && _loc5_.parent == param1)
         {
            _loc2_.removeElement(_loc5_);
         }
      }
      
      public function removePopUp(param1:_1133) : void
      {
         if(param1 && param1.parent && Boolean(this._8971(param1)))
         {
            if(param1.parent is _1134)
            {
               _1134(param1.parent).removeElement(param1);
            }
            else if(param1 is DisplayObject)
            {
               param1.parent.removeChild(DisplayObject(param1));
            }
         }
      }
      
      public function _8974(param1:_1133) : void
      {
         param1.top = param1.bottom = param1.left = param1.right = NaN;
         param1.verticalCenter = param1.horizontalCenter = 0;
         var _loc2_:DisplayObjectContainer = param1.parent;
         if(_loc2_)
         {
            if(param1 is _1121)
            {
               _1121(param1)._2449();
            }
            param1.x = (_loc2_.width - param1.layoutBoundsWidth) * 0.5;
            param1.y = (_loc2_.height - param1.layoutBoundsHeight) * 0.5;
         }
      }
      
      public function bringToFront(param1:_1133) : void
      {
         var _loc3_:_1211 = null;
         var _loc2_:PopUpData = this._8971(param1);
         if(Boolean(_loc2_) && param1.parent is _1211)
         {
            _loc3_ = param1.parent as _1211;
            _loc3_._8969.setElementIndex(param1,_loc3_._8969._2249 - 1);
            this._8968(_loc3_);
         }
      }
   }
}

import egret.core._1133;

class PopUpData
{
   public var popUp:_1133;
   
   public var _2507:Boolean;
   
   public function PopUpData(param1:_1133, param2:Boolean)
   {
      super();
      this.popUp = param1;
      this._2507 = param2;
   }
}

