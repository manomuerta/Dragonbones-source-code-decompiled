package com.codeazur.as3swf.data.actions
{
   import com.codeazur.as3swf.SWFData;
   
   public class ActionUnknown extends Action implements IAction
   {
      public function ActionUnknown(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
      }
      
      override public function parse(param1:SWFData) : void
      {
         if(_length > 0)
         {
            param1.skipBytes(_length);
         }
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[????] Code: " + _code.toString(16) + ", Length: " + _length;
      }
   }
}

