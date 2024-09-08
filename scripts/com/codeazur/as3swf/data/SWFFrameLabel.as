package com.codeazur.as3swf.data
{
   public class SWFFrameLabel
   {
      public var frameNumber:uint;
      
      public var name:String;
      
      public function SWFFrameLabel(param1:uint, param2:String)
      {
         super();
         this.frameNumber = param1;
         this.name = param2;
      }
      
      public function toString() : String
      {
         return "Frame: " + this.frameNumber + ", Name: " + this.name;
      }
   }
}

