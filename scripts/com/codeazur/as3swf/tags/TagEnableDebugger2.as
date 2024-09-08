package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagEnableDebugger2 extends TagEnableDebugger implements ITag
   {
      public static const TYPE:uint = 64;
      
      protected var _reserved:uint = 0;
      
      public function TagEnableDebugger2()
      {
         super();
      }
      
      public function get reserved() : uint
      {
         return this._reserved;
      }
      
      override public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this._reserved = param1.readUI16();
         if(param2 > 2)
         {
            param1.readBytes(_password,0,param2 - 2);
         }
      }
      
      override public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,_password.length + 2);
         param1.writeUI16(this._reserved);
         if(_password.length > 0)
         {
            param1.writeBytes(_password);
         }
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "EnableDebugger2";
      }
      
      override public function get version() : uint
      {
         return 6;
      }
      
      override public function get level() : uint
      {
         return 2;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "Password: " + (!!_password.length ? "null" : _password.readUTF()) + ", " + "Reserved: 0x" + this._reserved.toString(16);
      }
   }
}

