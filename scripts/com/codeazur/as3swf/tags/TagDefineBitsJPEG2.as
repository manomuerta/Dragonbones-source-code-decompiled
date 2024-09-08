package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.BitmapType;
   
   public class TagDefineBitsJPEG2 extends TagDefineBits implements IDefinitionTag
   {
      public static const TYPE:uint = 21;
      
      public function TagDefineBitsJPEG2()
      {
         super();
      }
      
      override public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         super.parse(param1,param2,param3);
         if(bitmapData[0] == 255 && (bitmapData[1] == 216 || bitmapData[1] == 217))
         {
            bitmapType = BitmapType.JPEG;
         }
         else if(bitmapData[0] == 137 && bitmapData[1] == 80 && bitmapData[2] == 78 && bitmapData[3] == 71 && bitmapData[4] == 13 && bitmapData[5] == 10 && bitmapData[6] == 26 && bitmapData[7] == 10)
         {
            bitmapType = BitmapType.PNG;
         }
         else if(bitmapData[0] == 71 && bitmapData[1] == 73 && bitmapData[2] == 70 && bitmapData[3] == 56 && bitmapData[4] == 57 && bitmapData[5] == 97)
         {
            bitmapType = BitmapType.GIF89A;
         }
      }
      
      override public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineBitsJPEG2 = new TagDefineBitsJPEG2();
         _loc1_.characterId = characterId;
         _loc1_.bitmapType = bitmapType;
         if(_bitmapData.length > 0)
         {
            _loc1_.bitmapData.writeBytes(_bitmapData);
         }
         return _loc1_;
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "DefineBitsJPEG2";
      }
      
      override public function get version() : uint
      {
         return bitmapType == BitmapType.JPEG ? 2 : 8;
      }
      
      override public function get level() : uint
      {
         return 2;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "ID: " + characterId + ", " + "Type: " + BitmapType.toString(bitmapType) + ", " + "BitmapLength: " + bitmapData.length;
      }
   }
}

