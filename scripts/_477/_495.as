package _477
{
   import _609._621;
   import _721._720;
   
   public class _495
   {
      public static var instance:_495;
      
      public static const SINGLE_FLAG:String = "@SINGLE";
      
      public var _3609:_621;
      
      public var _3238:_720;
      
      public var _3675:Object;
      
      public var ouputPath:String;
      
      public var _3676:Array;
      
      public var _3614:Object;
      
      public function _495()
      {
         this._3676 = [];
         this._3614 = {};
         super();
      }
      
      public function _3444() : void
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         for(_loc2_ in this._3614)
         {
            _loc3_ = this._3614[_loc2_];
            for(_loc4_ in _loc3_)
            {
               _loc1_ = _loc3_[_loc4_];
               if(_loc1_)
               {
                  _loc5_ = 0;
                  _loc6_ = int(_loc1_.length);
                  while(_loc5_ < _loc6_)
                  {
                     if(_loc1_[_loc5_].bitmapData)
                     {
                        _loc1_[_loc5_].bitmapData.dispose();
                        _loc1_[_loc5_].bitmapData = null;
                     }
                     else if(_loc1_[_loc5_].assetData)
                     {
                        _loc1_[_loc5_].assetData.dispose();
                        _loc1_[_loc5_].assetData = null;
                     }
                     _loc5_++;
                  }
               }
               delete _loc3_[_loc4_];
            }
            delete this._3614[_loc2_];
         }
      }
      
      public function dispose() : void
      {
         this._3609.dispose();
         this._3444();
      }
   }
}

