package com.codeazur.as3swf.data.actions.swf4
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   
   public class ActionGetURL2 extends Action implements IAction
   {
      public static const CODE:uint = 154;
      
      public var sendVarsMethod:uint;
      
      public var reserved:uint;
      
      public var loadTargetFlag:Boolean;
      
      public var loadVariablesFlag:Boolean;
      
      public function ActionGetURL2(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
      }
      
      override public function parse(param1:SWFData) : void
      {
         this.sendVarsMethod = param1.readUB(2);
         this.reserved = param1.readUB(4);
         this.loadTargetFlag = param1.readUB(1) == 1;
         this.loadVariablesFlag = param1.readUB(1) == 1;
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:SWFData = new SWFData();
         _loc2_.writeUB(2,this.sendVarsMethod);
         _loc2_.writeUB(4,this.reserved);
         _loc2_.writeUB(1,this.loadTargetFlag ? 1 : 0);
         _loc2_.writeUB(1,this.loadVariablesFlag ? 1 : 0);
         write(param1,_loc2_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:ActionGetURL2 = new ActionGetURL2(code,length,pos);
         _loc1_.sendVarsMethod = this.sendVarsMethod;
         _loc1_.reserved = this.reserved;
         _loc1_.loadTargetFlag = this.loadTargetFlag;
         _loc1_.loadVariablesFlag = this.loadVariablesFlag;
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[ActionGetURL2] " + "SendVarsMethod: " + this.sendVarsMethod + " (" + this.sendVarsMethodToString() + "), " + "Reserved: " + this.reserved + ", " + "LoadTargetFlag: " + this.loadTargetFlag + ", " + "LoadVariablesFlag: " + this.loadVariablesFlag;
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         return _14975(param1) + "getUrl2 (method: " + this.sendVarsMethodToString() + ", target: " + (this.loadTargetFlag == 0 ? "window" : "sprite") + ", variables: " + (this.loadVariablesFlag == 0 ? "no" : "yes") + ")";
      }
      
      public function sendVarsMethodToString() : String
      {
         if(!this.sendVarsMethod)
         {
            return "None";
         }
         if(this.sendVarsMethod == 1)
         {
            return "GET";
         }
         if(this.sendVarsMethod == 2)
         {
            return "POST";
         }
         throw new Error("sendVarsMethod is only defined for values of 0, 1, and 2.");
      }
   }
}

