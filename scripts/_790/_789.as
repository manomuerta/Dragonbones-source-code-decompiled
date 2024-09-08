package _790
{
   public class _789
   {
      public static const INSIDE:_789 = new _789(1);
      
      public static const OUTSIDE:_789 = new _789(2);
      
      public static const MIDDLE:_789 = new _789(0);
      
      protected var _value:int = -999;
      
      public function _789(param1:int)
      {
         super();
         this._value = param1;
      }
      
      public function get value() : int
      {
         return this._value;
      }
   }
}

