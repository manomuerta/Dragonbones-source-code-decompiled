package com.codeazur.as3swf.data.actions.swf4
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   
   public class ActionGotoFrame2 extends Action implements IAction
   {
      public static const CODE:uint = 159;
      
      public var sceneBiasFlag:Boolean;
      
      public var playFlag:Boolean;
      
      public var sceneBias:uint;
      
      public function ActionGotoFrame2(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
      }
      
      override public function parse(param1:SWFData) : void
      {
         var _loc2_:uint = param1.readUI8();
         this.sceneBiasFlag = (_loc2_ & 2) != 0;
         this.playFlag = (_loc2_ & 1) != 0;
         if(this.sceneBiasFlag)
         {
            this.sceneBias = param1.readUI16();
         }
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:SWFData = new SWFData();
         var _loc3_:uint = 0;
         if(this.sceneBiasFlag)
         {
            _loc3_ |= 2;
         }
         if(this.playFlag)
         {
            _loc3_ |= 1;
         }
         _loc2_.writeUI8(_loc3_);
         if(this.sceneBiasFlag)
         {
            _loc2_.writeUI16(this.sceneBias);
         }
         write(param1,_loc2_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:ActionGotoFrame2 = new ActionGotoFrame2(code,length,pos);
         _loc1_.sceneBiasFlag = this.sceneBiasFlag;
         _loc1_.playFlag = this.playFlag;
         _loc1_.sceneBias = this.sceneBias;
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc2_:* = "[ActionGotoFrame2] " + "PlayFlag: " + this.playFlag + ", ";
         "SceneBiasFlag: " + this.sceneBiasFlag;
         if(this.sceneBiasFlag)
         {
            _loc2_ += ", " + this.sceneBias;
         }
         return _loc2_;
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         return _14975(param1) + "gotoFrame2 (" + (this.playFlag == 0 ? "gotoAndStop" : "gotoAndPlay") + (this.sceneBiasFlag == 1 ? ", sceneBias: " + this.sceneBias : "") + ")";
      }
   }
}

