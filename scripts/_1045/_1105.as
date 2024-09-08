package _1045
{
   import _1088._1089;
   import _1177.UIEvent;
   import egret.core.Injector;
   import egret.core._1109;
   import egret.core._1110;
   import egret.core._1113;
   import egret.core._1114;
   import egret.core._1115;
   import egret.core._1122;
   import egret.core._1129;
   import egret.core._1140;
   import egret.core.ns_egret;
   import egret.utils._1290;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   use namespace ns_egret;
   
   public class _1105 extends _1140 implements _1113
   {
      private static var _8598:_1114;
      
      private static var rect:Rectangle = new Rectangle();
      
      private static var matrix:Matrix = new Matrix();
      
      private static const errorStr:String = "在此组件中不可用，若此组件为容器类，请使用";
      
      private var _8580:Number = 1;
      
      private var _8602:String = "scale";
      
      private var _8600:Rectangle;
      
      private var _8593:Boolean = false;
      
      ns_egret var _5864:Object;
      
      ns_egret var _8603:Object;
      
      private var _7405:Boolean = false;
      
      private var _8594:Boolean = false;
      
      private var _8586:Number = 0;
      
      private var _8584:Number = 0;
      
      private var _8581:Boolean = false;
      
      private var _8587:Array;
      
      ns_egret var aspectRatio:Number = NaN;
      
      public var _5415:Boolean = true;
      
      private var _8589:BitmapData;
      
      public function _1105(param1:Object = null, param2:Boolean = true)
      {
         this._8587 = [];
         super();
         mouseChildren = false;
         if(param1)
         {
            this.source = param1;
         }
         this._5415 = param2;
         this.addEventListener(Event.REMOVED_FROM_STAGE,this._8064);
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function _8064(param1:Event) : void
      {
         stage.removeEventListener(UIEvent.SCREEN_DPI_CHANGED,this._8056);
      }
      
      public function get contentsScaleFactor() : Number
      {
         return this._8580;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         if(this._8580 != stage.contentsScaleFactor)
         {
            this._8580 = stage.contentsScaleFactor;
            if(this.content is _1110)
            {
               _1110(this.content)._8591(this);
            }
         }
         stage.addEventListener(UIEvent.SCREEN_DPI_CHANGED,this._8056);
      }
      
      private function _8056(param1:Event) : void
      {
         this._8580 = stage.contentsScaleFactor;
         if(this.content is _1110)
         {
            _1110(this.content)._8591(this);
         }
      }
      
      public function get _8604() : String
      {
         return this._8602;
      }
      
      public function set _8604(param1:String) : void
      {
         if(this._8602 == param1)
         {
            return;
         }
         this._8602 = param1;
         if(this.ns_egret::_8603 is BitmapData)
         {
            invalidateDisplayList();
         }
      }
      
      override public function get scale9Grid() : Rectangle
      {
         return this._8600;
      }
      
      override public function set scale9Grid(param1:Rectangle) : void
      {
         if(this._8600 == param1)
         {
            return;
         }
         this._8600 = param1;
         if(this.ns_egret::_8603 is BitmapData)
         {
            this._8587.length = 0;
            invalidateDisplayList();
         }
      }
      
      public function get source() : Object
      {
         return this.ns_egret::_5864;
      }
      
      public function set source(param1:Object) : void
      {
         if(this.ns_egret::_5864 == param1)
         {
            return;
         }
         this.ns_egret::_5864 = param1;
         if(this._7405)
         {
            this._8599();
         }
         else
         {
            this._8593 = true;
         }
      }
      
      public function get content() : Object
      {
         return this.ns_egret::_8603;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         if(this._8593)
         {
            this._8599();
         }
         this._7405 = true;
      }
      
      private function _8599() : void
      {
         var _loc2_:Object = null;
         this._8593 = false;
         var _loc1_:_1114 = this.ns_egret::_8601();
         if(!this.ns_egret::_5864)
         {
            this._8592(null,this.ns_egret::_5864);
         }
         else
         {
            _loc2_ = this._8594 ? null : this.ns_egret::_8603;
            this._8594 = true;
            _loc1_._1579(this.ns_egret::_5864,this._8592,_loc2_);
         }
      }
      
      ns_egret function _8601() : _1114
      {
         var adapter:_1114 = null;
         if(_8598)
         {
            return _8598;
         }
         try
         {
            adapter = Injector.getInstance(_1114);
         }
         catch(e:Error)
         {
            adapter = new _1089();
         }
         _8598 = adapter;
         return adapter;
      }
      
      private function _8592(param1:Object, param2:Object) : void
      {
         var _loc3_:UIEvent = null;
         if(param2 !== this.ns_egret::_5864)
         {
            return;
         }
         this._8597(param1,param2);
         this._8594 = false;
         if(hasEventListener(UIEvent.CONTENT_CHANGED))
         {
            _loc3_ = new UIEvent(UIEvent.CONTENT_CHANGED);
            dispatchEvent(_loc3_);
         }
      }
      
      protected function _8597(param1:Object, param2:Object) : void
      {
         var _loc4_:Boolean = false;
         var _loc3_:Object = this.ns_egret::_8603;
         this.ns_egret::_8603 = param1;
         if(_loc3_ !== param1)
         {
            if(_loc3_ is DisplayObject)
            {
               if(DisplayObject(_loc3_).parent == this)
               {
                  ns_egret::removeFromDisplayList(DisplayObject(_loc3_));
               }
            }
            else if(_loc3_ is BitmapData || _loc3_ is _1129 || _loc3_ is _1110)
            {
               _loc4_ = this.ns_egret::_8603 is BitmapData || this.ns_egret::_8603 is _1129 || this.ns_egret::_8603 is _1110;
               if(!_loc4_)
               {
                  graphics.clear();
               }
            }
            if(param1 is DisplayObject)
            {
               ns_egret::addToDisplayListAt(DisplayObject(param1),0);
            }
            else if(param1 is _1110)
            {
               _1110(param1)._8591(this);
            }
         }
         this._8587.length = 0;
         invalidateSize();
         invalidateDisplayList();
      }
      
      override protected function _7028() : void
      {
         super._7028();
         if(!this.ns_egret::_8603)
         {
            return;
         }
         if(this.ns_egret::_8603 is _1122 && !(this.ns_egret::_8603 as _1122).includeInLayout)
         {
            return;
         }
         var _loc1_:Rectangle = this._8590();
         this.measuredWidth = _loc1_.width;
         this.measuredHeight = _loc1_.height;
         this._8586 = this.measuredWidth;
         this._8584 = this.measuredHeight;
      }
      
      private function _8590() : Rectangle
      {
         var _loc1_:_1110 = null;
         var _loc2_:BitmapData = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         this._8589 = null;
         if(this.ns_egret::_8603 is _1122)
         {
            rect.width = (this.ns_egret::_8603 as _1122).preferredWidth;
            rect.height = (this.ns_egret::_8603 as _1122).preferredHeight;
         }
         else if(this.ns_egret::_8603 is _1115)
         {
            rect.width = (this.ns_egret::_8603 as _1115).measuredWidth;
            rect.height = (this.ns_egret::_8603 as _1115).measuredHeight;
         }
         else if(this.ns_egret::_8603 is _1110)
         {
            _loc1_ = this.ns_egret::_8603 as _1110;
            _loc2_ = _loc1_.bitmapData;
            if(_loc2_)
            {
               rect.width = _loc2_.width;
               rect.height = _loc2_.height;
            }
            else
            {
               _loc2_ = _loc1_._8585;
               if(_loc2_)
               {
                  rect.width = _loc2_.width / 2;
                  rect.height = _loc2_.height / 2;
               }
               else
               {
                  rect.width = this._8586;
                  rect.height = this._8584;
               }
            }
            this._8589 = _loc2_;
         }
         else if(this.ns_egret::_8603 is BitmapData)
         {
            rect.width = BitmapData(this.ns_egret::_8603).width;
            rect.height = BitmapData(this.ns_egret::_8603).height;
         }
         else if(this.ns_egret::_8603 is _1129)
         {
            rect.width = _1129(this.ns_egret::_8603)._8596;
            rect.height = _1129(this.ns_egret::_8603)._8595;
         }
         else if(this.ns_egret::_8603 is DisplayObject)
         {
            _loc3_ = Number(this.ns_egret::_8603.scaleX);
            _loc4_ = Number(this.ns_egret::_8603.scaleY);
            this.ns_egret::_8603.scaleX = 1;
            this.ns_egret::_8603.scaleY = 1;
            rect.width = this.ns_egret::_8603.width;
            rect.height = this.ns_egret::_8603.height;
            this.ns_egret::_8603.scaleX = _loc3_;
            this.ns_egret::_8603.scaleY = _loc4_;
         }
         if(rect.width == 0 || rect.height == 0)
         {
            this.ns_egret::aspectRatio = 0;
         }
         else
         {
            this.ns_egret::aspectRatio = rect.width / rect.height;
         }
         return rect;
      }
      
      public function get _8583() : Boolean
      {
         return this._8581;
      }
      
      public function set _8583(param1:Boolean) : void
      {
         if(this._8581 == param1)
         {
            return;
         }
         this._8581 = param1;
         invalidateDisplayList();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:_1110 = null;
         var _loc9_:Graphics = null;
         var _loc10_:Number = NaN;
         var _loc11_:BitmapData = null;
         var _loc12_:Rectangle = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:_1129 = null;
         super._5823(param1,param2);
         this._8589 = null;
         if(this.ns_egret::_8603)
         {
            _loc3_ = 0;
            _loc4_ = 0;
            if(this._5415 && this._8581 && (this.ns_egret::_8603 is DisplayObject || this._8602 == _1109.SCALE && !this._8600))
            {
               if(isNaN(this.ns_egret::aspectRatio))
               {
                  this._8590();
               }
               if(this.ns_egret::aspectRatio > 0 && param2 > 0 && param1 > 0)
               {
                  _loc5_ = param1 / param2;
                  if(_loc5_ > this.ns_egret::aspectRatio)
                  {
                     _loc6_ = param2 * this.ns_egret::aspectRatio;
                     _loc3_ = Math.round((param1 - _loc6_) * 0.5);
                     param1 = _loc6_;
                  }
                  else
                  {
                     _loc7_ = param1 / this.ns_egret::aspectRatio;
                     _loc4_ = Math.round((param2 - _loc7_) * 0.5);
                     param2 = _loc7_;
                  }
                  if(this.ns_egret::_8603 is _1122)
                  {
                     if((this.ns_egret::_8603 as _1122).includeInLayout)
                     {
                        (this.ns_egret::_8603 as _1122)._7777(_loc3_,_loc4_);
                     }
                  }
                  else if(this.ns_egret::_8603 is DisplayObject)
                  {
                     this.ns_egret::_8603.x = _loc3_;
                     this.ns_egret::_8603.y = _loc4_;
                  }
               }
            }
            if(this.ns_egret::_8603 is DisplayObject)
            {
               if(this._5415)
               {
                  this.ns_egret::_8603.width = param1;
                  this.ns_egret::_8603.height = param2;
               }
            }
            else if(this.ns_egret::_8603 is BitmapData || this.ns_egret::_8603 is _1110 || this.ns_egret::_8603 is _1129)
            {
               _loc8_ = this.ns_egret::_8603 as _1110;
               if((_loc8_) && !_loc8_.bitmapData && !_loc8_._8585)
               {
                  return;
               }
               _loc9_ = graphics;
               _loc9_.clear();
               _loc10_ = 1;
               if(_loc8_)
               {
                  if(this._8580 == 1)
                  {
                     _loc11_ = _loc8_.bitmapData || _loc8_._8585;
                  }
                  else
                  {
                     _loc11_ = _loc8_._8585 || _loc8_.bitmapData;
                  }
                  if(!_loc11_)
                  {
                     return;
                  }
                  this._8589 = _loc11_;
                  if(_loc11_ == _loc8_._8585)
                  {
                     _loc10_ = 1 / 2;
                  }
               }
               if(this._5415 && this._8604 == _1109.REPEAT)
               {
                  this._8588(param1,param2,!!_loc8_ ? _loc11_ : this.ns_egret::_8603,_loc10_);
               }
               else
               {
                  _loc12_ = this._8600;
                  if(!_loc12_ && this.ns_egret::_8603 is _1129)
                  {
                     _loc12_ = _1129(this.ns_egret::_8603).scale9Grid;
                  }
                  if(this._5415 && Boolean(_loc12_))
                  {
                     _1290._8582(_loc9_,this._8587,_loc12_,!!_loc8_ ? _loc11_ : this.ns_egret::_8603,param1,param2,false,_loc10_);
                  }
                  else
                  {
                     _loc17_ = 0;
                     _loc18_ = 0;
                     _loc19_ = 0;
                     _loc20_ = 0;
                     _loc21_ = this.ns_egret::_8603 as _1129;
                     if(_loc21_)
                     {
                        if(!this._5415)
                        {
                           param1 = _loc21_._8596;
                           param2 = _loc21_._8595;
                        }
                        _loc11_ = _loc21_.bitmapData;
                        _loc13_ = param1 / _loc21_._8596;
                        _loc14_ = param2 / _loc21_._8595;
                        _loc15_ = _loc21_.bitmapWidth * _loc13_;
                        _loc16_ = _loc21_.bitmapHeight * _loc14_;
                        _loc17_ = _loc21_.offsetX * _loc13_;
                        _loc18_ = _loc21_.offsetY * _loc14_;
                        _loc19_ = _loc21_._8606;
                        _loc20_ = _loc21_._8605;
                     }
                     else
                     {
                        if(!_loc8_)
                        {
                           _loc11_ = this.ns_egret::_8603 as BitmapData;
                        }
                        if(!this._5415)
                        {
                           param1 = _loc11_.width * _loc10_;
                           param2 = _loc11_.height * _loc10_;
                        }
                        _loc13_ = param1 / _loc11_.width;
                        _loc14_ = param2 / _loc11_.height;
                        _loc15_ = param1;
                        _loc16_ = param2;
                     }
                     matrix.identity();
                     matrix.translate(-_loc19_,-_loc20_);
                     matrix.scale(_loc13_,_loc14_);
                     matrix.translate(_loc3_ + _loc17_,_loc4_ + _loc18_);
                     _loc9_.beginBitmapFill(_loc11_,matrix,false,false);
                     _loc9_.drawRect(_loc3_ + _loc17_,_loc4_ + _loc18_,_loc15_,_loc16_);
                     _loc9_.endFill();
                  }
               }
            }
            else if(this.ns_egret::_8603 is _1122)
            {
               if(this._5415 && (this.ns_egret::_8603 as _1122).includeInLayout)
               {
                  (this.ns_egret::_8603 as _1122)._7599(param1,param2);
               }
            }
         }
      }
      
      private function _8588(param1:Number, param2:Number, param3:Object, param4:Number = 1) : void
      {
         var _loc6_:_1129 = null;
         var _loc7_:BitmapData = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc5_:Graphics = graphics;
         if(param3 is BitmapData)
         {
            if(param4 != 1)
            {
               matrix.identity();
               matrix.scale(param4,param4);
               _loc5_.beginBitmapFill(param3 as BitmapData,matrix,true);
            }
            else
            {
               _loc5_.beginBitmapFill(param3 as BitmapData,null,true);
            }
            _loc5_.drawRect(0,0,param1,param2);
            _loc5_.endFill();
         }
         else if(param3 is _1129)
         {
            _loc6_ = param3 as _1129;
            _loc7_ = _loc6_.bitmapData;
            _loc8_ = _loc6_.offsetX;
            _loc9_ = _loc6_.offsetY;
            _loc10_ = _loc6_._8596;
            _loc11_ = _loc6_._8595;
            _loc12_ = _loc6_.bitmapWidth;
            _loc13_ = _loc6_.bitmapHeight;
            _loc14_ = _loc8_;
            while(_loc14_ < param1)
            {
               _loc15_ = _loc9_;
               while(_loc15_ < param2)
               {
                  _loc16_ = Math.min(_loc12_,param1 - _loc14_);
                  _loc17_ = Math.min(_loc13_,param2 - _loc15_);
                  matrix.identity();
                  matrix.translate(_loc14_ - _loc6_._8606,_loc15_ - _loc6_._8605);
                  _loc5_.beginBitmapFill(_loc7_,matrix,false,false);
                  _loc5_.drawRect(_loc14_,_loc15_,_loc16_,_loc17_);
                  _loc5_.endFill();
                  _loc15_ += _loc11_;
               }
               _loc14_ += _loc10_;
            }
         }
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         throw new Error("addChild()" + errorStr + "addElement()代替");
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         throw new Error("addChildAt()" + errorStr + "addElementAt()代替");
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         throw new Error("removeChild()" + errorStr + "removeElement()代替");
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         throw new Error("removeChildAt()" + errorStr + "removeElementAt()代替");
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         throw new Error("setChildIndex()" + errorStr + "setElementIndex()代替");
      }
      
      override public function swapChildren(param1:DisplayObject, param2:DisplayObject) : void
      {
         throw new Error("swapChildren()" + errorStr + "swapElements()代替");
      }
      
      override public function swapChildrenAt(param1:int, param2:int) : void
      {
         throw new Error("swapChildrenAt()" + errorStr + "swapElementsAt()代替");
      }
   }
}

