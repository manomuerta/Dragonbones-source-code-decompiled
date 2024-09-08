package _767
{
   import _1331.Crypto;
   import _1404._1407;
   import _648._12463;
   import com.hurlant.util.Base64;
   import flash.desktop.NativeApplication;
   
   public class _768 extends _766
   {
      public static const SERVER_URL:String = "http://tools.log.egret.com/toolsLog.php";
      
      public function _768(param1:String)
      {
         this._12594 = _1407.getInstance(_12463);
         super();
         serverURL = SERVER_URL;
         var _loc2_:Object = {};
         _loc2_.toolsId = Crypto._5963(NativeApplication.nativeApplication.applicationID);
         _loc2_._5964 = Crypto._5963(this._12594.uid);
         _loc2_.randStr = Crypto._5963(this._12594._12691);
         _loc2_.log = com.hurlant.util.Base64.encode(param1);
         _data = _loc2_;
      }
   }
}

