package _708
{
   import _73.DBEnumBase;
   
   public class _714 extends DBEnumBase
   {
      public static const PLAY:_714 = new _714("play");
      
      public static const STOP:_714 = new _714("stop");
      
      public function _714(param1:String)
      {
         super(param1);
      }
      
      public function change() : _714
      {
         return this == PLAY ? STOP : PLAY;
      }
   }
}

