package _1045
{
   import _1177.UIEvent;
   import egret.core._1133;
   import egret.core._1134;
   import egret.core._1140;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   use namespace ns_egret;
   
   public class _1081 extends EventDispatcher
   {
      private static var _8256:int = 0;
      
      ns_egret var name:String;
      
      private var _8254:Array;
      
      private var _5142:Boolean = true;
      
      private var _8253:Object;
      
      private var _8255:RadioButton;
      
      public function _1081()
      {
         this._8254 = [];
         super();
         this.ns_egret::name = "radioButtonGroup" + _8256;
         ++_8256;
      }
      
      public function get enabled() : Boolean
      {
         return this._5142;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._5142 == param1)
         {
            return;
         }
         this._5142 = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this._8252)
         {
            this._8249(_loc2_)._2570();
            _loc2_++;
         }
      }
      
      public function get _8252() : int
      {
         return this._8254.length;
      }
      
      public function get _5568() : Object
      {
         if(this.selection)
         {
            return this.selection.value != null ? this.selection.value : this.selection.label;
         }
         return null;
      }
      
      public function set _5568(param1:Object) : void
      {
         var _loc4_:RadioButton = null;
         this._8253 = param1;
         if(param1 == null)
         {
            this.ns_egret::setSelection(null,false);
            return;
         }
         var _loc2_:int = this._8252;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this._8249(_loc3_);
            if(_loc4_.value == param1 || _loc4_.label == param1)
            {
               this._8251(_loc3_,false);
               this._8253 = null;
               dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT));
               break;
            }
            _loc3_++;
         }
      }
      
      public function get selection() : RadioButton
      {
         return this._8255;
      }
      
      public function set selection(param1:RadioButton) : void
      {
         if(this._8255 == param1)
         {
            return;
         }
         this.ns_egret::setSelection(param1,false);
      }
      
      public function _8249(param1:int) : RadioButton
      {
         if(param1 >= 0 && param1 < this._8252)
         {
            return this._8254[param1];
         }
         return null;
      }
      
      ns_egret function _8243(param1:RadioButton) : void
      {
         param1.addEventListener(Event.REMOVED,this._8246);
         this._8254.push(param1);
         this._8254.sort(this._8248);
         var _loc2_:int = 0;
         while(_loc2_ < this._8254.length)
         {
            this._8254[_loc2_]._8242 = _loc2_;
            _loc2_++;
         }
         if(this._8253)
         {
            this._5568 = this._8253;
         }
         if(param1.selected == true)
         {
            this.selection = param1;
         }
         param1.ns_egret::radioButtonGroup = this;
         param1._2570();
         dispatchEvent(new Event("numRadioButtonsChanged"));
      }
      
      ns_egret function _8240(param1:RadioButton) : void
      {
         this._8250(param1,false);
      }
      
      private function _8250(param1:RadioButton, param2:Boolean = true) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:RadioButton = null;
         if(param1)
         {
            _loc3_ = false;
            _loc4_ = 0;
            while(_loc4_ < this._8252)
            {
               _loc5_ = this._8249(_loc4_);
               if(_loc3_)
               {
                  --_loc5_.ns_egret::_8242;
               }
               else if(_loc5_ == param1)
               {
                  if(param2)
                  {
                     param1.addEventListener(Event.ADDED,this._8247);
                  }
                  if(param1 == this._8255)
                  {
                     this._8255 = null;
                  }
                  param1.ns_egret::radioButtonGroup = null;
                  param1._2570();
                  this._8254.splice(_loc4_,1);
                  _loc3_ = true;
                  _loc4_--;
               }
               _loc4_++;
            }
            if(_loc3_)
            {
               dispatchEvent(new Event("numRadioButtonsChanged"));
            }
         }
      }
      
      ns_egret function setSelection(param1:RadioButton, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._8255 == param1)
         {
            return;
         }
         if(!param1)
         {
            if(this.selection)
            {
               this._8255.selected = false;
               this._8255 = null;
               if(param2)
               {
                  dispatchEvent(new Event(Event.CHANGE));
               }
            }
         }
         else
         {
            _loc3_ = this._8252;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(param1 == this._8249(_loc4_))
               {
                  this._8251(_loc4_,param2);
                  break;
               }
               _loc4_++;
            }
         }
         dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT));
      }
      
      private function _8251(param1:int, param2:Boolean = true) : void
      {
         var _loc3_:RadioButton = this._8249(param1);
         if(Boolean(_loc3_) && _loc3_ != this._8255)
         {
            if(this._8255)
            {
               this._8255.selected = false;
            }
            this._8255 = _loc3_;
            this._8255.selected = true;
            if(param2)
            {
               dispatchEvent(new Event(Event.CHANGE));
            }
         }
      }
      
      private function _8248(param1:DisplayObject, param2:DisplayObject) : Number
      {
         var _loc3_:DisplayObjectContainer = param1.parent;
         var _loc4_:DisplayObjectContainer = param2.parent;
         if(!_loc3_ || !_loc4_)
         {
            return 0;
         }
         var _loc5_:int = param1 is _1140 ? _1140(param1)._7569 : -1;
         var _loc6_:int = param2 is _1140 ? _1140(param2)._7569 : -1;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(_loc3_ == _loc4_)
         {
            if(_loc3_ is _1134 && param1 is _1133)
            {
               _loc7_ = int(_1134(_loc3_).getElementIndex(_1133(param1)));
            }
            else
            {
               _loc7_ = DisplayObjectContainer(_loc3_).getChildIndex(param1);
            }
            if(_loc4_ is _1134 && param2 is _1133)
            {
               _loc8_ = int(_1134(_loc4_).getElementIndex(_1133(param2)));
            }
            else
            {
               _loc8_ = DisplayObjectContainer(_loc4_).getChildIndex(param2);
            }
         }
         if(_loc5_ > _loc6_ || _loc7_ > _loc8_)
         {
            return 1;
         }
         if(_loc5_ < _loc6_ || _loc8_ > _loc7_)
         {
            return -1;
         }
         if(param1 == param2)
         {
            return 0;
         }
         return this._8248(_loc3_,_loc4_);
      }
      
      private function _8247(param1:Event) : void
      {
         var _loc2_:RadioButton = param1.target as RadioButton;
         if(_loc2_)
         {
            _loc2_.removeEventListener(Event.ADDED,this._8247);
            this.ns_egret::_8243(_loc2_);
         }
      }
      
      private function _8246(param1:Event) : void
      {
         var _loc2_:RadioButton = param1.target as RadioButton;
         if(_loc2_)
         {
            _loc2_.removeEventListener(Event.REMOVED,this._8246);
            this._8250(_loc2_);
         }
      }
   }
}

