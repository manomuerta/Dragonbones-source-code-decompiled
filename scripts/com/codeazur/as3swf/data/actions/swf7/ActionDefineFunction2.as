package com.codeazur.as3swf.data.actions.swf7
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFRegisterParam;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   import com.codeazur.utils.StringUtils;
   
   public class ActionDefineFunction2 extends Action implements IAction
   {
      public static const CODE:uint = 142;
      
      public var functionName:String;
      
      public var functionParams:Vector.<SWFRegisterParam>;
      
      public var functionBody:Vector.<IAction>;
      
      public var registerCount:uint;
      
      public var preloadParent:Boolean;
      
      public var preloadRoot:Boolean;
      
      public var preloadSuper:Boolean;
      
      public var preloadArguments:Boolean;
      
      public var preloadThis:Boolean;
      
      public var preloadGlobal:Boolean;
      
      public var suppressSuper:Boolean;
      
      public var suppressArguments:Boolean;
      
      public var suppressThis:Boolean;
      
      protected var _14978:uint;
      
      public function ActionDefineFunction2(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
         this.functionParams = new Vector.<SWFRegisterParam>();
         this.functionBody = new Vector.<IAction>();
         this._14978 = 0;
      }
      
      override public function parse(param1:SWFData) : void
      {
         this.functionName = param1.readString();
         var _loc2_:uint = param1.readUI16();
         this.registerCount = param1.readUI8();
         var _loc3_:uint = param1.readUI8();
         this.preloadParent = (_loc3_ & 0x80) != 0;
         this.preloadRoot = (_loc3_ & 0x40) != 0;
         this.suppressSuper = (_loc3_ & 0x20) != 0;
         this.preloadSuper = (_loc3_ & 0x10) != 0;
         this.suppressArguments = (_loc3_ & 8) != 0;
         this.preloadArguments = (_loc3_ & 4) != 0;
         this.suppressThis = (_loc3_ & 2) != 0;
         this.preloadThis = (_loc3_ & 1) != 0;
         var _loc4_:uint = param1.readUI8();
         this.preloadGlobal = (_loc4_ & 1) != 0;
         var _loc5_:uint = 0;
         while(_loc5_ < _loc2_)
         {
            this.functionParams.push(param1.readREGISTERPARAM());
            _loc5_++;
         }
         var _loc6_:uint = param1.readUI16();
         var _loc7_:uint = param1.position + _loc6_;
         while(param1.position < _loc7_)
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
         _loc3_.writeUI8(this.registerCount);
         var _loc4_:uint = 0;
         if(this.preloadParent)
         {
            _loc4_ |= 128;
         }
         if(this.preloadRoot)
         {
            _loc4_ |= 64;
         }
         if(this.suppressSuper)
         {
            _loc4_ |= 32;
         }
         if(this.preloadSuper)
         {
            _loc4_ |= 16;
         }
         if(this.suppressArguments)
         {
            _loc4_ |= 8;
         }
         if(this.preloadArguments)
         {
            _loc4_ |= 4;
         }
         if(this.suppressThis)
         {
            _loc4_ |= 2;
         }
         if(this.preloadThis)
         {
            _loc4_ |= 1;
         }
         _loc3_.writeUI8(_loc4_);
         var _loc5_:uint = 0;
         if(this.preloadGlobal)
         {
            _loc5_ |= 1;
         }
         _loc3_.writeUI8(_loc5_);
         _loc2_ = 0;
         while(_loc2_ < this.functionParams.length)
         {
            _loc3_.writeREGISTERPARAM(this.functionParams[_loc2_]);
            _loc2_++;
         }
         var _loc6_:SWFData = new SWFData();
         _loc2_ = 0;
         while(_loc2_ < this.functionBody.length)
         {
            _loc6_.writeACTIONRECORD(this.functionBody[_loc2_]);
            _loc2_++;
         }
         _loc3_.writeUI16(_loc6_.length);
         write(param1,_loc3_);
         param1.writeBytes(_loc6_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:uint = 0;
         var _loc2_:ActionDefineFunction2 = new ActionDefineFunction2(code,length,pos);
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
         _loc2_.registerCount = this.registerCount;
         _loc2_.preloadParent = this.preloadParent;
         _loc2_.preloadRoot = this.preloadRoot;
         _loc2_.preloadSuper = this.preloadSuper;
         _loc2_.preloadArguments = this.preloadArguments;
         _loc2_.preloadThis = this.preloadThis;
         _loc2_.preloadGlobal = this.preloadGlobal;
         _loc2_.suppressSuper = this.suppressSuper;
         _loc2_.suppressArguments = this.suppressArguments;
         _loc2_.suppressThis = this.suppressThis;
         return _loc2_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc2_:* = "[ActionDefineFunction2] " + (this.functionName == null || this.functionName.length == 0 ? "<anonymous>" : this.functionName) + "(" + this.functionParams.join(", ") + "), ";
         var _loc3_:Array = [];
         if(this.preloadParent)
         {
            _loc3_.push("preloadParent");
         }
         if(this.preloadRoot)
         {
            _loc3_.push("preloadRoot");
         }
         if(this.preloadSuper)
         {
            _loc3_.push("preloadSuper");
         }
         if(this.preloadArguments)
         {
            _loc3_.push("preloadArguments");
         }
         if(this.preloadThis)
         {
            _loc3_.push("preloadThis");
         }
         if(this.preloadGlobal)
         {
            _loc3_.push("preloadGlobal");
         }
         if(this.suppressSuper)
         {
            _loc3_.push("suppressSuper");
         }
         if(this.suppressArguments)
         {
            _loc3_.push("suppressArguments");
         }
         if(this.suppressThis)
         {
            _loc3_.push("suppressThis");
         }
         if(_loc3_.length == 0)
         {
            _loc3_.push("none");
         }
         _loc2_ += "Flags: " + _loc3_.join(",");
         var _loc4_:uint = 0;
         while(_loc4_ < this.functionBody.length)
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc4_ + "] " + this.functionBody[_loc4_].toString(param1 + 4);
            _loc4_++;
         }
         return _loc2_;
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         var _loc3_:* = _14975(param1) + "defineFunction2 " + (this.functionName == null || this.functionName.length == 0 ? "" : this.functionName) + "(" + this.functionParams.join(", ") + ") {";
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         if(this.preloadParent)
         {
            _loc4_.push("parent");
         }
         if(this.preloadRoot)
         {
            _loc4_.push("root");
         }
         if(this.preloadSuper)
         {
            _loc4_.push("super");
         }
         if(this.preloadArguments)
         {
            _loc4_.push("arguments");
         }
         if(this.preloadThis)
         {
            _loc4_.push("this");
         }
         if(this.preloadGlobal)
         {
            _loc4_.push("global");
         }
         if(this.suppressSuper)
         {
            _loc5_.push("super");
         }
         if(this.suppressArguments)
         {
            _loc5_.push("arguments");
         }
         if(this.suppressThis)
         {
            _loc5_.push("this");
         }
         if(_loc4_.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "// preload: " + _loc4_.join(", ");
         }
         if(_loc5_.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "// suppress: " + _loc5_.join(", ");
         }
         param2 = new _14132(this.functionBody,param2._14985.concat(),this._14978);
         var _loc6_:uint = 0;
         while(_loc6_ < this.functionBody.length)
         {
            if(this.functionBody[_loc6_])
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + this.functionBody[_loc6_]._14979(param1 + 4,param2);
            }
            _loc6_++;
         }
         if(param2._14983 != null)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + param2._14983 + ":";
         }
         return _loc3_ + ("\n" + StringUtils.repeat(param1 + 2) + "}");
      }
   }
}

