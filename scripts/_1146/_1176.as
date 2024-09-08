package _1146
{
   import _1162._1166;
   
   public class _1176 extends _1153
   {
      public function _1176(param1:Object = null)
      {
         super(param1);
         _8757 = _1166;
      }
      
      override public function get _8310() : Number
      {
         var _loc3_:Number = NaN;
         var _loc4_:Effect = null;
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         while(_loc2_ < children.length)
         {
            _loc4_ = Effect(children[_loc2_]);
            if(_loc4_ is _1153)
            {
               _loc3_ = _1153(_loc4_)._8310;
            }
            else
            {
               _loc3_ = _loc4_.duration;
            }
            _loc3_ = _loc3_ * _loc4_.repeatCount + _loc4_.repeatDelay * (_loc4_.repeatCount - 1) + _loc4_.startDelay;
            _loc1_ = Math.max(_loc1_,_loc3_);
            _loc2_++;
         }
         return _loc1_;
      }
   }
}

