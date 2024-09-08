package com.codeazur.as3swf.data.actions.swf6
{
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   
   public class ActionStringGreater extends Action implements IAction
   {
      public static const CODE:uint = 104;
      
      public function ActionStringGreater(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[ActionStringGreater]";
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         return _14975(param1) + "stringGreater";
      }
   }
}

