package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagCSMTextSettings implements ITag
   {
      public static const TYPE:uint = 74;
      
      public var textId:uint;
      
      public var useFlashType:uint;
      
      public var gridFit:uint;
      
      public var thickness:Number;
      
      public var sharpness:Number;
      
      public function TagCSMTextSettings()
      {
         super();
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this.textId = param1.readUI16();
         this.useFlashType = param1.readUB(2);
         this.gridFit = param1.readUB(3);
         param1.readUB(3);
         this.thickness = param1.readFIXED();
         this.sharpness = param1.readFIXED();
         param1.readUI8();
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,12);
         param1.writeUI16(this.textId);
         param1.writeUB(2,this.useFlashType);
         param1.writeUB(3,this.gridFit);
         param1.writeUB(3,0);
         param1.writeFIXED(this.thickness);
         param1.writeFIXED(this.sharpness);
         param1.writeUI8(0);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "CSMTextSettings";
      }
      
      public function get version() : uint
      {
         return 8;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "TextID: " + this.textId + ", " + "UseFlashType: " + this.useFlashType + ", " + "GridFit: " + this.gridFit + ", " + "Thickness: " + this.thickness + ", " + "Sharpness: " + this.sharpness;
      }
   }
}

