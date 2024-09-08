package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagScriptLimits implements ITag
   {
      public static const TYPE:uint = 65;
      
      public var maxRecursionDepth:uint;
      
      public var scriptTimeoutSeconds:uint;
      
      public function TagScriptLimits()
      {
         super();
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this.maxRecursionDepth = param1.readUI16();
         this.scriptTimeoutSeconds = param1.readUI16();
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,4);
         param1.writeUI16(this.maxRecursionDepth);
         param1.writeUI16(this.scriptTimeoutSeconds);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "ScriptLimits";
      }
      
      public function get version() : uint
      {
         return 7;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "MaxRecursionDepth: " + this.maxRecursionDepth + ", " + "ScriptTimeoutSeconds: " + this.scriptTimeoutSeconds;
      }
   }
}

