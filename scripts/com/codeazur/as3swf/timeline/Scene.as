package com.codeazur.as3swf.timeline
{
   import com.codeazur.utils.StringUtils;
   
   public class Scene
   {
      public var frameNumber:uint = 0;
      
      public var name:String;
      
      public function Scene(param1:uint, param2:String)
      {
         super();
         this.frameNumber = param1;
         this.name = param2;
      }
      
      public function toString(param1:uint = 0) : String
      {
         return StringUtils.repeat(param1) + "Name: " + this.name + ", " + "Frame: " + this.frameNumber;
      }
   }
}

