package com.codeazur.as3swf.data.actions.swf5
{
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   
   public class ActionDefineLocal extends Action implements IAction
   {
      public static const CODE:uint = 60;
      
      public function ActionDefineLocal(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[ActionDefineLocal]";
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         return _14975(param1) + "defineLocal";
      }
   }
}

