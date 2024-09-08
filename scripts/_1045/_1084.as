package _1045
{
   import _1088._1098;
   import _1146._1153;
   import _1146._1171;
   import _1177.EffectEvent;
   import _1177.ElementExistenceEvent;
   import _1177.StateChangeEvent;
   import _1280._1281;
   import _1280._1286;
   import _1280._1287;
   import egret.core._1116;
   import egret.core._1124;
   import egret.core._1127;
   import egret.core._1133;
   import egret.core._1134;
   import egret.core._1141;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.events.EventDispatcher;
   
   use namespace ns_egret;
   
   public class _1084 extends EventDispatcher implements _1127, _1124, _1116
   {
      public static const DEFAULT_MAX_WIDTH:Number = 10000;
      
      public static const DEFAULT_MAX_HEIGHT:Number = 10000;
      
      private var _5955:Number = 0;
      
      private var _2348:Number = 10000;
      
      private var _5954:Number = 0;
      
      private var _2343:Number = 10000;
      
      ns_egret var idMap:Object;
      
      public var _8323:Boolean = false;
      
      public var _width:Number = NaN;
      
      public var _8321:Boolean = false;
      
      public var _height:Number = NaN;
      
      public var measuredWidth:Number = 0;
      
      public var measuredHeight:Number = 0;
      
      private var initialized:Boolean = false;
      
      private var _8319:_1085;
      
      private var _7410:Array;
      
      private var addToDisplayListAt:QName;
      
      private var removeFromDisplayList:QName;
      
      private var _8329:_1098;
      
      private var _8335:Array;
      
      private var _8302:_1287;
      
      private var _8322:Array;
      
      private var _8301:Boolean;
      
      private var _8299:Boolean = true;
      
      private var _8300:String;
      
      private var _8307:String;
      
      private var _6203:String;
      
      private var _8297:String;
      
      private var _8317:Boolean = false;
      
      ns_egret var _8309:Number;
      
      ns_egret var _8304:Number;
      
      ns_egret var _8312:Number;
      
      ns_egret var _8305:Number;
      
      private var _8308:Number = 0;
      
      private var _8303:Number = 0;
      
      public function _1084()
      {
         this._7410 = [];
         this.addToDisplayListAt = new QName(ns_egret,"addToDisplayListAt");
         this.removeFromDisplayList = new QName(ns_egret,"removeFromDisplayList");
         this._8335 = [];
         super();
         this._8329 = new _1098();
         this._8329.target = this;
      }
      
      public function get minWidth() : Number
      {
         if(_1141._8325(this))
         {
            return this._5955;
         }
         if(!isNaN(this._8314))
         {
            return this._8314;
         }
         return this._7983;
      }
      
      public function set minWidth(param1:Number) : void
      {
         if(_1141._8325(this))
         {
            this._5955 = param1;
         }
         else
         {
            if(this._8314 == param1)
            {
               return;
            }
            this._8314 = param1;
         }
      }
      
      public function get maxWidth() : Number
      {
         if(_1141._8325(this))
         {
            return this._2348;
         }
         return !isNaN(this._6706) ? this._6706 : DEFAULT_MAX_WIDTH;
      }
      
      public function set maxWidth(param1:Number) : void
      {
         if(_1141._8325(this))
         {
            this._2348 = param1;
         }
         else
         {
            if(this._6706 == param1)
            {
               return;
            }
            this._6706 = param1;
         }
      }
      
      public function get minHeight() : Number
      {
         if(_1141._8325(this))
         {
            return this._5954;
         }
         if(!isNaN(this._8311))
         {
            return this._8311;
         }
         return this._7980;
      }
      
      public function set minHeight(param1:Number) : void
      {
         if(_1141._8325(this))
         {
            this._5954 = param1;
         }
         else
         {
            if(this._8311 == param1)
            {
               return;
            }
            this._8311 = param1;
         }
      }
      
      public function get maxHeight() : Number
      {
         if(_1141._8325(this))
         {
            return this._2343;
         }
         return !isNaN(this._6704) ? this._6704 : DEFAULT_MAX_HEIGHT;
      }
      
      public function set maxHeight(param1:Number) : void
      {
         if(_1141._8325(this))
         {
            this._2343 = param1;
         }
         else
         {
            if(this._6704 == param1)
            {
               return;
            }
            this._6704 = param1;
         }
      }
      
      public function get width() : Number
      {
         return this._width;
      }
      
      public function set width(param1:Number) : void
      {
         if(this._width == param1)
         {
            return;
         }
         this._width = param1;
         this._8323 = !isNaN(param1);
      }
      
      public function get height() : Number
      {
         return this._height;
      }
      
      public function set height(param1:Number) : void
      {
         if(this._height == param1)
         {
            return;
         }
         this._height = param1;
         this._8321 = !isNaN(param1);
      }
      
      public function get preferredWidth() : Number
      {
         return this._8323 ? this._width : this.measuredWidth;
      }
      
      public function get preferredHeight() : Number
      {
         return this._8321 ? this._height : this.measuredHeight;
      }
      
      protected function _2438() : void
      {
      }
      
      public function get _6081() : _1085
      {
         return this._8319;
      }
      
      public function set _6081(param1:_1085) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this._8319 == param1)
         {
            return;
         }
         if(this._8319)
         {
            _loc2_ = int(this._7410.length - 1);
            while(_loc2_ >= 0)
            {
               this.ns_egret::elementRemoved(this._7410[_loc2_],_loc2_);
               _loc2_--;
            }
         }
         this._8319 = param1;
         if(!this.initialized)
         {
            this.initialized = true;
            this._2438();
         }
         if(this._8319)
         {
            _loc3_ = int(this._7410.length);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.ns_egret::elementAdded(this._7410[_loc2_],_loc2_);
               _loc2_++;
            }
            this._8316();
            if(this._8301)
            {
               this._2519();
            }
         }
      }
      
      ns_egret function _7409() : Array
      {
         return this._7410;
      }
      
      public function set elementsContent(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_1133 = null;
         if(param1 == null)
         {
            param1 = [];
         }
         if(param1 == this._7410)
         {
            return;
         }
         if(this._8319)
         {
            _loc2_ = int(this._7410.length - 1);
            while(_loc2_ >= 0)
            {
               this.ns_egret::elementRemoved(this._7410[_loc2_],_loc2_);
               _loc2_--;
            }
            this._7410 = param1.concat();
            _loc3_ = int(this._7410.length);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               _loc4_ = this._7410[_loc2_];
               if(_loc4_.parent is _1134)
               {
                  _1134(_loc4_.parent).removeElement(_loc4_);
               }
               else if(_loc4_.owner is _1116)
               {
                  _1116(_loc4_.owner).removeElement(_loc4_);
               }
               this.ns_egret::elementAdded(_loc4_,_loc2_);
               _loc2_++;
            }
         }
         else
         {
            this._7410 = param1.concat();
         }
      }
      
      public function get _2249() : int
      {
         return this._7410.length;
      }
      
      public function getElementAt(param1:int) : _1133
      {
         this._7407(param1);
         return this._7410[param1];
      }
      
      private function _7407(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:int = int(this._7410.length - 1);
         if(param2)
         {
            _loc3_++;
         }
         if(param1 < 0 || param1 > _loc3_)
         {
            throw new RangeError("索引:\"" + param1 + "\"超出可视元素索引范围");
         }
      }
      
      public function addElement(param1:_1133) : _1133
      {
         var _loc2_:int = this._2249;
         if(param1.owner == this)
         {
            _loc2_ = this._2249 - 1;
         }
         return this.addElementAt(param1,_loc2_);
      }
      
      public function addElementAt(param1:_1133, param2:int) : _1133
      {
         this._7407(param2,true);
         var _loc3_:Object = param1.owner;
         if(_loc3_ == this)
         {
            this.setElementIndex(param1,param2);
            return param1;
         }
         if(_loc3_ is _1116)
         {
            _1116(_loc3_).removeElement(param1);
         }
         this._7410.splice(param2,0,param1);
         if(this._8319)
         {
            this.ns_egret::elementAdded(param1,param2);
         }
         else
         {
            param1._6967(this);
         }
         return param1;
      }
      
      public function removeElement(param1:_1133) : _1133
      {
         return this.removeElementAt(this.getElementIndex(param1));
      }
      
      public function removeElementAt(param1:int) : _1133
      {
         this._7407(param1);
         var _loc2_:_1133 = this._7410[param1];
         if(this._8319)
         {
            this.ns_egret::elementRemoved(_loc2_,param1);
         }
         else
         {
            _loc2_._6967(null);
         }
         this._7410.splice(param1,1);
         return _loc2_;
      }
      
      public function getElementIndex(param1:_1133) : int
      {
         return this._7410.indexOf(param1);
      }
      
      public function setElementIndex(param1:_1133, param2:int) : void
      {
         this._7407(param2);
         var _loc3_:int = this.getElementIndex(param1);
         if(_loc3_ == -1 || _loc3_ == param2)
         {
            return;
         }
         if(this._8319)
         {
            this.ns_egret::elementRemoved(param1,_loc3_,false);
         }
         this._7410.splice(_loc3_,1);
         this._7410.splice(param2,0,param1);
         if(this._8319)
         {
            this.ns_egret::elementAdded(param1,param2,false);
         }
      }
      
      ns_egret function elementAdded(param1:_1133, param2:int, param3:Boolean = true) : void
      {
         param1._6967(this);
         if(param1 is DisplayObject)
         {
            this._8319[this.addToDisplayListAt](DisplayObject(param1),param2);
         }
         if(param3)
         {
            if(hasEventListener(ElementExistenceEvent.ELEMENT_ADD))
            {
               dispatchEvent(new ElementExistenceEvent(ElementExistenceEvent.ELEMENT_ADD,false,false,param1,param2));
            }
         }
         this._8319.invalidateSize();
         this._8319.invalidateDisplayList();
      }
      
      ns_egret function elementRemoved(param1:_1133, param2:int, param3:Boolean = true) : void
      {
         if(param3)
         {
            if(hasEventListener(ElementExistenceEvent.ELEMENT_REMOVE))
            {
               dispatchEvent(new ElementExistenceEvent(ElementExistenceEvent.ELEMENT_REMOVE,false,false,param1,param2));
            }
         }
         var _loc4_:DisplayObject = param1 as DisplayObject;
         if((Boolean(_loc4_)) && _loc4_.parent == this._8319)
         {
            this._8319[this.removeFromDisplayList](param1);
         }
         param1._6967(null);
         this._8319.invalidateSize();
         this._8319.invalidateDisplayList();
      }
      
      public function _7028() : void
      {
         this._8329._7028();
         if(this.measuredWidth < this.minWidth)
         {
            this.measuredWidth = this.minWidth;
         }
         if(this.measuredWidth > this.maxWidth)
         {
            this.measuredWidth = this.maxWidth;
         }
         if(this.measuredHeight < this.minHeight)
         {
            this.measuredHeight = this.minHeight;
         }
         if(this.measuredHeight > this.maxHeight)
         {
            this.measuredHeight = this.maxHeight;
         }
      }
      
      public function _5823(param1:Number, param2:Number) : void
      {
         this._8329._5823(param1,param2);
      }
      
      public function get states() : Array
      {
         return this._8335;
      }
      
      public function set states(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_1286 = null;
         if(!param1)
         {
            param1 = [];
         }
         if(param1[0] is String)
         {
            _loc2_ = int(param1.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               (_loc4_ = new _1286()).name = param1[_loc3_];
               param1[_loc3_] = _loc4_;
               _loc3_++;
            }
         }
         this._8335 = param1;
         this._8301 = true;
         this._8297 = this._6203;
         if(!this._8334(this._8297))
         {
            this._8297 = this._8318();
         }
      }
      
      public function get _6441() : Array
      {
         return this._8322;
      }
      
      public function set _6441(param1:Array) : void
      {
         this._8322 = param1;
      }
      
      public function get _2080() : String
      {
         if(this._8301)
         {
            return this._8297;
         }
         return !!this._6203 ? this._6203 : this._8318();
      }
      
      public function set _2080(param1:String) : void
      {
         if(!param1)
         {
            param1 = this._8318();
         }
         if(param1 != this._2080 && param1 && Boolean(this._2080))
         {
            this._8297 = param1;
            this._8301 = true;
            if(this._8319)
            {
               this._2519();
            }
         }
      }
      
      public function _8334(param1:String) : Boolean
      {
         return this._8333(param1) != null;
      }
      
      private function _8318() : String
      {
         if(Boolean(this._8335) && this._8335.length > 0)
         {
            return this._8335[0].name;
         }
         return null;
      }
      
      protected function _2519() : void
      {
         var _loc2_:_1287 = null;
         var _loc3_:Number = NaN;
         var _loc4_:_1171 = null;
         var _loc5_:StateChangeEvent = null;
         var _loc7_:Boolean = false;
         if(!this._8301)
         {
            return;
         }
         this._8301 = false;
         var _loc1_:_1286 = this._8333(this._8297);
         if(!_loc1_)
         {
            this._8297 = this._8318();
         }
         if(this._8299)
         {
            _loc2_ = this._8320(this._6203,this._8297);
         }
         if(this._8302)
         {
            this._8302.effect.removeEventListener(EffectEvent.EFFECT_END,this._8296);
            if(Boolean(_loc2_) && this._8302._8298 == _1281.STOP)
            {
               _loc4_ = this._8302.effect;
               _loc4_.stop();
            }
            else
            {
               if(this._8302._8327 && this._8300 == this._8297 && this._8307 == this._6203)
               {
                  if(this._8302.effect.duration == 0)
                  {
                     _loc3_ = 0;
                  }
                  else
                  {
                     _loc3_ = this._8302.effect._8324 / this._8315(this._8302.effect);
                  }
               }
               this._8302.effect.end();
            }
            this._8302 = null;
         }
         var _loc6_:String = !!this._6203 ? this._6203 : "";
         if(hasEventListener(StateChangeEvent.CURRENT_STATE_CHANGING))
         {
            (_loc5_ = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGING))._8331 = _loc6_;
            _loc5_._8332 = !!this._8297 ? this._8297 : "";
            dispatchEvent(_loc5_);
         }
         this._8326(this._6203);
         this._6203 = this._8297;
         if(this._6203)
         {
            this._8328(this._6203);
         }
         if(hasEventListener(StateChangeEvent.CURRENT_STATE_CHANGE))
         {
            (_loc5_ = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGE))._8331 = _loc6_;
            _loc5_._8332 = !!this._6203 ? this._6203 : "";
            dispatchEvent(_loc5_);
         }
         if(_loc2_)
         {
            _loc7_ = Boolean(_loc2_) && _loc2_._8327 && (_loc2_._8336 == _loc6_ || _loc2_._8330 == this._6203);
            _1141.ns_egret::_1609._2449();
            this._8302 = _loc2_;
            this._8300 = _loc6_;
            this._8307 = this._6203;
            _loc2_.effect.addEventListener(EffectEvent.EFFECT_END,this._8296);
            _loc2_.effect.play(null,_loc7_);
            if(!isNaN(_loc3_) && _loc2_.effect.duration != 0)
            {
               _loc2_.effect._8324 = (1 - _loc3_) * this._8315(_loc2_.effect);
            }
         }
         else if(hasEventListener(StateChangeEvent.STATE_CHANGE_COMPLETE))
         {
            dispatchEvent(new StateChangeEvent(StateChangeEvent.STATE_CHANGE_COMPLETE,false,false,_loc6_,this._6203));
         }
      }
      
      private function _8296(param1:EffectEvent) : void
      {
         this._8302 = null;
         if(hasEventListener(StateChangeEvent.STATE_CHANGE_COMPLETE))
         {
            dispatchEvent(new StateChangeEvent(StateChangeEvent.STATE_CHANGE_COMPLETE,false,false,this._8300,this._8307));
         }
      }
      
      private function _8333(param1:String) : _1286
      {
         var _loc4_:_1286 = null;
         if(!param1)
         {
            return null;
         }
         var _loc2_:int = int(this._8335.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this._8335[_loc3_];
            if(_loc4_.name == param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private function _8326(param1:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc2_:_1286 = this._8333(param1);
         if(_loc2_)
         {
            _loc2_.ns_egret::_8313();
            _loc3_ = _loc2_.overrides;
            _loc4_ = int(_loc3_.length - 1);
            while(_loc4_ >= 0)
            {
               _loc3_[_loc4_].remove(this);
               _loc4_--;
            }
         }
      }
      
      private function _8328(param1:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:_1286 = this._8333(param1);
         if(_loc2_)
         {
            _loc3_ = _loc2_.overrides;
            _loc4_ = int(_loc3_.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_[_loc5_].apply(this);
               _loc5_++;
            }
            _loc2_.ns_egret::_8306();
         }
      }
      
      private function _8316() : void
      {
         var _loc2_:_1286 = null;
         if(this._8317)
         {
            return;
         }
         this._8317 = true;
         var _loc1_:int = 0;
         while(_loc1_ < this._8335.length)
         {
            _loc2_ = this._8335[_loc1_] as _1286;
            _loc2_.ns_egret::initialize(this);
            _loc1_++;
         }
      }
      
      private function _8320(param1:String, param2:String) : _1287
      {
         var _loc6_:_1287 = null;
         var _loc3_:_1287 = null;
         var _loc4_:int = 0;
         if(!this._6441)
         {
            return null;
         }
         if(!param1)
         {
            param1 = "";
         }
         if(!param2)
         {
            param2 = "";
         }
         var _loc5_:int = 0;
         while(_loc5_ < this._6441.length)
         {
            _loc6_ = this._6441[_loc5_];
            if(_loc6_._8330 == "*" && _loc6_._8336 == "*" && _loc4_ < 1)
            {
               _loc3_ = _loc6_;
               _loc4_ = 1;
            }
            else if(_loc6_._8336 == param1 && _loc6_._8330 == "*" && _loc6_._8327 && _loc4_ < 2)
            {
               _loc3_ = _loc6_;
               _loc4_ = 2;
            }
            else if(_loc6_._8336 == "*" && _loc6_._8330 == param2 && _loc6_._8327 && _loc4_ < 3)
            {
               _loc3_ = _loc6_;
               _loc4_ = 3;
            }
            else if(_loc6_._8336 == param1 && _loc6_._8330 == param2 && _loc6_._8327 && _loc4_ < 4)
            {
               _loc3_ = _loc6_;
               _loc4_ = 4;
            }
            else if(_loc6_._8330 == param1 && _loc6_._8336 == "*" && _loc4_ < 5)
            {
               _loc3_ = _loc6_;
               _loc4_ = 5;
            }
            else if(_loc6_._8330 == "*" && _loc6_._8336 == param2 && _loc4_ < 6)
            {
               _loc3_ = _loc6_;
               _loc4_ = 6;
            }
            else if(_loc6_._8330 == param1 && _loc6_._8336 == param2 && _loc4_ < 7)
            {
               _loc3_ = _loc6_;
               _loc4_ = 7;
               break;
            }
            _loc5_++;
         }
         if(Boolean(_loc3_) && !_loc3_.effect)
         {
            _loc3_ = null;
         }
         return _loc3_;
      }
      
      private function _8315(param1:_1171) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:Object = Object(param1);
         if(param1 is _1153)
         {
            _loc2_ = Number(_loc3_._8310);
         }
         else
         {
            _loc2_ = param1.duration;
         }
         var _loc4_:int = "repeatDelay" in param1 ? int(_loc3_.repeatDelay) : 0;
         var _loc5_:int = "repeatCount" in param1 ? int(_loc3_.repeatCount) : 0;
         var _loc6_:int = "startDelay" in param1 ? int(_loc3_.startDelay) : 0;
         return _loc2_ * _loc5_ + _loc4_ * (_loc5_ - 1) + _loc6_;
      }
      
      public function get _8314() : Number
      {
         return this.ns_egret::_8309;
      }
      
      public function set _8314(param1:Number) : void
      {
         if(this.ns_egret::_8309 == param1)
         {
            return;
         }
         this.ns_egret::_8309 = param1;
      }
      
      public function get _8311() : Number
      {
         return this.ns_egret::_8304;
      }
      
      public function set _8311(param1:Number) : void
      {
         if(this.ns_egret::_8304 == param1)
         {
            return;
         }
         this.ns_egret::_8304 = param1;
      }
      
      public function get _6706() : Number
      {
         return this.ns_egret::_8312;
      }
      
      public function set _6706(param1:Number) : void
      {
         if(this.ns_egret::_8312 == param1)
         {
            return;
         }
         this.ns_egret::_8312 = param1;
      }
      
      public function get _6704() : Number
      {
         return this.ns_egret::_8305;
      }
      
      public function set _6704(param1:Number) : void
      {
         if(this.ns_egret::_8305 == param1)
         {
            return;
         }
         this.ns_egret::_8305 = param1;
      }
      
      public function get _7983() : Number
      {
         return this._8308;
      }
      
      public function set _7983(param1:Number) : void
      {
         this._8308 = param1;
      }
      
      public function get _7980() : Number
      {
         return this._8303;
      }
      
      public function set _7980(param1:Number) : void
      {
         this._8303 = param1;
      }
   }
}

