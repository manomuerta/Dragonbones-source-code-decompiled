package com.codeazur.as3swf.data
{
   public class SWFScene
   {
      public var offset:uint;
      
      public var name:String;
      
      public function SWFScene(param1:uint, param2:String)
      {
         super();
         this.offset = param1;
         this.name = param2;
      }
      
      public function toString() : String
      {
         return "Frame: " + this.offset + ", Name: " + this.name;
      }
   }
}

