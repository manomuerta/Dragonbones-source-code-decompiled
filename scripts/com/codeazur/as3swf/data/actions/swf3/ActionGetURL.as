package com.codeazur.as3swf.data.actions.swf3
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   
   public class ActionGetURL extends Action implements IAction
   {
      public static const CODE:uint = 131;
      
      public var urlString:String;
      
      public var targetString:String;
      
      public function ActionGetURL(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
      }
      
      override public function parse(param1:SWFData) : void
      {
         this.urlString = param1.readString();
         this.targetString = param1.readString();
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:SWFData = new SWFData();
         _loc2_.writeString(this.urlString);
         _loc2_.writeString(this.targetString);
         write(param1,_loc2_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:ActionGetURL = new ActionGetURL(code,length,pos);
         _loc1_.urlString = this.urlString;
         _loc1_.targetString = this.targetString;
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[ActionGetURL] URL: " + this.urlString + ", Target: " + this.targetString;
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         return _14975(param1) + "getURL \"" + this.urlString + "\", \"" + this.targetString + "\"";
      }
   }
}

