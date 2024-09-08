package _13505
{
   import _13492._13498;
   import _13492._13499;
   import _13503._13502;
   import _51._52;
   import _81._86;
   import flash.geom.Point;
   
   public class _13504 extends _13510
   {
      public var _1823:_52;
      
      public var _1797:Point;
      
      public var _1902:_86;
      
      public var _1904:_86;
      
      public var _13581:_13510;
      
      public var _13586:_13510;
      
      public var _13598:_13510;
      
      private var _13678:_86;
      
      public function _13504()
      {
         this._1797 = new Point();
         this._1902 = new _86();
         this._1904 = new _86();
         this._13678 = new _86();
         super();
         this.flag = _13510.FLAG_BONE;
         this._13581 = new _13510();
         this._13581.flag = _13510.FLAG_TRANSLATE;
         this._13581.parent = this;
         this._13586 = new _13510();
         this._13586.flag = _13510.FLAG_ROTATE;
         this._13586.parent = this;
         this._13598 = new _13510();
         this._13598.flag = _13510.FLAG_SCALE;
         this._13598.parent = this;
      }
      
      public static function _1869(param1:_52) : _13504
      {
         var _loc2_:_13504 = new _13504();
         _loc2_._1823 = param1;
         return _loc2_;
      }
      
      public function get name() : String
      {
         return this._1823.name;
      }
      
      public function _1894() : void
      {
         this._1823._1903 = this;
      }
      
      public function _1888() : void
      {
         this._1823._1903 = null;
      }
      
      override public function _1947(param1:Number) : void
      {
         this._13678.clear();
         if(!this._13581.isEmpty)
         {
            this._13581._1858(param1);
            if(Boolean(this._13581._13680) && this._13581._13680._13664)
            {
               this._13678.x = _13498(this._13581._13680)._13638.x;
               this._13678.y = _13498(this._13581._13680)._13638.y;
            }
            else
            {
               this._13678.x = 0;
               this._13678.y = 0;
            }
         }
         if(!this._13586.isEmpty)
         {
            this._13586._1858(param1);
            if(Boolean(this._13586._13680) && this._13586._13680._13664)
            {
               this._13678.rotation = _13499(this._13586._13680)._13639;
            }
            else
            {
               this._13678.rotation = 0;
            }
         }
         if(!this._13598.isEmpty)
         {
            this._13598._1858(param1);
            if(Boolean(this._13598._13680) && this._13598._13680._13664)
            {
               this._13678.scaleX = _13498(this._13598._13680)._13638.x;
               this._13678.scaleY = _13498(this._13598._13680)._13638.y;
            }
            else
            {
               this._13678.scaleX = 1;
               this._13678.scaleY = 1;
            }
         }
         this._1902.x = this._1904.x + this._13678.x;
         this._1902.y = this._1904.y + this._13678.y;
         this._1902.rotation = this._1904.rotation + this._13678.rotation;
         this._1902.scaleX = this._1904.scaleX * this._13678.scaleX;
         this._1902.scaleY = this._1904.scaleY * this._13678.scaleY;
      }
      
      public function _13640() : void
      {
         var _loc1_:_13498 = null;
         var _loc2_:_13498 = null;
         var _loc3_:_13499 = null;
         var _loc4_:_13499 = null;
         var _loc5_:_13498 = null;
         var _loc6_:_13498 = null;
         if(Boolean(this._13581) && this._13581._1816.length > 0)
         {
            _loc1_ = this._13581._1816[0];
            if(_loc1_.startPos > 0)
            {
               _loc2_ = new _13498();
               _loc2_.value = new Point();
               _loc2_.duration = _loc1_.startPos;
               _loc2_.startPos = 0;
               _loc2_.isFillFirst = true;
               this._13581._1816.unshift(_loc2_);
            }
         }
         if(Boolean(this._13586) && this._13586._1816.length > 0)
         {
            _loc3_ = this._13586._1816[0];
            if(_loc3_.startPos > 0)
            {
               (_loc4_ = new _13499()).value = 0;
               _loc4_.duration = _loc3_.startPos;
               _loc4_.startPos = 0;
               _loc4_.isFillFirst = true;
               this._13586._1816.unshift(_loc4_);
            }
         }
         if(Boolean(this._13598) && this._13598._1816.length > 0)
         {
            _loc5_ = this._13598._1816[0];
            if(_loc5_.startPos > 0)
            {
               (_loc6_ = new _13498()).value = new Point(1,1);
               _loc6_.duration = _loc5_.startPos;
               _loc6_.startPos = 0;
               _loc6_.isFillFirst = true;
               this._13598._1816.unshift(_loc6_);
            }
         }
      }
      
      public function _13635() : void
      {
         var _loc1_:_13498 = null;
         var _loc2_:_13499 = null;
         var _loc3_:_13498 = null;
         if(Boolean(this._13581) && this._13581._1816.length > 0)
         {
            _loc1_ = this._13581._1816[0];
            if(_loc1_.isFillFirst)
            {
               this._13581._1816.shift();
            }
         }
         if(Boolean(this._13586) && this._13586._1816.length > 0)
         {
            _loc2_ = this._13586._1816[0];
            if(_loc2_.isFillFirst)
            {
               this._13586._1816.shift();
            }
         }
         if(Boolean(this._13598) && this._13598._1816.length > 0)
         {
            _loc3_ = this._13598._1816[0];
            if(_loc3_.isFillFirst)
            {
               this._13598._1816.shift();
            }
         }
      }
      
      public function _13677() : Array
      {
         var _loc2_:_13502 = null;
         var _loc1_:Array = [];
         if(parent is _13502)
         {
            _loc2_ = parent as _13502;
            _loc1_ = _loc2_._13672(this._1823);
            _loc1_ = _loc1_.concat(_loc2_._13673(this._1823));
         }
         return _loc1_;
      }
      
      override public function clone() : _13510
      {
         var _loc1_:_13504 = new _13504();
         _loc1_._13679(this);
         _loc1_._1823 = this._1823;
         _loc1_._1797.x = this._1797.x;
         _loc1_._1797.y = this._1797.y;
         _loc1_._1904.copyFrom(this._1904);
         _loc1_._1902.copyFrom(this._1902);
         _loc1_._13581 = this._13581.clone();
         _loc1_._13586 = this._13586.clone();
         _loc1_._13598 = this._13598.clone();
         _loc1_._13581.parent = _loc1_;
         _loc1_._13586.parent = _loc1_;
         _loc1_._13598.parent = _loc1_;
         return _loc1_;
      }
      
      override public function _5819(param1:int) : Boolean
      {
         return this._13581._5819(param1) || this._13586._5819(param1) || this._13598._5819(param1);
      }
   }
}

