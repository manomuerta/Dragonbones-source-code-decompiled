package _13505
{
   import _13492._13493;
   import _13492._13494;
   import _13492._13495;
   import _51._69;
   import _51._79;
   import _73._74;
   import _81._83;
   
   public class _13508 extends _13510
   {
      public var _1824:_79;
      
      private var _1924:_83;
      
      private var _1922:_69;
      
      private var _1927:String;
      
      private var _13681:Boolean;
      
      public var _13599:_13510;
      
      public var _13572:_13510;
      
      public var _13592:_13510;
      
      public function _13508()
      {
         this._1924 = new _83();
         super();
         flag = FLAG_SLOT;
         this._13599 = new _13510();
         this._13599.flag = FLAG_COLOR;
         this._13599.parent = this;
         this._13572 = new _13510();
         this._13572.flag = FLAG_DISPLAY_INDEX;
         this._13572.parent = this;
         this._13592 = new _13510();
         this._13592.flag = FLAG_VISIBLE;
         this._13592.parent = this;
      }
      
      public static function _1869(param1:_79) : _13508
      {
         var _loc2_:_13508 = new _13508();
         _loc2_._1824 = param1;
         return _loc2_;
      }
      
      public function get name() : String
      {
         return this._1824.name;
      }
      
      public function _1895() : void
      {
         this._1947(0);
         this._1824._1903 = this;
         this._1922 = this._1824._1923;
      }
      
      public function _1889() : void
      {
         this._1824._1903 = null;
         this._1824._14309 = 0;
         this._1824.curFrameIndex = 0;
         this._1922 = null;
      }
      
      override public function _1947(param1:Number) : void
      {
         this._1924.copyFrom(this._1824._2152);
         this._1922 = this._1824._1711;
         this._1927 = null;
         if(Boolean(this._1824._2049) && this._1824._2049.type == _74.ARMATURE)
         {
            this._1824.curFrameIndex = param1;
            this._1927 = this._1824.gotoAndPlay;
            this._1824._14309 = this._14308(param1);
         }
         if(!this._13599.isEmpty)
         {
            this._13599._1858(param1);
            if(Boolean(this._13599._13680) && this._13599._13680._13664)
            {
               this._1924.copyFrom(_13494(this._13599._13680)._13601);
            }
            else
            {
               this._1924.clear();
            }
         }
         if(!this._13572.isEmpty)
         {
            this._13572._1858(param1);
            if(Boolean(this._13572._13680) && this._13572._13680._13664)
            {
               this._1922 = _13495(this._13572._13680)._13613;
               this._1927 = _13495(this._13572._13680)._13603;
            }
            else
            {
               this._1922 = !!this._1824 ? this._1824._1711 : null;
               this._1927 = !!this._1824 ? this._1824.gotoAndPlay : null;
            }
         }
         if(!this._13592.isEmpty)
         {
            this._13592._1858(param1);
            if(Boolean(this._13592._13680) && this._13592._13680._13664)
            {
               this._13681 = _13493(this._13592._13680)._13630;
            }
            else
            {
               this._13681 = this._1824._13683;
            }
         }
      }
      
      private function _14308(param1:Number) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_13495 = null;
         var _loc5_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(this._13572._1816.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._13572._1816[_loc2_] as _13495;
            if(_loc4_.startPos > param1)
            {
               break;
            }
            if(_loc4_._13603 != null)
            {
               _loc5_ = _loc4_.startPos;
            }
            _loc2_++;
         }
         return _loc5_;
      }
      
      public function get _1926() : _83
      {
         return this._1924;
      }
      
      public function get _1923() : _69
      {
         return this._1922;
      }
      
      public function get currentAnimation() : String
      {
         return this._1927;
      }
      
      public function get _13682() : Boolean
      {
         return this._13681;
      }
      
      public function _13640() : void
      {
         var _loc1_:_13494 = null;
         var _loc2_:_13494 = null;
         var _loc3_:_13495 = null;
         var _loc4_:_13495 = null;
         var _loc5_:_13493 = null;
         var _loc6_:_13493 = null;
         if(Boolean(this._13599) && this._13599._1816.length > 0)
         {
            _loc1_ = this._13599._1816[0];
            if(_loc1_.startPos > 0)
            {
               _loc2_ = new _13494();
               _loc2_.value = new _83();
               _loc2_.duration = _loc1_.startPos;
               _loc2_.startPos = 0;
               _loc2_.isFillFirst = true;
               this._13599._1816.unshift(_loc2_);
            }
         }
         if(Boolean(this._13572) && this._13572._1816.length > 0)
         {
            _loc3_ = this._13572._1816[0];
            if(_loc3_.startPos > 0)
            {
               (_loc4_ = new _13495()).value = this._1824._1711;
               _loc4_.duration = _loc3_.startPos;
               _loc4_.startPos = 0;
               _loc4_.isFillFirst = true;
               this._13572._1816.unshift(_loc4_);
            }
         }
         if(Boolean(this._13592) && this._13592._1816.length > 0)
         {
            _loc5_ = this._13592._1816[0];
            if(_loc5_.startPos > 0)
            {
               (_loc6_ = new _13493()).value = true;
               _loc6_.duration = _loc5_.startPos;
               _loc6_.startPos = 0;
               _loc6_.isFillFirst = true;
               this._13592._1816.unshift(_loc6_);
            }
         }
      }
      
      public function _13635() : void
      {
         var _loc1_:_13494 = null;
         var _loc2_:_13495 = null;
         var _loc3_:_13493 = null;
         if(Boolean(this._13599) && this._13599._1816.length > 0)
         {
            _loc1_ = this._13599._1816[0];
            if(_loc1_.isFillFirst)
            {
               this._13599._1816.shift();
            }
         }
         if(Boolean(this._13572) && this._13572._1816.length > 0)
         {
            _loc2_ = this._13572._1816[0];
            if(_loc2_.isFillFirst)
            {
               this._13572._1816.shift();
            }
         }
         if(Boolean(this._13592) && this._13592._1816.length > 0)
         {
            _loc3_ = this._13592._1816[0];
            if(_loc3_.isFillFirst)
            {
               this._13592._1816.shift();
            }
         }
      }
      
      override public function clone() : _13510
      {
         var _loc1_:_13508 = new _13508();
         _loc1_._13679(this);
         _loc1_._1824 = this._1824;
         _loc1_._13599 = this._13599.clone();
         _loc1_._13572 = this._13572.clone();
         _loc1_._13592 = this._13592.clone();
         _loc1_._13599.parent = _loc1_;
         _loc1_._13572.parent = _loc1_;
         _loc1_._13592.parent = _loc1_;
         return _loc1_;
      }
      
      override public function _5819(param1:int) : Boolean
      {
         return this._13599._5819(param1) || this._13572._5819(param1) || this._13592._5819(param1);
      }
   }
}

