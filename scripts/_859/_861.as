package _859
{
   import _1045.Group;
   import _13503._13502;
   import _1404._1407;
   import _14075._14074;
   import _14075._14076;
   import _14075._14077;
   import _51._50;
   import _51._79;
   import _521._528;
   import _724._14087;
   import _724._723;
   import _724._725;
   import _724._726;
   import _724._735;
   import _73._74;
   import _81._88;
   import egret.core._1140;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class _861 extends Group implements _860, _858
   {
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _3251:_50;
      
      private var _6354:Dictionary;
      
      private var _6346:_723;
      
      private var _6352:int;
      
      private var _5225:_13502;
      
      private var _6349:LibraryImage;
      
      private var _6353:_735;
      
      private var _6348:Number;
      
      private var _6347:Number;
      
      private var _14757:_14077;
      
      public var animation:String;
      
      private var _13977:Number = 0;
      
      private var _14758:int;
      
      private var _14760:Function;
      
      public function _861()
      {
         this.UNIT_MATRIX = new Matrix();
         super();
         this._6354 = new Dictionary();
         this._14757 = _14077.instance;
      }
      
      public function _14759(param1:Number, param2:int) : void
      {
         this._14758 = param2;
         this._13977 = param1;
      }
      
      public function gotoAndStop(param1:String, param2:int) : void
      {
         var _loc3_:_14076 = this._14757._14669(this._3251,param1,param2);
         if(_loc3_)
         {
            this._14761(_loc3_);
         }
      }
      
      public function get _2104() : _725
      {
         return this._6346;
      }
      
      public function set _3144(param1:Function) : void
      {
         this._14760 = param1;
      }
      
      public function set _2104(param1:_725) : void
      {
         if(this._6346 != null)
         {
            this._6346._5725(this);
         }
         this.dispose();
         this._3251 = null;
         this._6346 = param1 as _723;
         this._6352 = 0;
         if(this._6346 != null)
         {
            this._6346._5735(this);
         }
         else if(param1 is _735)
         {
            this._6353 = param1 as _735;
            this._6353.setSize(this._6348,this._6347);
            this._6351();
         }
      }
      
      private function _6351() : void
      {
         if(this._6349 == null)
         {
            this._6349 = new LibraryImage();
         }
         this._6349._2104 = this._6353;
         addElement(this._6349);
      }
      
      private function _14761(param1:_14076) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_1140 = null;
         var _loc4_:_14074 = null;
         var _loc5_:int = 0;
         var _loc6_:int = int(this._3251._1780.length);
         while(_loc5_ < _loc6_)
         {
            _loc2_ = this._3251._1780[_loc5_];
            _loc3_ = this._6350(_loc2_) as _1140;
            _loc4_ = param1._14665(_loc2_);
            if(_loc4_ == null)
            {
               _loc3_.visible = false;
            }
            else
            {
               if(_loc3_.parent == null)
               {
                  addElement(_loc3_);
               }
               _loc3_.visible = true;
               if(Boolean(_loc2_._2049) && _loc2_._2049._2165)
               {
                  (_loc3_ as _14094)._4242(_loc4_._14663,_loc4_._2709,_loc4_._14664);
               }
               (_loc3_ as _860)._2104 = _loc4_._2104;
               _loc3_.transform.matrix = _loc4_.matrix;
               _loc3_.transform.colorTransform = _loc4_.color;
               if((_loc3_ as _860)._5744)
               {
                  _loc3_.addEventListener(Event.COMPLETE,this._6345);
                  ++this._6352;
               }
               else if(_loc3_.hasEventListener(Event.COMPLETE))
               {
                  _loc3_.removeEventListener(Event.COMPLETE,this._6345);
               }
            }
            _loc5_++;
         }
      }
      
      private function draw() : void
      {
         var _loc1_:_79 = null;
         var _loc2_:_1140 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(this._3251._1780.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = this._3251._1780[_loc3_];
            _loc2_ = this._6350(_loc1_) as _1140;
            if(_loc1_._2049 == null)
            {
               _loc2_.visible = false;
            }
            else
            {
               if(_loc2_.parent == null)
               {
                  addElement(_loc2_);
               }
               _loc2_.visible = true;
               (_loc2_ as _860)._2104 = _loc1_._2049._2104;
               if(_loc1_._2112())
               {
                  _loc2_.transform.matrix = this.UNIT_MATRIX;
               }
               else
               {
                  _loc2_.transform.matrix = _loc1_._2009;
               }
               _loc2_.transform.colorTransform = _loc1_._1926;
               if((_loc2_ as _860)._5744)
               {
                  _loc2_.addEventListener(Event.COMPLETE,this._6345);
                  ++this._6352;
               }
               else if(_loc2_.hasEventListener(Event.COMPLETE))
               {
                  _loc2_.removeEventListener(Event.COMPLETE,this._6345);
               }
            }
            _loc3_++;
         }
      }
      
      private function _6350(param1:_79) : _860
      {
         var _loc2_:_860 = this._6354[param1];
         if(_loc2_ == null || !(_loc2_ is _861) && param1._2049 && param1._2049.type == _74.ARMATURE || _loc2_ is _861 && param1._2049 && param1._2049.type == _74.IMAGE)
         {
            if(Boolean(param1._2049) && param1._2049.type == _74.ARMATURE)
            {
               _loc2_ = new _861();
            }
            else if(Boolean(param1._2049) && param1._2049._2104 is _726)
            {
               _loc2_ = new _865();
            }
            else if(Boolean(param1._2049) && param1._2049._2104 is _14087)
            {
               _loc2_ = new _865();
            }
            else if(Boolean(param1._2049) && param1._2049.type == _74.MESH)
            {
               _loc2_ = new _14094();
               (_loc2_ as _14094).mesh = param1._2049.mesh;
            }
            else
            {
               _loc2_ = new LibraryImage();
            }
            this._6354[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      private function get _2106() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
      
      public function set _5724(param1:Object) : void
      {
         var _loc2_:Rectangle = null;
         if(this._3251 == param1)
         {
            return;
         }
         if(param1 is _50)
         {
            this._3251 = param1 as _50;
            this.gotoAndStop(this.animation == null ? (!!this._3251.currentAnimation ? this._3251.currentAnimation : this._3251.defaultAnimation) : this.animation,this._13977 - this._14758);
            if(this._6346)
            {
               _loc2_ = this.AABB;
               this._6346._2166 = _loc2_.x;
               this._6346._2167 = _loc2_.y;
               this._6346.width = _loc2_.width;
               this._6346.height = _loc2_.height;
               this._6348 = _loc2_.width;
               this._6347 = _loc2_.height;
               if(this._14760 != null)
               {
                  this._14760(_loc2_);
               }
            }
            if(this._6352 > 0)
            {
               this._5744 = true;
            }
         }
      }
      
      public function get _5747() : Boolean
      {
         return this._5741;
      }
      
      public function get _5744() : Boolean
      {
         return this._5740;
      }
      
      public function set _5747(param1:Boolean) : void
      {
         this._5741 = param1;
      }
      
      public function set _5744(param1:Boolean) : void
      {
         if(this._5740 != param1)
         {
            this._5740 = param1;
            if(!this._5740)
            {
               dispatchEvent(new Event(Event.COMPLETE));
            }
         }
      }
      
      private function _6345(param1:Event) : void
      {
         --this._6352;
         if(this._6352 == 0)
         {
            this._5744 = false;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:Object = null;
         this._5744 = false;
         for(_loc1_ in this._6354)
         {
            (this._6354[_loc1_] as _860)._2104 = null;
            (this._6354[_loc1_] as _860).dispose();
            this._6354[_loc1_] = null;
            delete this._6354[_loc1_];
         }
         _2426();
      }
      
      override public function _6040() : void
      {
         var _loc1_:Object = null;
         super._6040();
         for(_loc1_ in this._6354)
         {
            if(this._6354[_loc1_] is _1140)
            {
               (this._6354[_loc1_] as _1140)._6040();
            }
         }
      }
      
      public function get matrix() : Matrix
      {
         return transform.matrix;
      }
      
      public function get AABB() : Rectangle
      {
         var _loc2_:_858 = null;
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Rectangle = null;
         var _loc8_:Matrix = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc1_:Vector.<Point> = new Vector.<Point>();
         var _loc9_:int = 0;
         var _loc10_:int = this._2249;
         while(_loc9_ < _loc10_)
         {
            _loc2_ = getElementAt(_loc9_) as _858;
            if(Boolean(_loc2_) && Boolean(_loc2_.AABB))
            {
               _loc7_ = _loc2_.AABB;
               _loc8_ = _loc2_.matrix;
               _loc3_ = new Point(_loc7_.x,_loc7_.y);
               _loc4_ = new Point(_loc7_.x + _loc7_.width,_loc7_.y);
               _loc5_ = new Point(_loc7_.x,_loc7_.y + _loc7_.height);
               _loc6_ = new Point(_loc7_.x + _loc7_.width,_loc7_.y + _loc7_.height);
               _loc1_.push(_88._2135(_loc3_,_loc8_));
               _loc1_.push(_88._2135(_loc4_,_loc8_));
               _loc1_.push(_88._2135(_loc5_,_loc8_));
               _loc1_.push(_88._2135(_loc6_,_loc8_));
            }
            _loc9_++;
         }
         if(_loc1_.length > 0)
         {
            _loc11_ = Number.MAX_VALUE;
            _loc12_ = -Number.MAX_VALUE;
            _loc13_ = Number.MAX_VALUE;
            _loc14_ = -Number.MAX_VALUE;
            _loc9_ = 0;
            _loc10_ = int(_loc1_.length);
            while(_loc9_ < _loc10_)
            {
               if(_loc1_[_loc9_].x < _loc11_)
               {
                  _loc11_ = _loc1_[_loc9_].x;
               }
               if(_loc1_[_loc9_].x > _loc12_)
               {
                  _loc12_ = _loc1_[_loc9_].x;
               }
               if(_loc1_[_loc9_].y < _loc13_)
               {
                  _loc13_ = _loc1_[_loc9_].y;
               }
               if(_loc1_[_loc9_].y > _loc14_)
               {
                  _loc14_ = _loc1_[_loc9_].y;
               }
               _loc9_++;
            }
         }
         else
         {
            _loc11_ = 0;
            _loc12_ = 0;
            _loc13_ = 0;
            _loc14_ = 0;
         }
         return new Rectangle(_loc11_,_loc13_,_loc12_ - _loc11_,_loc14_ - _loc13_);
      }
   }
}

