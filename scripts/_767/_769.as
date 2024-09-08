package _767
{
   import _1331.Crypto;
   import _1404._1407;
   import _648._12463;
   import com.hurlant.util.Base64;
   import flash.desktop.NativeApplication;
   import flash.utils.ByteArray;
   
   public class _769 extends _766
   {
      public static const SERVER_URL:String = "http://tools.log.egret.com/toolsBug.php";
      
      public function _769(param1:int, param2:String, param3:String = null, param4:ByteArray = null, param5:String = null, param6:ByteArray = null, param7:String = null, param8:String = null, param9:String = null, param10:String = null, param11:String = null)
      {
         this._12594 = _1407.getInstance(_12463);
         super();
         serverURL = SERVER_URL;
         var _loc12_:Object;
         (_loc12_ = {}).toolsId = Crypto._5963(NativeApplication.nativeApplication.applicationID);
         _loc12_._5964 = Crypto._5963(this._12594.uid);
         _loc12_.randStr = Crypto._5963(this._12594._12691);
         _loc12_.type = Crypto._5963(param1.toString());
         _loc12_.desc = Crypto._5963(param2);
         if(param3)
         {
            _loc12_.projectName = Crypto._5963(param3);
         }
         if(param4)
         {
            _loc12_.projectContent = com.hurlant.util.Base64.encodeByteArray(param4);
         }
         if(param5)
         {
            _loc12_.attachmentExtension = Crypto._5963(param5);
         }
         if(param6)
         {
            _loc12_.attachmentContent = com.hurlant.util.Base64.encodeByteArray(param6);
         }
         if(param7)
         {
            _loc12_.userName = Crypto._5963(param7);
         }
         if(param8)
         {
            _loc12_.mobile = Crypto._5963(param8);
         }
         if(param9)
         {
            _loc12_.qq = Crypto._5963(param9);
         }
         if(param10)
         {
            _loc12_.weinxin = Crypto._5963(param10);
         }
         if(param11)
         {
            _loc12_.email = Crypto._5963(param11);
         }
         _data = _loc12_;
      }
   }
}

