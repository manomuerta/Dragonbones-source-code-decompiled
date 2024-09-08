package _676
{
   import _51._69;
   import _51._79;
   import _703._702;
   import _703._704;
   import _703._705;
   
   public class _700 extends _704
   {
      public function _700()
      {
         super();
      }
      
      public static function _3996(param1:_684, param2:_79) : _700
      {
         var _loc3_:_700 = new _700();
         _loc3_._1837 = param2;
         _loc3_.parentBone = param1;
         _loc3_._5823();
         return _loc3_;
      }
      
      public static function _5828(param1:_687, param2:_79) : _700
      {
         var _loc3_:_700 = new _700();
         _loc3_.parent = param1;
         _loc3_._1837 = param2;
         return _loc3_;
      }
      
      public function _5823() : void
      {
         var _loc1_:_69 = null;
         var _loc2_:_685 = null;
         _5822 = [];
         for each(_loc1_ in this._1837._1715)
         {
            _loc2_ = _705._3014[this._1837._1765[_loc1_]];
            if(_loc2_)
            {
               _loc2_.parent = this;
               _5822.push(_loc2_);
            }
         }
      }
      
      override public function toString() : String
      {
         return "a" + name;
      }
      
      public function get _1837() : _79
      {
         return _3670 as _79;
      }
      
      public function set _1837(param1:_79) : void
      {
         if(_3670 == param1)
         {
            return;
         }
         _3670 = param1;
      }
      
      public function set parentBone(param1:_684) : void
      {
         if(this._5866 == param1)
         {
            return;
         }
         if(this._5866)
         {
            this._5866._2932(this);
         }
         _parent = param1;
         if(this._5866)
         {
            this._5866.addSlot(this);
            this._13940();
         }
      }
      
      private function _13940() : void
      {
         var _loc3_:_702 = null;
         var _loc4_:Array = null;
         var _loc1_:Array = this._5866.children;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
            if(_loc3_ is _700)
            {
               _loc4_ = _loc1_.splice(_loc2_,1);
               _loc1_.splice(0,0,_loc4_[0]);
            }
            _loc2_++;
         }
      }
      
      private function get _5866() : _684
      {
         return _parent as _684;
      }
   }
}

