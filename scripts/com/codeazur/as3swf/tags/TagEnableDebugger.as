package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import flash.utils.ByteArray;
   
   public class TagEnableDebugger implements ITag
   {
      public static const TYPE:uint = 58;
      
      protected var _password:ByteArray;
      
      public function TagEnableDebugger()
      {
         super();
         this._password = new ByteArray();
      }
      
      public function get password() : ByteArray
      {
         return this._password;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         if(param2 > 0)
         {
            param1.readBytes(this._password,0,param2);
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,this._password.length);
         if(this._password.length > 0)
         {
            param1.writeBytes(this._password);
         }
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "EnableDebugger";
      }
      
      public function get version() : uint
      {
         return 5;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1);
      }
   }
}

