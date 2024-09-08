package com.codeazur.as3swf.data.actions.swf3
{
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   
   public class ActionPlay extends Action implements IAction
   {
      public static const CODE:uint = 6;
      
      public function ActionPlay(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[ActionPlay]";
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         return _14975(param1) + "play";
      }
   }
}

