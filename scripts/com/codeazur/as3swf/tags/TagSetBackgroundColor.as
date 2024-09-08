package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.utils.ColorUtils;
   
   public class TagSetBackgroundColor implements ITag
   {
      public static const TYPE:uint = 9;
      
      public var color:uint = 16777215;
      
      public function TagSetBackgroundColor()
      {
         super();
      }
      
      public static function create(param1:uint = 16777215) : TagSetBackgroundColor
      {
         var _loc2_:TagSetBackgroundColor = new TagSetBackgroundColor();
         _loc2_.color = param1;
         return _loc2_;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this.color = param1.readRGB();
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,3);
         param1.writeRGB(this.color);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "SetBackgroundColor";
      }
      
      public function get version() : uint
      {
         return 1;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "Color: " + ColorUtils.rgbToString(this.color);
      }
   }
}

