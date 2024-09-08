package com.codeazur.as3swf.data.actions.swf4
{
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   
   public class ActionMBCharToAscii extends Action implements IAction
   {
      public static const CODE:uint = 54;
      
      public function ActionMBCharToAscii(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[ActionMBCharToAscii]";
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         return _14975(param1) + "mbCharToAscii";
      }
   }
}

