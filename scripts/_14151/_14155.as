package _14151
{
   import _14157._14156;
   import com.codeazur.as3swf.SWFData;
   import flash.utils.ByteArray;
   
   public class _14155 implements _14153
   {
      private var soundFormat:_14156;
      
      public function _14155(param1:_14156)
      {
         super();
         this.soundFormat = param1;
      }
      
      public function decode(param1:ByteArray) : SWFData
      {
         var _loc2_:SWFData = new SWFData();
         _loc2_.writeBytes(param1);
         return _loc2_;
      }
   }
}

