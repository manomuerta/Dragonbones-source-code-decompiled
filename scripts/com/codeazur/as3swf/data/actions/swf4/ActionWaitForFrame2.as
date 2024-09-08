package com.codeazur.as3swf.data.actions.swf4
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   
   public class ActionWaitForFrame2 extends Action implements IAction
   {
      public static const CODE:uint = 141;
      
      public var skipCount:uint;
      
      public function ActionWaitForFrame2(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
      }
      
      override public function parse(param1:SWFData) : void
      {
         this.skipCount = param1.readUI8();
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:SWFData = new SWFData();
         _loc2_.writeUI8(this.skipCount);
         write(param1,_loc2_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:ActionWaitForFrame2 = new ActionWaitForFrame2(code,length,pos);
         _loc1_.skipCount = this.skipCount;
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[ActionWaitForFrame2] SkipCount: " + this.skipCount;
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         return _14975(param1) + "waitForFrame2 (" + this.skipCount + ")";
      }
   }
}

