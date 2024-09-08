package _14240
{
   import flash.display.Graphics;
   import flash.display.GraphicsPathCommand;
   import flash.utils.describeType;
   
   public class _14243
   {
      private static var _15497:Object = null;
      
      public function _14243()
      {
         super();
      }
      
      public static function get _15428() : Boolean
      {
         if(_15497 == null)
         {
            _15497 = _15496() && _15495();
         }
         return _15497;
      }
      
      private static function _15496() : Boolean
      {
         return describeType(Graphics)._2332.method.(@name == "cubicCurveTo").length() > 0;
      }
      
      private static function _15495() : Boolean
      {
         return "CUBIC_CURVE_TO" in GraphicsPathCommand;
      }
   }
}

