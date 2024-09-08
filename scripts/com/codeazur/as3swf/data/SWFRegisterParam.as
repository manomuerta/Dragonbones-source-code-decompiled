package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFRegisterParam
   {
      public var register:uint;
      
      public var name:String;
      
      public function SWFRegisterParam(param1:SWFData = null)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      public function parse(param1:SWFData) : void
      {
         this.register = param1.readUI8();
         this.name = param1.readString();
      }
      
      public function publish(param1:SWFData) : void
      {
         param1.writeUI8(this.register);
         param1.writeString(this.name);
      }
      
      public function toString() : String
      {
         return "$" + this.register + ":" + this.name;
      }
   }
}

