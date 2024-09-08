package _609
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class _618 extends _620
   {
      public function _618()
      {
         super();
      }
      
      override public function run() : void
      {
         var _loc1_:Object = null;
         var _loc2_:BitmapData = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Rectangle = null;
         if(_3613._3610)
         {
            complete();
            return;
         }
         _loc11_ = 0;
         _loc12_ = int(_3613.images.length);
         while(_loc11_ < _loc12_)
         {
            _loc1_ = _3613.images[_loc11_];
            _loc1_.frameX = 0;
            _loc1_.frameY = 0;
            _loc1_.originFrameX = 0;
            _loc1_.originFrameY = 0;
            if(_loc1_.assetData != null)
            {
               _loc7_ = Number(_loc1_.assetData.width);
               _loc8_ = Number(_loc1_.assetData.height);
               _loc9_ = Math.round(_loc7_ * _3608.scale);
               _loc10_ = Math.round(_loc8_ * _3608.scale);
               if(_loc9_ <= 1)
               {
                  _loc9_ = 1;
               }
               if(_loc10_ <= 1)
               {
                  _loc10_ = 1;
               }
               if(_loc9_ > _619.MAX_BITMAP_WIDTH)
               {
                  _loc9_ = _619.MAX_BITMAP_WIDTH;
               }
               if(_loc10_ > _619.MAX_BITMAP_HEIGHT)
               {
                  _loc10_ = _619.MAX_BITMAP_HEIGHT;
               }
               _loc1_.width = _loc9_;
               _loc1_.height = _loc10_;
               delete _loc1_.frameWidth;
               delete _loc1_.frameHeight;
               delete _loc1_.frameX;
               delete _loc1_.frameY;
               delete _loc1_.originFrameX;
               delete _loc1_.originFrameY;
            }
            _loc11_++;
         }
         if(_3608._5420 && !_3613._3611)
         {
            _loc11_ = 0;
            _loc12_ = int(_3613.images.length);
            while(_loc11_ < _loc12_)
            {
               _loc1_ = _3613.images[_loc11_];
               if(_loc1_.assetData is BitmapData)
               {
                  _loc2_ = _loc1_.assetData as BitmapData;
                  _loc3_ = _loc2_.width;
                  _loc4_ = _loc2_.height;
                  if(!_loc1_._2165)
                  {
                     _loc13_ = _loc2_.getColorBoundsRect(4278190080,0,false);
                     if(_loc13_.width == 0 && _loc13_.height == 0)
                     {
                        _loc13_ = new Rectangle(0,0,_loc3_,_loc4_);
                     }
                     else
                     {
                        this._5238(_loc13_);
                     }
                     if(_loc13_.x != 0 || _loc13_.y != 0 || _loc13_.width != _loc3_ || _loc13_.height != _loc4_)
                     {
                        _loc1_.frameX = -Math.round(_loc13_.x * _3608.scale);
                        _loc1_.frameY = -Math.round(_loc13_.y * _3608.scale);
                        _loc1_.originFrameX = -_loc13_.x;
                        _loc1_.originFrameY = -_loc13_.y;
                        _loc1_.frameWidth = _loc1_.width;
                        _loc1_.frameHeight = _loc1_.height;
                        _loc3_ = _loc13_.width;
                        _loc4_ = _loc13_.height;
                     }
                  }
                  _loc5_ = Math.round(_loc3_ * _3608.scale);
                  _loc6_ = Math.round(_loc4_ * _3608.scale);
                  if(_loc5_ <= 1)
                  {
                     _loc5_ = 1;
                  }
                  if(_loc6_ <= 1)
                  {
                     _loc6_ = 1;
                  }
                  if(_loc5_ > _619.MAX_BITMAP_WIDTH)
                  {
                     _loc5_ = _619.MAX_BITMAP_WIDTH;
                  }
                  if(_loc6_ > _619.MAX_BITMAP_HEIGHT)
                  {
                     _loc6_ = _619.MAX_BITMAP_HEIGHT;
                  }
                  _loc1_.width = _loc5_;
                  _loc1_.height = _loc6_;
               }
               _loc11_++;
            }
            _3613._3611 = true;
         }
         _3613._3610 = true;
         _3613._3608._5411 = false;
         complete();
      }
      
      private function _5238(param1:Rectangle) : void
      {
         if(Math.abs(param1.left % 1) > 0)
         {
            param1.width += 1;
         }
         if(Math.abs(param1.top % 1) > 0)
         {
            param1.height += 1;
         }
         if(param1.width < 1)
         {
            param1.width = 1;
         }
         if(param1.height < 1)
         {
            param1.height = 1;
         }
         if(param1.x < 0)
         {
            param1.x = -Math.round(-param1.x);
         }
         else
         {
            param1.x = Math.round(param1.x);
         }
         if(param1.y < 0)
         {
            param1.y = -Math.round(-param1.y);
         }
         else
         {
            param1.y = Math.round(param1.y);
         }
      }
   }
}

