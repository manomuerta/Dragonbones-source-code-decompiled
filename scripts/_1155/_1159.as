package _1155
{
   public class _1159 extends _1156
   {
      public function _1159(param1:Number = 0.5)
      {
         super(param1);
      }
      
      override protected function easeIn(param1:Number) : Number
      {
         return 1 - Math.cos(param1 * Math.PI / 2);
      }
      
      override protected function easeOut(param1:Number) : Number
      {
         return Math.sin(param1 * Math.PI / 2);
      }
   }
}

