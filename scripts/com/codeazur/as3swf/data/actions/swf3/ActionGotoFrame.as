package com.codeazur.as3swf.data.actions.swf3
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   
   public class ActionGotoFrame extends Action implements IAction
   {
      public static const CODE:uint = 129;
      
      public var frame:uint;
      
      public function ActionGotoFrame(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
      }
      
      override public function parse(param1:SWFData) : void
      {
         this.frame = param1.readUI16();
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:SWFData = new SWFData();
         _loc2_.writeUI16(this.frame);
         write(param1,_loc2_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:ActionGotoFrame = new ActionGotoFrame(code,length,pos);
         _loc1_.frame = this.frame;
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[ActionGotoFrame] Frame: " + this.frame;
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         return _14975(param1) + "gotoFrame " + this.frame;
      }
   }
}

