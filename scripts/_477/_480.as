package _477
{
   import _609._621;
   
   public class _480 extends _494
   {
      private var _3607:String;
      
      public function _480(param1:String)
      {
         super();
         this._3607 = param1;
      }
      
      override public function run() : void
      {
         var _loc2_:Array = null;
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:Object = _3613._3614[this._3607];
         if(_loc1_)
         {
            _loc4_ = [];
            for each(_loc2_ in _loc1_)
            {
               _loc5_ = 0;
               _loc6_ = int(_loc2_.length);
               while(_loc5_ < _loc6_)
               {
                  _loc3_ = _loc2_[_loc5_];
                  if(_loc3_.assetData == null)
                  {
                     _loc3_.assetData = _loc3_.bitmapData;
                     delete _loc3_.bitmapData;
                  }
                  if(!_loc3_.empty && _loc3_.assetData != null)
                  {
                     _loc4_.push(_loc3_);
                  }
                  _loc5_++;
               }
            }
            _3613._3609.type = _621.TYPE_MOVIECLIP;
            _3613._3609.images = _loc4_;
            _3613._3609._3608.images = _loc4_;
            complete();
         }
         else
         {
            fail(ExportController.EXPORT_ERROR_NO_DATA,null);
         }
      }
   }
}

