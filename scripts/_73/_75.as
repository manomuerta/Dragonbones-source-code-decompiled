package _73
{
   import egret.utils.tr;
   
   public class _75 extends DBEnumBase
   {
      public static const DISPATCH_EVENT:_75 = new _75("event");
      
      public static const GOTO_AND_PLAY:_75 = new _75("action");
      
      public static const SOUND:_75 = new _75("sound");
      
      public function _75(param1:String)
      {
         super(param1);
      }
      
      public function _2131() : String
      {
         return tr("Property.action." + toString());
      }
   }
}

