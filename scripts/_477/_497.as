package _477
{
   import flash.utils.ByteArray;
   
   public class _497 extends _494
   {
      private var _callback:Function;
      
      public function _497(param1:Function)
      {
         super();
         this._callback = param1;
      }
      
      override public function run() : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:ByteArray = null;
         var _loc5_:String = null;
         var _loc7_:Object = null;
         var _loc1_:int = int(_3613._3676.length);
         _loc3_ = _3613._3676[0].data;
         var _loc6_:Array = [];
         _loc2_ = 1;
         while(_loc2_ < _loc1_)
         {
            (_loc7_ = new Object())._1854 = _3613._3676[_loc2_].data;
            _loc7_.textureConfig = _3613._3676[_loc2_ + 1].data;
            _loc2_++;
            _loc6_.push(_loc7_);
            _loc2_++;
         }
         this._callback(_loc3_,_loc6_);
         complete();
      }
   }
}

