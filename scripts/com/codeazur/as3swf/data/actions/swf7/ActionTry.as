package com.codeazur.as3swf.data.actions.swf7
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.*;
   import com.codeazur.utils.StringUtils;
   
   public class ActionTry extends Action implements IAction
   {
      public static const CODE:uint = 143;
      
      public var catchInRegisterFlag:Boolean;
      
      public var finallyBlockFlag:Boolean;
      
      public var catchBlockFlag:Boolean;
      
      public var catchName:String;
      
      public var catchRegister:uint;
      
      public var tryBody:Vector.<IAction>;
      
      public var catchBody:Vector.<IAction>;
      
      public var finallyBody:Vector.<IAction>;
      
      protected var _14991:uint;
      
      protected var _14990:uint;
      
      protected var _14989:uint;
      
      public function ActionTry(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
         this.tryBody = new Vector.<IAction>();
         this.catchBody = new Vector.<IAction>();
         this.finallyBody = new Vector.<IAction>();
         this._14991 = 0;
         this._14990 = 0;
         this._14989 = 0;
      }
      
      override public function parse(param1:SWFData) : void
      {
         var _loc2_:uint = param1.readUI8();
         this.catchInRegisterFlag = (_loc2_ & 4) != 0;
         this.finallyBlockFlag = (_loc2_ & 2) != 0;
         this.catchBlockFlag = (_loc2_ & 1) != 0;
         var _loc3_:uint = param1.readUI16();
         var _loc4_:uint = param1.readUI16();
         var _loc5_:uint = param1.readUI16();
         if(this.catchInRegisterFlag)
         {
            this.catchRegister = param1.readUI8();
         }
         else
         {
            this.catchName = param1.readString();
         }
         var _loc6_:uint = param1.position + _loc3_;
         while(param1.position < _loc6_)
         {
            this.tryBody.push(param1.readACTIONRECORD());
         }
         var _loc7_:uint = param1.position + _loc4_;
         while(param1.position < _loc7_)
         {
            this.catchBody.push(param1.readACTIONRECORD());
         }
         var _loc8_:uint = param1.position + _loc5_;
         while(param1.position < _loc8_)
         {
            this.finallyBody.push(param1.readACTIONRECORD());
         }
         this._14991 = Action._14976(this.tryBody);
         this._14990 = Action._14976(this.catchBody);
         this._14989 = Action._14976(this.finallyBody);
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:SWFData = new SWFData();
         var _loc4_:uint = 0;
         if(this.catchInRegisterFlag)
         {
            _loc4_ |= 4;
         }
         if(this.finallyBlockFlag)
         {
            _loc4_ |= 2;
         }
         if(this.catchBlockFlag)
         {
            _loc4_ |= 1;
         }
         _loc3_.writeUI8(_loc4_);
         var _loc5_:SWFData = new SWFData();
         _loc2_ = 0;
         while(_loc2_ < this.tryBody.length)
         {
            _loc5_.writeACTIONRECORD(this.tryBody[_loc2_]);
            _loc2_++;
         }
         var _loc6_:SWFData = new SWFData();
         _loc2_ = 0;
         while(_loc2_ < this.catchBody.length)
         {
            _loc6_.writeACTIONRECORD(this.catchBody[_loc2_]);
            _loc2_++;
         }
         var _loc7_:SWFData = new SWFData();
         _loc2_ = 0;
         while(_loc2_ < this.finallyBody.length)
         {
            _loc7_.writeACTIONRECORD(this.finallyBody[_loc2_]);
            _loc2_++;
         }
         _loc3_.writeUI16(_loc5_.length);
         _loc3_.writeUI16(_loc6_.length);
         _loc3_.writeUI16(_loc7_.length);
         if(this.catchInRegisterFlag)
         {
            _loc3_.writeUI8(this.catchRegister);
         }
         else
         {
            _loc3_.writeString(this.catchName);
         }
         _loc3_.writeBytes(_loc5_);
         _loc3_.writeBytes(_loc6_);
         _loc3_.writeBytes(_loc7_);
         write(param1,_loc3_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:uint = 0;
         var _loc2_:ActionTry = new ActionTry(code,length,pos);
         _loc2_.catchInRegisterFlag = this.catchInRegisterFlag;
         _loc2_.finallyBlockFlag = this.finallyBlockFlag;
         _loc2_.catchBlockFlag = this.catchBlockFlag;
         _loc2_.catchName = this.catchName;
         _loc2_.catchRegister = this.catchRegister;
         _loc1_ = 0;
         while(_loc1_ < this.tryBody.length)
         {
            _loc2_.tryBody.push(this.tryBody[_loc1_].clone());
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.catchBody.length)
         {
            _loc2_.catchBody.push(this.catchBody[_loc1_].clone());
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.finallyBody.length)
         {
            _loc2_.finallyBody.push(this.finallyBody[_loc1_].clone());
            _loc1_++;
         }
         return _loc2_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc3_:uint = 0;
         var _loc2_:String = "[ActionTry] ";
         _loc2_ += this.catchInRegisterFlag ? "Register: " + this.catchRegister : "Name: " + this.catchName;
         if(this.tryBody.length)
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 2) + "Try:";
            _loc3_ = 0;
            while(_loc3_ < this.tryBody.length)
            {
               _loc2_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc3_ + "] " + this.tryBody[_loc3_].toString(param1 + 4);
               _loc3_++;
            }
         }
         if(this.catchBody.length)
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 2) + "Catch:";
            _loc3_ = 0;
            while(_loc3_ < this.catchBody.length)
            {
               _loc2_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc3_ + "] " + this.catchBody[_loc3_].toString(param1 + 4);
               _loc3_++;
            }
         }
         if(this.finallyBody.length)
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 2) + "Finally:";
            _loc3_ = 0;
            while(_loc3_ < this.finallyBody.length)
            {
               _loc2_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc3_ + "] " + this.finallyBody[_loc3_].toString(param1 + 4);
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         var _loc5_:uint = 0;
         var _loc6_:_14132 = null;
         var _loc7_:_14132 = null;
         var _loc8_:_14132 = null;
         var _loc3_:String = !!_14982 ? _14982 + ":\n" : "";
         var _loc4_:String = "";
         if(this.tryBody.length)
         {
            _loc3_ += _loc4_ + StringUtils.repeat(param1 + 2) + "try {";
            _loc6_ = new _14132(this.tryBody,param2._14985.concat(),this._14991);
            _loc5_ = 0;
            while(_loc5_ < this.tryBody.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + this.tryBody[_loc5_]._14979(param1 + 4,_loc6_);
               _loc5_++;
            }
            if(_loc6_._14983 != null)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + _loc6_._14983 + ":";
            }
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "}";
            _loc4_ = "\n";
         }
         if(this.catchBody.length)
         {
            _loc3_ += _loc4_ + StringUtils.repeat(param1 + 2) + "catch(" + (this.catchInRegisterFlag ? "$" + this.catchRegister : this.catchName) + ") {";
            _loc7_ = new _14132(this.catchBody,param2._14985.concat(),this._14990);
            _loc5_ = 0;
            while(_loc5_ < this.catchBody.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + this.catchBody[_loc5_]._14979(param1 + 4,_loc7_);
               _loc5_++;
            }
            if(_loc7_._14983 != null)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + _loc7_._14983 + ":";
            }
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "}";
            _loc4_ = "\n";
         }
         if(this.finallyBody.length)
         {
            _loc3_ += _loc4_ + StringUtils.repeat(param1 + 2) + "finally {";
            _loc8_ = new _14132(this.finallyBody,param2._14985.concat(),this._14989);
            _loc5_ = 0;
            while(_loc5_ < this.finallyBody.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + this.finallyBody[_loc5_]._14979(param1 + 4,_loc8_);
               _loc5_++;
            }
            if(_loc8_._14983 != null)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + _loc8_._14983 + ":";
            }
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "}";
         }
         return _loc3_;
      }
   }
}

