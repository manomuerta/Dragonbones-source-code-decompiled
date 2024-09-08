package _1045
{
   import _1088._1100;
   import flash.geom.Point;
   
   public class VSlider extends _1100
   {
      public function VSlider()
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
         var _loc4_:Number = track.layoutBoundsHeight - _2557.layoutBoundsHeight;
         return minimum + (_loc4_ != 0 ? (_loc4_ - param2) / _loc4_ * _loc3_ : 0);
      }
      
      override protected function _8035() : void
      {
         var _loc7_:Number = NaN;
         if(!_2557 || !track)
         {
            return;
         }
         var _loc1_:Number = _2557.layoutBoundsHeight;
         var _loc2_:Number = track.layoutBoundsHeight - _loc1_;
         var _loc3_:Number = maximum - minimum;
         var _loc4_:Number = _loc3_ > 0 ? _loc2_ - (_8050 - minimum) / _loc3_ * _loc2_ : 0;
         var _loc5_:Point = track.localToGlobal(new Point(0,_loc4_));
         var _loc6_:Number = _2557.parent.globalToLocal(_loc5_).y;
         _2557._7777(_2557.layoutBoundsX,Math.round(_loc6_));
         if(_8048 && _8049 && Boolean(_8049.parent))
         {
            _loc7_ = this._8049.parent.globalToLocal(_loc5_).y;
            _8049.y = Math.round(_loc7_ + _loc1_);
            _8049.height = Math.round(_loc2_ - _loc7_);
         }
      }
   }
}

