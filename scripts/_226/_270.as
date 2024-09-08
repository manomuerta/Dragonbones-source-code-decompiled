package _226
{
   import _51._69;
   import _51._70;
   import _51._79;
   
   public class _270 extends _268
   {
      public function _270()
      {
         super();
      }
      
      override protected function _2211() : *
      {
         var _loc4_:_70 = null;
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         for each(_loc4_ in _3038)
         {
            _loc1_.push(_loc4_._1733);
            _loc2_.push(_loc4_._1760);
            _loc3_.push(_loc4_._1760._2156);
         }
         return {
            "parentPlaceHolderList":_loc1_,
            "parentSlotVOList":_loc2_,
            "_3032":_loc3_,
            "_3034":this._3046._2156
         };
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3044(this._3046,this._3045,_3032,this._3034);
         _2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._3043(_3036,_3035,_3033,_3031);
         _2894();
      }
      
      protected function _3044(param1:_79, param2:Array, param3:Array, param4:_70) : void
      {
         var _loc7_:_79 = null;
         var _loc5_:int = 0;
         var _loc6_:int = int(_3038.length);
         while(_loc5_ < _loc6_)
         {
            _loc7_ = (_3038[_loc5_] as _70)._1760;
            _3037(_3038[_loc5_],param1,!!param2 ? param2[_loc5_] : null,param3[_loc5_],param4);
            _3039(_loc7_);
            _loc5_++;
         }
         _3039(param1);
      }
      
      protected function _3043(param1:Array, param2:Array, param3:_70, param4:Array) : void
      {
         var _loc5_:_79 = (_3038[0] as _70)._1760;
         var _loc6_:int = 0;
         var _loc7_:int = int(_3038.length);
         while(_loc6_ < _loc7_)
         {
            _3037(_3038[_loc6_],param1[_loc6_],param2[_loc6_],param3,param4[_loc6_]);
            _3039(param1[_loc6_]);
            _loc6_++;
         }
         _3039(_loc5_);
      }
      
      protected function get _3046() : _79
      {
         return _2223.toParentSlotVO;
      }
      
      protected function get _3045() : Array
      {
         return _2223.toParentPlaceHolderList;
      }
      
      protected function get _3034() : _70
      {
         return _2223._3034;
      }
   }
}

