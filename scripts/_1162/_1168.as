package _1162
{
   import flash.display.DisplayObject;
   import flash.geom.Point;
   
   public class _1168
   {
      private static var _8889:Point;
      
      public function _1168()
      {
         super();
      }
      
      public static function _8868(param1:DisplayObject, param2:Point, param3:Point = null, param4:Number = NaN, param5:Number = NaN, param6:Number = NaN) : void
      {
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         if(param3 == null && param2 != null)
         {
            if(_8889 == null)
            {
               _8889 = new Point();
            }
            _8889.x = param2.x;
            _8889.y = param2.y;
            _loc7_ = _8864(param1,_8889);
         }
         if(!isNaN(param6))
         {
            param1.rotation = param6;
         }
         if(!isNaN(param4))
         {
            param1.scaleX = param4;
         }
         if(!isNaN(param5))
         {
            param1.scaleY = param5;
         }
         if(param2 == null)
         {
            if(param3 != null)
            {
               param1.x = param3.x;
               param1.y = param3.y;
            }
         }
         else
         {
            if(_8889 == null)
            {
               _8889 = new Point();
            }
            _8889.x = param2.x;
            _8889.y = param2.y;
            _loc8_ = _8864(param1,_8889);
            if(param3 != null)
            {
               param1.x += param3.x - _loc8_.x;
               param1.y += param3.y - _loc8_.y;
            }
            else
            {
               param1.x += _loc7_.x - _loc8_.x;
               param1.y += _loc7_.y - _loc8_.y;
            }
         }
      }
      
      public static function _8864(param1:DisplayObject, param2:Point = null) : Point
      {
         if(_8889 == null)
         {
            _8889 = new Point();
         }
         if(param2)
         {
            _8889.x = param2.x;
            _8889.y = param2.y;
         }
         else
         {
            _8889.x = 0;
            _8889.y = 0;
         }
         if(param1.transform.matrix != null)
         {
            return param1.transform.matrix.transformPoint(_8889);
         }
         return new Point(_8889.x,_8889.y);
      }
   }
}

