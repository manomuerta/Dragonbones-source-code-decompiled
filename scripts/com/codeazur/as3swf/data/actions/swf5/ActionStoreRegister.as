package com.codeazur.as3swf.data.actions.swf5
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   
   public class ActionStoreRegister extends Action implements IAction
   {
      public static const CODE:uint = 135;
      
      public var registerNumber:uint;
      
      public function ActionStoreRegister(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
      }
      
      override public function parse(param1:SWFData) : void
      {
         this.registerNumber = param1.readUI8();
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:SWFData = new SWFData();
         _loc2_.writeUI8(this.registerNumber);
         write(param1,_loc2_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:ActionStoreRegister = new ActionStoreRegister(code,length,pos);
         _loc1_.registerNumber = this.registerNumber;
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[ActionStoreRegister] RegisterNumber: " + this.registerNumber;
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         return _14975(param1) + "store $" + this.registerNumber;
      }
   }
}

