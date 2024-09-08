package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagFrameLabel implements ITag
   {
      public static const TYPE:uint = 43;
      
      public var frameName:String;
      
      public var namedAnchorFlag:Boolean;
      
      public function TagFrameLabel()
      {
         super();
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc5_:uint = param1.position;
         this.frameName = param1.readString();
         if(param1.position - _loc5_ < param2)
         {
            param1.readUI8();
            this.namedAnchorFlag = true;
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeString(this.frameName);
         if(this.namedAnchorFlag)
         {
            param1.writeUI8(1);
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "FrameLabel";
      }
      
      public function get version() : uint
      {
         return 3;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:* = "Name: " + this.frameName;
         if(this.namedAnchorFlag)
         {
            _loc3_ += ", NamedAnchor = true";
         }
         return Tag.toStringCommon(this.type,this.name,param1) + _loc3_;
      }
   }
}

