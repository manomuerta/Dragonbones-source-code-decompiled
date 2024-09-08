package egret.core
{
   import _1177.MoveEvent;
   import _1177.ResizeEvent;
   import _1177.UIEvent;
   import _1177._1181;
   import egret.managers._1205;
   import egret.managers._1211;
   import egret.managers._1213;
   import egret.managers._1221;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class _1140 extends Sprite implements _1130, _1205, _1122, _1121, _1133, _1213, _1128
   {
      public static const DEFAULT_MAX_WIDTH:Number = 10000;
      
      public static const DEFAULT_MAX_HEIGHT:Number = 10000;
      
      ns_egret var idMap:Object;
      
      private var _id:String;
      
      private var _8700:Object;
      
      private var _8688:Class;
      
      private var _8683:Point;
      
      private var _8675:String = "mouse";
      
      private var _8701:Boolean;
      
      private var _owner:Object;
      
      private var _5434:_1211;
      
      private var _8664:Boolean = false;
      
      private var _4656:Boolean = false;
      
      private var _8674:Boolean = false;
      
      private var _8697:int = 0;
      
      ns_egret var _8672:Boolean = false;
      
      ns_egret var _8673:* = null;
      
      ns_egret var _8529:Boolean = false;
      
      private var _5142:Boolean = true;
      
      ns_egret var _3123:Number;
      
      private var _8684:Number = NaN;
      
      ns_egret var _width:Number;
      
      ns_egret var _3121:Number;
      
      private var _8682:Number = NaN;
      
      ns_egret var _height:Number;
      
      private var _5955:Number = 0;
      
      private var _2348:Number = 10000;
      
      private var _5954:Number = 0;
      
      private var _2343:Number = 10000;
      
      private var _8308:Number = 0;
      
      private var _8303:Number = 0;
      
      private var _8685:Number = 0;
      
      private var _8681:Number = 0;
      
      ns_egret var _3147:Number;
      
      ns_egret var _3146:Number;
      
      ns_egret var _7680:Boolean = false;
      
      ns_egret var _7701:Boolean = false;
      
      ns_egret var _8072:Number;
      
      ns_egret var _8070:Number;
      
      ns_egret var _7674:Boolean = false;
      
      ns_egret var _8678:Boolean = false;
      
      ns_egret var _8493:Boolean = true;
      
      private var _8705:Number;
      
      private var _8704:Number;
      
      private var _8706:Number;
      
      private var _8703:Number;
      
      private var _8671:Number;
      
      private var _8680:Number;
      
      private var _8689:Number;
      
      private var _8686:Number;
      
      ns_egret var _8228:Boolean = false;
      
      ns_egret var _8227:Boolean = false;
      
      private var _8687:Boolean = false;
      
      ns_egret var _8309:Number;
      
      ns_egret var _8304:Number;
      
      ns_egret var _8312:Number;
      
      ns_egret var _8305:Number;
      
      public function _1140()
      {
         super();
         focusRect = false;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.ADDED_TO_STAGE,this._8668);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.ns_egret::initialize();
         _1141.ns_egret::_8702(stage);
         if(this._8697 > 0)
         {
            this._8668();
         }
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get toolTip() : Object
      {
         return this._8700;
      }
      
      public function set toolTip(param1:Object) : void
      {
         if(param1 == this._8700)
         {
            return;
         }
         var _loc2_:Object = this._8700;
         this._8700 = param1;
         _1221.ns_egret::_8677(this,_loc2_,param1);
         dispatchEvent(new Event("toolTipChanged"));
      }
      
      public function get _8693() : Class
      {
         return this._8688;
      }
      
      public function set _8693(param1:Class) : void
      {
         if(param1 == this._8688)
         {
            return;
         }
         this._8688 = param1;
      }
      
      public function get _8690() : Point
      {
         return this._8683;
      }
      
      public function set _8690(param1:Point) : void
      {
         this._8683 = param1;
      }
      
      public function get _8679() : String
      {
         return this._8675;
      }
      
      public function set _8679(param1:String) : void
      {
         this._8675 = param1;
      }
      
      public function get _8574() : Boolean
      {
         return this._8701;
      }
      
      public function set _8574(param1:Boolean) : void
      {
         this._8701 = param1;
      }
      
      public function get owner() : Object
      {
         return !!this._owner ? this._owner : parent;
      }
      
      public function _6967(param1:Object) : void
      {
         this._owner = param1;
      }
      
      public function get _1558() : _1211
      {
         var _loc1_:DisplayObjectContainer = null;
         var _loc2_:_1130 = null;
         if(!this._5434)
         {
            if(this is _1211)
            {
               this._5434 = _1211(this);
            }
            else
            {
               _loc1_ = parent;
               while(_loc1_)
               {
                  _loc2_ = _loc1_ as _1130;
                  if(_loc2_)
                  {
                     this._5434 = _loc2_._1558;
                     break;
                  }
                  if(_loc1_ is _1211)
                  {
                     this._5434 = _loc1_ as _1211;
                     break;
                  }
                  _loc1_ = _loc1_.parent;
               }
            }
         }
         return this._5434;
      }
      
      public function set _1558(param1:_1211) : void
      {
         var _loc4_:_1130 = null;
         this._5434 = param1;
         var _loc2_:int = numChildren;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = getChildAt(_loc3_) as _1130;
            if(_loc4_)
            {
               _loc4_._1558 = param1;
            }
            _loc3_++;
         }
      }
      
      public function get _8665() : Boolean
      {
         return this._8664;
      }
      
      public function set _8665(param1:Boolean) : void
      {
         this._8664 = param1;
      }
      
      public function get initialized() : Boolean
      {
         return this._4656;
      }
      
      public function set initialized(param1:Boolean) : void
      {
         if(this._4656 == param1)
         {
            return;
         }
         this._4656 = param1;
         if(param1)
         {
            this._2501();
            dispatchEvent(new UIEvent(UIEvent.CREATION_COMPLETE));
         }
      }
      
      ns_egret function initialize() : void
      {
         if(this._8674)
         {
            return;
         }
         this._8674 = true;
         dispatchEvent(new UIEvent(UIEvent.INITIALIZE));
         this._2438();
         this._2466();
         this.invalidateSize();
         this.invalidateDisplayList();
      }
      
      protected function _2438() : void
      {
      }
      
      protected function _2501() : void
      {
      }
      
      public function get _7569() : int
      {
         return this._8697;
      }
      
      public function set _7569(param1:int) : void
      {
         var _loc3_:_1205 = null;
         if(this._8697 == param1)
         {
            return;
         }
         this._8697 = param1;
         if(this._8697 == 0)
         {
            addEventListener(Event.ADDED_TO_STAGE,this._8668);
         }
         else
         {
            removeEventListener(Event.ADDED_TO_STAGE,this._8668);
         }
         var _loc2_:int = numChildren - 1;
         while(_loc2_ >= 0)
         {
            _loc3_ = getChildAt(_loc2_) as _1205;
            if(_loc3_ != null)
            {
               _loc3_._7569 = this._8697 + 1;
            }
            _loc2_--;
         }
      }
      
      public function get _7646() : Object
      {
         return this.ns_egret::_8673;
      }
      
      public function getStyle(param1:String) : *
      {
         var _loc2_:* = this.ns_egret::_8673;
         if(!_loc2_)
         {
            return undefined;
         }
         return _loc2_[param1];
      }
      
      public function setStyle(param1:String, param2:*) : void
      {
         var _loc3_:* = this.ns_egret::_8673;
         if(!this.ns_egret::_8672)
         {
            _loc3_ = this._8666(_loc3_);
         }
         _loc3_[param1] = param2;
         this._7655(param1);
         this._8657(param1);
      }
      
      public function _7655(param1:String) : void
      {
      }
      
      public function _8657(param1:String) : void
      {
         var _loc3_:_1128 = null;
         if(this.ns_egret::_8529)
         {
            return;
         }
         var _loc2_:int = this.numChildren - 1;
         while(_loc2_ >= 0)
         {
            _loc3_ = this.getChildAt(_loc2_) as _1128;
            if(_loc3_)
            {
               _loc3_._7655(param1);
               _loc3_._8657(param1);
            }
            _loc2_--;
         }
      }
      
      private function _8666(param1:Object) : Object
      {
         var _loc2_:int = 0;
         var _loc3_:_1128 = null;
         this.ns_egret::_8672 = true;
         this.ns_egret::_8673 = this._8676(param1);
         param1 = this.ns_egret::_8673;
         if(!this.ns_egret::_8529)
         {
            _loc2_ = this.numChildren - 1;
            while(_loc2_ >= 0)
            {
               _loc3_ = this.getChildAt(_loc2_) as _1128;
               if(_loc3_)
               {
                  _loc3_._8658(param1);
               }
               _loc2_--;
            }
         }
         return param1;
      }
      
      private function _8676(param1:Object) : Object
      {
         var childChain:Object;
         var parentChain:Object = param1;
         var _2332:Function = function():void
         {
         };
         _2332.prototype = parentChain;
         childChain = new _2332();
         _2332.prototype = null;
         return childChain;
      }
      
      public function _8659(param1:String) : void
      {
         if(!this.ns_egret::_8672)
         {
            return;
         }
         var _loc2_:* = this.ns_egret::_8673;
         delete _loc2_[param1];
         this._7655(param1);
         this._8657(param1);
      }
      
      public function _8658(param1:Object) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:_1128 = null;
         if(this.ns_egret::_8672)
         {
            _loc2_ = this.ns_egret::_8673;
            _loc3_ = this._8676(param1);
            for(_loc4_ in _loc2_)
            {
               if(_loc2_.hasOwnProperty(_loc4_))
               {
                  _loc3_[_loc4_] = _loc2_[_loc4_];
               }
            }
            this.ns_egret::_8673 = _loc3_;
            param1 = _loc3_;
         }
         else
         {
            this.ns_egret::_8673 = param1;
         }
         if(!this.ns_egret::_8529)
         {
            _loc5_ = this.numChildren - 1;
            while(_loc5_ >= 0)
            {
               _loc6_ = this.getChildAt(_loc5_) as _1128;
               if(_loc6_)
               {
                  _loc6_._8658(param1);
               }
               _loc5_--;
            }
         }
      }
      
      final ns_egret function _1607(param1:DisplayObject) : DisplayObject
      {
         this.ns_egret::_8696(param1);
         super.addChild(param1);
         this.ns_egret::_8698(param1);
         return param1;
      }
      
      final ns_egret function addToDisplayListAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         this.ns_egret::_8696(param1);
         super.addChildAt(param1,param2);
         this.ns_egret::_8698(param1);
         return param1;
      }
      
      final ns_egret function removeFromDisplayList(param1:DisplayObject) : DisplayObject
      {
         super.removeChild(param1);
         this.ns_egret::_8695(param1);
         return param1;
      }
      
      final ns_egret function _1604(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = super.removeChildAt(param1);
         this.ns_egret::_8695(_loc2_);
         return _loc2_;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         this.ns_egret::_8696(param1);
         super.addChild(param1);
         this.ns_egret::_8698(param1);
         return param1;
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         this.ns_egret::_8696(param1);
         super.addChildAt(param1,param2);
         this.ns_egret::_8698(param1);
         return param1;
      }
      
      ns_egret function _8696(param1:DisplayObject) : void
      {
         var _loc3_:Object = null;
         if(param1 is _1205)
         {
            (param1 as _1205)._7569 = this._8697 + 1;
         }
         if(param1 is InteractiveObject)
         {
            if(this.doubleClickEnabled)
            {
               InteractiveObject(param1).doubleClickEnabled = true;
            }
         }
         var _loc2_:_1128 = param1 as _1128;
         if(_loc2_)
         {
            _loc3_ = this.ns_egret::_8673;
            if(Boolean(_loc3_) || Boolean(_loc2_._7646))
            {
               _loc2_._8658(_loc3_);
               _loc2_._7655(null);
               _loc2_._8657(null);
            }
         }
      }
      
      ns_egret function _8698(param1:DisplayObject) : void
      {
         if(param1 is _1140)
         {
            _1140(param1).ns_egret::initialize();
            _1140(param1)._8668();
         }
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         super.removeChild(param1);
         this.ns_egret::_8695(param1);
         return param1;
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = super.removeChildAt(param1);
         this.ns_egret::_8695(_loc2_);
         return _loc2_;
      }
      
      ns_egret function _8695(param1:DisplayObject) : void
      {
         if(param1 is _1205)
         {
            (param1 as _1205)._7569 = 0;
         }
         if(param1 is _1130)
         {
            _1130(param1)._1558 = null;
         }
      }
      
      private function _8668(param1:Event = null) : void
      {
         if(!_1141.ns_egret::_1609)
         {
            return;
         }
         if(this.ns_egret::_7680)
         {
            _1141.ns_egret::_1609._2466(this);
         }
         if(this.ns_egret::_7701)
         {
            _1141.ns_egret::_1609.invalidateSize(this);
         }
         if(this.ns_egret::_7674)
         {
            _1141.ns_egret::_1609.invalidateDisplayList(this);
         }
         if(this.ns_egret::_8678)
         {
            _1141.ns_egret::_1609._1608(this);
            this.ns_egret::_8678 = false;
         }
      }
      
      override public function get doubleClickEnabled() : Boolean
      {
         return super.doubleClickEnabled;
      }
      
      override public function set doubleClickEnabled(param1:Boolean) : void
      {
         var _loc3_:InteractiveObject = null;
         super.doubleClickEnabled = param1;
         var _loc2_:int = 0;
         while(_loc2_ < numChildren)
         {
            _loc3_ = getChildAt(_loc2_) as InteractiveObject;
            if(_loc3_)
            {
               _loc3_.doubleClickEnabled = param1;
            }
            _loc2_++;
         }
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
         dispatchEvent(new Event("enabledChanged"));
      }
      
      public function get explicitWidth() : Number
      {
         return this._8684;
      }
      
      override public function set width(param1:Number) : void
      {
         if(this.ns_egret::_width == param1 && this._8684 == param1)
         {
            return;
         }
         this.ns_egret::_width = param1;
         this._8684 = param1;
         this._2466();
         this.invalidateDisplayList();
         this._8420();
         if(isNaN(param1))
         {
            this.invalidateSize();
         }
      }
      
      override public function get width() : Number
      {
         return this._8699(this.ns_egret::_width);
      }
      
      public function get explicitHeight() : Number
      {
         return this._8682;
      }
      
      override public function set height(param1:Number) : void
      {
         if(this.ns_egret::_height == param1 && this._8682 == param1)
         {
            return;
         }
         this.ns_egret::_height = param1;
         this._8682 = param1;
         this._2466();
         this.invalidateDisplayList();
         this._8420();
         if(isNaN(param1))
         {
            this.invalidateSize();
         }
      }
      
      override public function get height() : Number
      {
         return this._8699(this.ns_egret::_height);
      }
      
      private function _8699(param1:Number) : Number
      {
         if(isNaN(param1))
         {
            return 0;
         }
         return param1;
      }
      
      override public function set scaleX(param1:Number) : void
      {
         if(super.scaleX == param1)
         {
            return;
         }
         super.scaleX = param1;
         this._8420();
      }
      
      override public function set scaleY(param1:Number) : void
      {
         if(super.scaleY == param1)
         {
            return;
         }
         super.scaleY = param1;
         this._8420();
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
            if(this._5955 == param1)
            {
               return;
            }
            this._5955 = param1;
            this.invalidateSize();
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
            if(this._2348 == param1)
            {
               return;
            }
            this._2348 = param1;
            this.invalidateSize();
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
            if(this._5954 == param1)
            {
               return;
            }
            this._5954 = param1;
            this.invalidateSize();
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
            if(this._2343 == param1)
            {
               return;
            }
            this._2343 = param1;
            this.invalidateSize();
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
      
      public function get measuredWidth() : Number
      {
         return this._8685;
      }
      
      public function set measuredWidth(param1:Number) : void
      {
         this._8685 = param1;
      }
      
      public function get measuredHeight() : Number
      {
         return this._8681;
      }
      
      public function set measuredHeight(param1:Number) : void
      {
         this._8681 = param1;
      }
      
      public function setActualSize(param1:Number, param2:Number) : void
      {
         var _loc3_:Boolean = false;
         if(this.ns_egret::_width != param1)
         {
            this.ns_egret::_width = param1;
            _loc3_ = true;
         }
         if(this.ns_egret::_height != param2)
         {
            this.ns_egret::_height = param2;
            _loc3_ = true;
         }
         if(_loc3_)
         {
            this.invalidateDisplayList();
            this._8667();
         }
      }
      
      override public function set x(param1:Number) : void
      {
         if(x == param1)
         {
            return;
         }
         super.x = param1;
         this._2466();
         if(this.ns_egret::_8493 && parent && parent is _1140)
         {
            _1140(parent).ns_egret::_8344();
         }
      }
      
      override public function set y(param1:Number) : void
      {
         if(y == param1)
         {
            return;
         }
         super.y = param1;
         this._2466();
         if(this.ns_egret::_8493 && parent && parent is _1140)
         {
            _1140(parent).ns_egret::_8344();
         }
      }
      
      public function _2466() : void
      {
         if(!this.ns_egret::_7680)
         {
            this.ns_egret::_7680 = true;
            if(Boolean(parent) && Boolean(_1141.ns_egret::_1609))
            {
               _1141.ns_egret::_1609._2466(this);
            }
         }
      }
      
      public function _6040() : void
      {
         if(this.ns_egret::_7680)
         {
            this._2476();
            this.ns_egret::_7680 = false;
         }
      }
      
      public function invalidateSize() : void
      {
         if(!this.ns_egret::_7701)
         {
            this.ns_egret::_7701 = true;
            if(Boolean(parent) && Boolean(_1141.ns_egret::_1609))
            {
               _1141.ns_egret::_1609.invalidateSize(this);
            }
         }
      }
      
      public function _8079(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         var _loc4_:Boolean = false;
         if(param1)
         {
            _loc2_ = 0;
            while(_loc2_ < numChildren)
            {
               _loc3_ = getChildAt(_loc2_);
               if(_loc3_ is _1205)
               {
                  (_loc3_ as _1205)._8079(true);
               }
               _loc2_++;
            }
         }
         if(this.ns_egret::_7701)
         {
            _loc4_ = this._8692();
            if(_loc4_)
            {
               this.invalidateDisplayList();
               this._8420();
            }
            this.ns_egret::_7701 = false;
         }
      }
      
      private function _8692() : Boolean
      {
         var _loc1_:Boolean = false;
         if(!this.ns_egret::_7701)
         {
            return _loc1_;
         }
         if(!this._8669())
         {
            this._7028();
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
         if(isNaN(this.ns_egret::_8072))
         {
            this.ns_egret::_8072 = this.preferredWidth;
            this.ns_egret::_8070 = this.preferredHeight;
            _loc1_ = true;
         }
         else
         {
            if(this.preferredWidth != this.ns_egret::_8072 || this.preferredHeight != this.ns_egret::_8070)
            {
               _loc1_ = true;
            }
            this.ns_egret::_8072 = this.preferredWidth;
            this.ns_egret::_8070 = this.preferredHeight;
         }
         return _loc1_;
      }
      
      public function invalidateDisplayList() : void
      {
         if(!this.ns_egret::_7674)
         {
            this.ns_egret::_7674 = true;
            if(Boolean(parent) && Boolean(_1141.ns_egret::_1609))
            {
               _1141.ns_egret::_1609.invalidateDisplayList(this);
            }
         }
      }
      
      public function _6929() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this.ns_egret::_7674)
         {
            _loc1_ = 0;
            _loc2_ = 0;
            if(this.ns_egret::_8228)
            {
               _loc1_ = this.ns_egret::_width;
            }
            else if(!isNaN(this.explicitWidth))
            {
               _loc1_ = this._8684;
            }
            else
            {
               _loc1_ = this.measuredWidth;
            }
            if(this.ns_egret::_8227)
            {
               _loc2_ = this.ns_egret::_height;
            }
            else if(!isNaN(this.explicitHeight))
            {
               _loc2_ = this._8682;
            }
            else
            {
               _loc2_ = this.measuredHeight;
            }
            if(isNaN(_loc1_))
            {
               _loc1_ = 0;
            }
            if(isNaN(_loc2_))
            {
               _loc2_ = 0;
            }
            this.setActualSize(_loc1_,_loc2_);
            this._5823(_loc1_,_loc2_);
            this.ns_egret::_7674 = false;
         }
      }
      
      public function _2449(param1:Boolean = false) : void
      {
         if(!this.ns_egret::_8678 && _1141.ns_egret::_1609 != null)
         {
            _1141.ns_egret::_1609._1608(this,param1);
         }
         else
         {
            this.ns_egret::_8678 = true;
         }
      }
      
      protected function _8420() : void
      {
         if(!parent || !this.ns_egret::_8493)
         {
            return;
         }
         var _loc1_:_1121 = parent as _1121;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.invalidateSize();
         _loc1_.invalidateDisplayList();
      }
      
      protected function _5823(param1:Number, param2:Number) : void
      {
      }
      
      protected function _8669() : Boolean
      {
         return !isNaN(this._8684) && !isNaN(this._8682);
      }
      
      protected function _2476() : void
      {
         if(this.ns_egret::_3123 != this.ns_egret::_width || this.ns_egret::_3121 != this.ns_egret::_height)
         {
            this._8667();
         }
         if(this.ns_egret::_3147 != x || this.ns_egret::_3146 != y)
         {
            this._8670();
         }
      }
      
      protected function _7028() : void
      {
         this._8681 = 0;
         this._8685 = 0;
      }
      
      private function _8670() : void
      {
         var _loc1_:MoveEvent = null;
         if(hasEventListener(MoveEvent.MOVE))
         {
            _loc1_ = new MoveEvent(MoveEvent.MOVE,this.ns_egret::_3147,this.ns_egret::_3146);
            dispatchEvent(_loc1_);
         }
         this.ns_egret::_3147 = x;
         this.ns_egret::_3146 = y;
      }
      
      ns_egret function _8344() : void
      {
      }
      
      private function _8667() : void
      {
         var _loc1_:ResizeEvent = null;
         if(hasEventListener(ResizeEvent.UI_RESIZE))
         {
            _loc1_ = new ResizeEvent(ResizeEvent.UI_RESIZE,this.ns_egret::_3123,this.ns_egret::_3121);
            dispatchEvent(_loc1_);
         }
         this.ns_egret::_3123 = this.ns_egret::_width;
         this.ns_egret::_3121 = this.ns_egret::_height;
      }
      
      protected function _7626(param1:String, param2:*, param3:*) : void
      {
         if(hasEventListener("propertyChange"))
         {
            dispatchEvent(_1181._7812(this,param1,param2,param3));
         }
      }
      
      public function get includeInLayout() : Boolean
      {
         return this.ns_egret::_8493;
      }
      
      public function set includeInLayout(param1:Boolean) : void
      {
         if(this.ns_egret::_8493 == param1)
         {
            return;
         }
         this.ns_egret::_8493 = true;
         this._8420();
         this.ns_egret::_8493 = param1;
      }
      
      public function get left() : Number
      {
         return this._8705;
      }
      
      public function set left(param1:Number) : void
      {
         if(this._8705 == param1)
         {
            return;
         }
         this._8705 = param1;
         this._8420();
      }
      
      public function get right() : Number
      {
         return this._8704;
      }
      
      public function set right(param1:Number) : void
      {
         if(this._8704 == param1)
         {
            return;
         }
         this._8704 = param1;
         this._8420();
      }
      
      public function get top() : Number
      {
         return this._8706;
      }
      
      public function set top(param1:Number) : void
      {
         if(this._8706 == param1)
         {
            return;
         }
         this._8706 = param1;
         this._8420();
      }
      
      public function get bottom() : Number
      {
         return this._8703;
      }
      
      public function set bottom(param1:Number) : void
      {
         if(this._8703 == param1)
         {
            return;
         }
         this._8703 = param1;
         this._8420();
      }
      
      public function get horizontalCenter() : Number
      {
         return this._8671;
      }
      
      public function set horizontalCenter(param1:Number) : void
      {
         if(this._8671 == param1)
         {
            return;
         }
         this._8671 = param1;
         this._8420();
      }
      
      public function get verticalCenter() : Number
      {
         return this._8680;
      }
      
      public function set verticalCenter(param1:Number) : void
      {
         if(this._8680 == param1)
         {
            return;
         }
         this._8680 = param1;
         this._8420();
      }
      
      public function get percentWidth() : Number
      {
         return this._8689;
      }
      
      public function set percentWidth(param1:Number) : void
      {
         if(this._8689 == param1)
         {
            return;
         }
         this._8689 = param1;
         this._8420();
      }
      
      public function get percentHeight() : Number
      {
         return this._8686;
      }
      
      public function set percentHeight(param1:Number) : void
      {
         if(this._8686 == param1)
         {
            return;
         }
         this._8686 = param1;
         this._8420();
      }
      
      public function _7599(param1:Number, param2:Number) : void
      {
         param1 /= scaleX;
         param2 /= scaleY;
         if(isNaN(param1))
         {
            this.ns_egret::_8228 = false;
            param1 = this.preferredWidth;
         }
         else
         {
            this.ns_egret::_8228 = true;
         }
         if(isNaN(param2))
         {
            this.ns_egret::_8227 = false;
            param2 = this.preferredHeight;
         }
         else
         {
            this.ns_egret::_8227 = true;
         }
         this.setActualSize(param1,param2);
      }
      
      public function _7777(param1:Number, param2:Number) : void
      {
         var _loc3_:Boolean = false;
         if(this.x != param1)
         {
            super.x = param1;
            _loc3_ = true;
         }
         if(this.y != param2)
         {
            super.y = param2;
            _loc3_ = true;
         }
         if(_loc3_)
         {
            this._8670();
         }
      }
      
      public function get preferredWidth() : Number
      {
         var _loc1_:Number = isNaN(this._8684) ? this.measuredWidth : this._8684;
         if(isNaN(_loc1_))
         {
            return 0;
         }
         return _loc1_ * scaleX;
      }
      
      public function get preferredHeight() : Number
      {
         var _loc1_:Number = isNaN(this._8682) ? this.measuredHeight : this._8682;
         if(isNaN(_loc1_))
         {
            return 0;
         }
         return _loc1_ * scaleY;
      }
      
      public function get preferredX() : Number
      {
         return super.x;
      }
      
      public function get preferredY() : Number
      {
         return super.y;
      }
      
      public function get layoutBoundsX() : Number
      {
         return super.x;
      }
      
      public function get layoutBoundsY() : Number
      {
         return super.y;
      }
      
      public function get layoutBoundsWidth() : Number
      {
         var _loc1_:Number = 0;
         if(this.ns_egret::_8228)
         {
            _loc1_ = this.ns_egret::_width;
         }
         else if(!isNaN(this.explicitWidth))
         {
            _loc1_ = this._8684;
         }
         else
         {
            _loc1_ = this.measuredWidth;
         }
         return _loc1_ * scaleX;
      }
      
      public function get layoutBoundsHeight() : Number
      {
         var _loc1_:Number = 0;
         if(this.ns_egret::_8227)
         {
            _loc1_ = this.ns_egret::_height;
         }
         else if(!isNaN(this.explicitHeight))
         {
            _loc1_ = this._8682;
         }
         else
         {
            _loc1_ = this.measuredHeight;
         }
         return _loc1_ * scaleY;
      }
      
      public function get _2576() : Boolean
      {
         return this._8687;
      }
      
      public function set _2576(param1:Boolean) : void
      {
         this._8687 = param1;
      }
      
      public function _2581() : void
      {
         if(stage)
         {
            stage.focus = this;
         }
      }
      
      public function get _8694() : Boolean
      {
         return this.mouseEnabled;
      }
      
      public function set _8694(param1:Boolean) : void
      {
         this.mouseEnabled = param1;
      }
      
      public function get _8691() : Boolean
      {
         return this.mouseChildren;
      }
      
      public function set _8691(param1:Boolean) : void
      {
         this.mouseChildren = param1;
      }
      
      public function _8490(param1:Boolean = true) : Number
      {
         return _1136._8490(this,null);
      }
      
      public function _8487(param1:Boolean = true) : Number
      {
         return _1136._8487(this,null);
      }
      
      public function _8506(param1:Boolean = true) : Number
      {
         return _1136._8506(this,null);
      }
      
      public function _8505(param1:Boolean = true) : Number
      {
         return _1136._8505(this,null);
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
         this.invalidateSize();
         this._8420();
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
         this.invalidateSize();
         this._8420();
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
         this.invalidateSize();
         this._8420();
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
         this.invalidateSize();
         this._8420();
      }
   }
}

