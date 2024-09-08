package _35
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _37
   {
      protected var _1851:Object;
      
      protected var _1852:Boolean;
      
      protected var _name:String;
      
      protected var _1855:MovieClip;
      
      protected var _bitmapData:BitmapData;
      
      protected var _1857:Number;
      
      public function _37(param1:Object, param2:Object, param3:Number = 1, param4:Boolean = false)
      {
         super();
         this._1857 = param3;
         this._1852 = param4;
         if(param1 is BitmapData)
         {
            this._bitmapData = param1 as BitmapData;
         }
         else if(param1 is MovieClip)
         {
            this._1855 = param1 as MovieClip;
            this._1855.stop();
         }
         this._1856(param2);
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get movieClip() : MovieClip
      {
         return this._1855;
      }
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      public function get scale() : Number
      {
         return this._1857;
      }
      
      public function dispose() : void
      {
         this._1855 = null;
         if(this._bitmapData)
         {
            this._bitmapData.dispose();
         }
         this._bitmapData = null;
      }
      
      public function getRegion(param1:String) : Rectangle
      {
         var _loc2_:_38 = this._1851[param1] as _38;
         if(_loc2_)
         {
            return _loc2_.region;
         }
         return null;
      }
      
      public function getFrame(param1:String) : Rectangle
      {
         var _loc2_:_38 = this._1851[param1] as _38;
         if(_loc2_)
         {
            return _loc2_.frame;
         }
         return null;
      }
      
      public function getBitmapData(param1:String) : BitmapData
      {
         var _loc2_:BitmapData = null;
         var _loc6_:BitmapData = null;
         var _loc7_:Matrix = null;
         var _loc8_:Rectangle = null;
         var _loc9_:int = 0;
         var _loc10_:Rectangle = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(this._bitmapData == null)
         {
            return null;
         }
         var _loc3_:Rectangle = this.getFrame(param1);
         var _loc4_:Rectangle = this.getRegion(param1);
         var _loc5_:_38 = this._1851[param1] as _38;
         if(_loc4_)
         {
            if(_loc3_ != null)
            {
               _loc10_ = _loc3_;
               _loc11_ = -_loc3_.x;
               _loc12_ = -_loc3_.y;
               if(_loc5_.rotated)
               {
                  _loc11_ = -_loc3_.y;
                  _loc12_ = -_loc3_.x;
               }
            }
            else
            {
               _loc10_ = _loc4_;
               _loc11_ = 0;
               _loc12_ = 0;
            }
            if(_loc10_.width < 1)
            {
               _loc10_.width = 1;
            }
            if(_loc10_.height < 1)
            {
               _loc10_.height = 1;
            }
            if(_loc5_.rotated)
            {
               _loc8_ = _loc4_.clone();
               _loc9_ = _loc8_.height;
               _loc8_.height = _loc8_.width;
               _loc8_.width = _loc9_;
               _loc6_ = new BitmapData(_loc10_.height,_loc10_.width,true,0);
               _loc6_.copyPixels(this._bitmapData,_loc8_,new Point(_loc11_,_loc12_));
               _loc2_ = new BitmapData(_loc10_.width,_loc10_.height,true,0);
               _loc7_ = new Matrix();
               _loc7_.translate(-_loc10_.height / 2,-_loc10_.width / 2);
               _loc7_.rotate(Math.PI / 2);
               _loc7_.translate(_loc10_.width / 2,_loc10_.height / 2);
               _loc2_.draw(_loc6_,_loc7_);
               _loc6_.dispose();
            }
            else
            {
               _loc2_ = new BitmapData(_loc10_.width,_loc10_.height,true,0);
               _loc2_.copyPixels(this._bitmapData,_loc4_,new Point(_loc11_,_loc12_));
            }
         }
         return _loc2_;
      }
      
      protected function _1856(param1:Object) : void
      {
         this._1851 = _34._1720(param1,this._1852 ? this._1857 : 1);
         this._name = this._1851.__name;
         delete this._1851.__name;
      }
      
      private function _1850() : void
      {
         if(!this._bitmapData && Boolean(this._1855))
         {
            this._1855.gotoAndStop(1);
            this._bitmapData = new BitmapData(this._1853(this._1855.width),this._1853(this._1855.height),true,16711935);
            this._bitmapData.draw(this._1855);
            this._1855.gotoAndStop(this._1855.totalFrames);
         }
      }
      
      private function _1853(param1:uint) : uint
      {
         return !!(param1 & param1 - 1) ? uint(1 << param1.toString(2).length) : param1;
      }
   }
}

