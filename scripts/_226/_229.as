package _226
{
   import _521._532;
   import _93._92;
   
   public class _229 extends _92
   {
      public function _229()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc2_:Object = null;
         var _loc3_:_231 = null;
         super.execute();
         _2208 = [];
         var _loc1_:Array = _2223 as Array;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:int = int(_loc1_.length);
         while(_loc5_ < _loc6_)
         {
            _loc2_ = _loc1_[_loc5_];
            if(_loc2_.hasOwnProperty("displayVO"))
            {
               _loc4_.push(_loc2_["displayVO"]);
            }
            _loc3_ = new _231();
            _loc3_._1572(_loc2_);
            _2208.push(_loc3_);
            _loc3_.execute();
            _loc5_++;
         }
         this._2894(_loc4_);
      }
      
      private function _2894(param1:Array) : void
      {
         _532.instance._2889 = param1;
      }
      
      override public function revert() : void
      {
         var _loc1_:_231 = null;
         super.revert();
         var _loc2_:Array = _2208 as Array;
         var _loc3_:int = 0;
         var _loc4_:int = int(_loc2_.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = _loc2_[_loc3_] as _231;
            _loc1_.revert();
            _loc3_++;
         }
      }
   }
}

