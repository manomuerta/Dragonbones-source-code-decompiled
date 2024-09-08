package _1045
{
   import _1088._1100;
   import flash.geom.Point;
   
   public class HSlider extends _1100
   {
      public function HSlider()
      {
         super();
      }
      
      override protected function _8045(param1:Number, param2:Number) : Number
      {
         if(!_2557 || !track)
         {
            return 0;
         }
         var _loc3_:Number = maximum - minimum;
         var _loc4_:Number = track.layoutBoundsWidth - _2557.layoutBoundsWidth;
         return minimum + (_loc4_ != 0 ? param1 / _loc4_ * _loc3_ : 0);
      }
      
      override protected function _8035() : void
      {
         var _loc6_:Number = NaN;
         if(!_2557 || !track)
         {
            return;
         }
         var _loc1_:Number = track.layoutBoundsWidth - _2557.layoutBoundsWidth;
         var _loc2_:Number = maximum - minimum;
         var _loc3_:Number = _loc2_ > 0 ? (_8050 - minimum) / _loc2_ * _loc1_ : 0;
         var _loc4_:Point = track.localToGlobal(new Point(_loc3_,0));
         var _loc5_:Number = _2557.parent.globalToLocal(_loc4_).x;
         _2557._7777(Math.round(_loc5_),_2557.layoutBoundsY);
         if(_8048 && _8049 && Boolean(_8049.parent))
         {
            _loc6_ = _8049.parent.globalToLocal(_loc4_).x - _loc3_;
            _8049.x = Math.round(_loc6_);
            _8049.width = Math.round(_loc3_);
         }
      }
   }
}

