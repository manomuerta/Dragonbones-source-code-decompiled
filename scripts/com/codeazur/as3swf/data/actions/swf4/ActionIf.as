package com.codeazur.as3swf.data.actions.swf4
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.*;
   
   public class ActionIf extends Action implements _14133
   {
      public static const CODE:uint = 157;
      
      protected var _14986:int;
      
      protected var _14987:int = -2;
      
      public function ActionIf(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
      }
      
      public function get branchOffset() : int
      {
         return this._14986;
      }
      
      public function set branchOffset(param1:int) : void
      {
         this._14986 = param1;
      }
      
      public function get _14977() : int
      {
         return this._14987;
      }
      
      public function set _14977(param1:int) : void
      {
         this._14987 = param1;
      }
      
      override public function parse(param1:SWFData) : void
      {
         this._14986 = param1.readSI16();
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:SWFData = new SWFData();
         _loc2_.writeSI16(this._14986);
         write(param1,_loc2_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:ActionIf = new ActionIf(code,length,pos);
         _loc1_.branchOffset = this._14986;
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc2_:* = " [";
         if(this._14987 >= 0)
         {
            _loc2_ += this._14987.toString();
         }
         else if(this._14987 == -1)
         {
            _loc2_ += "EOB";
         }
         else
         {
            _loc2_ += "???";
         }
         _loc2_ += "]";
         return "[ActionIf] BranchOffset: " + this.branchOffset + _loc2_;
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         var _loc3_:* = "";
         if(this._14987 >= 0)
         {
            _loc3_ += param2.actions[this._14987]._14982;
         }
         else if(this._14987 == -1)
         {
            _loc3_ += "L" + (param2._14978 + 1);
         }
         else
         {
            _loc3_ += "ILLEGAL BRANCH";
         }
         return _14975(param1) + "if " + _loc3_;
      }
   }
}

