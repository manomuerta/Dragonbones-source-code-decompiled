package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.data.consts.BitmapFormat;
   
   public class TagDefineBitsLossless2 extends TagDefineBitsLossless implements IDefinitionTag
   {
      public static const TYPE:uint = 36;
      
      public function TagDefineBitsLossless2()
      {
         super();
      }
      
      override public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineBitsLossless2 = new TagDefineBitsLossless2();
         _loc1_.characterId = characterId;
         _loc1_.bitmapFormat = bitmapFormat;
         _loc1_.bitmapWidth = bitmapWidth;
         _loc1_.bitmapHeight = bitmapHeight;
         if(_zlibBitmapData.length > 0)
         {
            _loc1_.zlibBitmapData.writeBytes(_zlibBitmapData);
         }
         return _loc1_;
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "DefineBitsLossless2";
      }
      
      override public function get version() : uint
      {
         return 3;
      }
      
      override public function get level() : uint
      {
         return 2;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "ID: " + characterId + ", " + "Format: " + BitmapFormat.toString(bitmapFormat) + ", " + "Size: (" + bitmapWidth + "," + bitmapHeight + ")";
      }
   }
}

