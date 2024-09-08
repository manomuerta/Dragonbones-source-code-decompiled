package _609
{
   public class _616 extends _620
   {
      public function _616()
      {
         super();
      }
      
      override public function run() : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc1_:Array = [];
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         var _loc8_:int = int(_3613.images.length);
         while(_loc7_ < _loc8_)
         {
            _loc4_ = _3613.images[_loc7_];
            _loc5_ = _3613._3616[_loc4_.name];
            if(_loc5_)
            {
               _loc2_ = {
                  "name":_loc4_.name,
                  "x":_loc5_.x,
                  "y":_loc5_.y,
                  "width":int(_loc5_.width),
                  "height":int(_loc5_.height)
               };
               if(_loc4_.frameX != null)
               {
                  _loc2_.frameX = _loc4_.frameX;
               }
               if(_loc4_.frameY != null)
               {
                  _loc2_.frameY = _loc4_.frameY;
               }
               if(_loc4_.frameWidth != null)
               {
                  _loc2_.frameWidth = int(_loc4_.frameWidth);
               }
               if(_loc4_.frameHeight != null)
               {
                  _loc2_.frameHeight = int(_loc4_.frameHeight);
               }
               if(_loc6_[_loc5_.page] == null)
               {
                  _loc6_[_loc5_.page] = [];
               }
               _loc6_[_loc5_.page].push(_loc2_);
            }
            _loc7_++;
         }
         _3613._3705 = _loc6_;
         _3613._3693 = _loc6_[0];
         complete();
      }
   }
}

