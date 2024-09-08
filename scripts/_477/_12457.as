package _477
{
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class _12457 extends _494
   {
      private var _3707:Function;
      
      private var _3607:String;
      
      public function _12457(param1:String, param2:Function)
      {
         super();
         this._3707 = param2;
         this._3607 = param1;
      }
      
      override public function run() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:BitmapData = null;
         var _loc5_:Vector.<BitmapData> = null;
         var _loc6_:Matrix = null;
         if(_3613 && _3613._3614 && Boolean(_3613._3614[this._3607]) && Boolean(_3613._3614[this._3607][_495.SINGLE_FLAG]) && Boolean(_3613._3614[this._3607][_495.SINGLE_FLAG][0]))
         {
            _loc1_ = _3613._3614[this._3607][_495.SINGLE_FLAG][0].bitmapData;
            if(_loc1_)
            {
               _loc2_ = _loc1_.width;
               _loc3_ = _loc1_.height;
               _loc2_ *= _3238.scale;
               _loc3_ *= _3238.scale;
               if(_loc2_ == 0 || _loc3_ == 0)
               {
                  _loc4_ = null;
               }
               else if(!_3238.hasBackground && _3238.scale == 1)
               {
                  _loc4_ = _loc1_;
               }
               else
               {
                  _loc4_ = new BitmapData(_loc2_,_loc3_,!_3238.hasBackground,_3238.hasBackground ? _3238.backgroundColor : 0);
                  _loc6_ = new Matrix();
                  _loc6_.scale(_3238.scale,_3238.scale);
                  _loc4_.draw(_loc1_,_loc6_);
               }
               _loc5_ = new Vector.<BitmapData>();
               _loc5_.push(_loc4_);
               if(this._3707 != null)
               {
                  this._3707(_loc5_);
               }
            }
         }
         complete();
      }
   }
}

