package com.codeazur.as3swf.data.actions.swf5
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   import com.codeazur.utils.StringUtils;
   
   public class ActionDefineFunction extends Action implements IAction
   {
      public static const CODE:uint = 155;
      
      public var functionName:String;
      
      public var functionParams:Vector.<String>;
      
      public var functionBody:Vector.<IAction>;
      
      protected var _14978:uint;
      
      public function ActionDefineFunction(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
         this.functionParams = new Vector.<String>();
         this.functionBody = new Vector.<IAction>();
         this._14978 = 0;
      }
      
      override public function parse(param1:SWFData) : void
      {
         this.functionName = param1.readString();
         var _loc2_:uint = param1.readUI16();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            this.functionParams.push(param1.readString());
            _loc3_++;
         }
         var _loc4_:uint = param1.readUI16();
         var _loc5_:uint = param1.position + _loc4_;
         while(param1.position < _loc5_)
         {
            this.functionBody.push(param1.readACTIONRECORD());
         }
         this._14978 = Action._14976(this.functionBody);
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeString(this.functionName);
         _loc3_.writeUI16(this.functionParams.length);
         _loc2_ = 0;
         while(_loc2_ < this.functionParams.length)
         {
            _loc3_.writeString(this.functionParams[_loc2_]);
            _loc2_++;
         }
         var _loc4_:SWFData = new SWFData();
         _loc2_ = 0;
         while(_loc2_ < this.functionBody.length)
         {
            _loc4_.writeACTIONRECORD(this.functionBody[_loc2_]);
            _loc2_++;
         }
         _loc3_.writeUI16(_loc4_.length);
         write(param1,_loc3_);
         param1.writeBytes(_loc4_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:uint = 0;
         var _loc2_:ActionDefineFunction = new ActionDefineFunction(code,length,pos);
         _loc2_.functionName = this.functionName;
         _loc1_ = 0;
         while(_loc1_ < this.functionParams.length)
         {
            _loc2_.functionParams.push(this.functionParams[_loc1_]);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.functionBody.length)
         {
            _loc2_.functionBody.push(this.functionBody[_loc1_].clone());
            _loc1_++;
         }
         return _loc2_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc2_:* = "[ActionDefineFunction] " + (this.functionName == null || this.functionName.length == 0 ? "<anonymous>" : this.functionName) + "(" + this.functionParams.join(", ") + ")";
         var _loc3_:uint = 0;
         while(_loc3_ < this.functionBody.length)
         {
            if(this.functionBody[_loc3_])
            {
               _loc2_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc3_ + "] " + this.functionBody[_loc3_].toString(param1 + 4);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         var _loc3_:* = _14975(param1) + "defineFunction " + (this.functionName == null || this.functionName.length == 0 ? "" : this.functionName) + "(" + this.functionParams.join(", ") + ") {";
         param2 = new _14132(this.functionBody,param2._14985.concat(),this._14978);
         var _loc4_:uint = 0;
         while(_loc4_ < this.functionBody.length)
         {
            if(this.functionBody[_loc4_])
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + this.functionBody[_loc4_]._14979(param1 + 4,param2);
            }
            _loc4_++;
         }
         if(param2._14983 != null)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + param2._14983 + ":";
         }
         return _loc3_ + ("\n" + StringUtils.repeat(param1 + 2) + "}");
      }
   }
}

