package _1315
{
   import _1302._1306;
   import flash.display.BitmapData;
   import flash.display.PNGEncoderOptions;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class _1319 implements _1306
   {
      private var _9175:PNGEncoderOptions;
      
      public function _1319(param1:Boolean = false)
      {
         super();
         this._9175 = new PNGEncoderOptions(param1);
      }
      
      public function get _9108() : String
      {
         return "png";
      }
      
      public function encode(param1:BitmapData) : ByteArray
      {
         return param1.encode(new Rectangle(0,0,param1.width,param1.height),new PNGEncoderOptions(true));
      }
   }
}

