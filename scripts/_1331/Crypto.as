package _1331
{
   import com.hurlant.crypto.rsa.RSAKey;
   import com.hurlant.util.Base64;
   import com.lia.crypto.AES;
   import flash.utils.ByteArray;
   
   public class Crypto
   {
      private static var _5970:RSAKey;
      
      private static var _5969:RSAKey;
      
      private static const AES_KEY:String = "336ac2ae08c23bff9b814bbc651d9e1d";
      
      private static const RSA_M:String = "C4A7072263B8EAE277DE867E4984CCEB87" + "C8F0652C14322C8393A7FE25C649153FBE5929ADACFD935A53FB43E0B615" + "604AEAAFA4281EA15A3D5B18884A2BE8F230F213553C1755F4DFAA3E3AB" + "B5FCFCADC0EEA8A0F5E23C9C221CB88F2111C14FFD2B0D7982D57A726B0" + "8BDFB1FCDE4559D15E30339C7F8F6B095765852B476B";
      
      private static const RSA_E:String = "10001";
      
      public function Crypto()
      {
         super();
      }
      
      public static function _5966(param1:String) : String
      {
         if(!param1)
         {
            return "";
         }
         return AES.encrypt(param1,AES_KEY,AES.BIT_KEY_256);
      }
      
      public static function _5967(param1:String) : String
      {
         if(!param1)
         {
            return "";
         }
         return AES.decrypt(param1,AES_KEY,AES.BIT_KEY_256);
      }
      
      public static function _5963(param1:String) : String
      {
         var _loc7_:ByteArray = null;
         var _loc8_:int = 0;
         if(!param1)
         {
            return "";
         }
         if(!_5970)
         {
            _5970 = RSAKey.parsePublicKey(RSA_M,RSA_E);
         }
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTFBytes(param1);
         var _loc3_:ByteArray = new ByteArray();
         var _loc4_:int = Math.ceil(_loc2_.length / 117);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = new ByteArray();
            _loc8_ = 117;
            _loc2_.position = _loc5_ * 117;
            if(_loc5_ == _loc4_ - 1)
            {
               _loc2_.readBytes(_loc7_,0);
            }
            else
            {
               _loc2_.readBytes(_loc7_,0,117);
            }
            _5970.encrypt(_loc7_,_loc3_,_loc7_.length);
            _loc5_++;
         }
         var _loc6_:String = Base64.encodeByteArray(_loc3_);
         return (_loc6_ = _loc6_.split("+").join("-")).split("/").join("_");
      }
      
      public static function _5968(param1:String) : String
      {
         if(!param1)
         {
            return "";
         }
         return param1;
      }
   }
}

