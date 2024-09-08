package com.codeazur.as3swf.data.actions.swf3
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   
   public class ActionGotoLabel extends Action implements IAction
   {
      public static const CODE:uint = 140;
      
      public var label:String;
      
      public function ActionGotoLabel(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
      }
      
      override public function parse(param1:SWFData) : void
      {
         this.label = param1.readString();
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:SWFData = new SWFData();
         _loc2_.writeString(this.label);
         write(param1,_loc2_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:ActionGotoLabel = new ActionGotoLabel(code,length,pos);
         _loc1_.label = this.label;
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[ActionGotoLabel] Label: " + this.label;
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         return _14975(param1) + "gotoLabel \"" + this.label + "\"";
      }
   }
}

