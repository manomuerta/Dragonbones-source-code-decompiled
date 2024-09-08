package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWF;
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   import com.codeazur.utils.StringUtils;
   
   public class SWFButtonCondAction
   {
      public var condActionSize:uint;
      
      public var condIdleToOverDown:Boolean;
      
      public var condOutDownToIdle:Boolean;
      
      public var condOutDownToOverDown:Boolean;
      
      public var condOverDownToOutDown:Boolean;
      
      public var condOverDownToOverUp:Boolean;
      
      public var condOverUpToOverDown:Boolean;
      
      public var condOverUpToIdle:Boolean;
      
      public var condIdleToOverUp:Boolean;
      
      public var condOverDownToIdle:Boolean;
      
      public var condKeyPress:uint;
      
      protected var _actions:Vector.<IAction>;
      
      protected var _14978:uint;
      
      public function SWFButtonCondAction(param1:SWFData = null)
      {
         super();
         this._actions = new Vector.<IAction>();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      public function get actions() : Vector.<IAction>
      {
         return this._actions;
      }
      
      public function parse(param1:SWFData) : void
      {
         var _loc3_:IAction = null;
         var _loc2_:uint = uint(param1.readUI8() << 8 | param1.readUI8());
         this.condIdleToOverDown = (_loc2_ & 0x8000) != 0;
         this.condOutDownToIdle = (_loc2_ & 0x4000) != 0;
         this.condOutDownToOverDown = (_loc2_ & 0x2000) != 0;
         this.condOverDownToOutDown = (_loc2_ & 0x1000) != 0;
         this.condOverDownToOverUp = (_loc2_ & 0x0800) != 0;
         this.condOverUpToOverDown = (_loc2_ & 0x0400) != 0;
         this.condOverUpToIdle = (_loc2_ & 0x0200) != 0;
         this.condIdleToOverUp = (_loc2_ & 0x0100) != 0;
         this.condOverDownToIdle = (_loc2_ & 1) != 0;
         this.condKeyPress = (_loc2_ & 0xFF) >> 1;
         while(_loc3_ = param1.readACTIONRECORD(), _loc3_ != null)
         {
            this._actions.push(_loc3_);
         }
         this._14978 = Action._14976(this._actions);
      }
      
      public function publish(param1:SWFData) : void
      {
         var _loc2_:uint = 0;
         if(this.condIdleToOverDown)
         {
            _loc2_ |= 128;
         }
         if(this.condOutDownToIdle)
         {
            _loc2_ |= 64;
         }
         if(this.condOutDownToOverDown)
         {
            _loc2_ |= 32;
         }
         if(this.condOverDownToOutDown)
         {
            _loc2_ |= 16;
         }
         if(this.condOverDownToOverUp)
         {
            _loc2_ |= 8;
         }
         if(this.condOverUpToOverDown)
         {
            _loc2_ |= 4;
         }
         if(this.condOverUpToIdle)
         {
            _loc2_ |= 2;
         }
         if(this.condIdleToOverUp)
         {
            _loc2_ |= 1;
         }
         param1.writeUI8(_loc2_);
         var _loc3_:uint = uint(this.condKeyPress << 1);
         if(this.condOverDownToIdle)
         {
            _loc3_ |= 1;
         }
         param1.writeUI8(_loc3_);
         var _loc4_:uint = 0;
         while(_loc4_ < this.actions.length)
         {
            param1.writeACTIONRECORD(this.actions[_loc4_]);
            _loc4_++;
         }
         param1.writeUI8(0);
      }
      
      public function clone() : SWFButtonCondAction
      {
         var _loc1_:SWFButtonCondAction = new SWFButtonCondAction();
         _loc1_.condActionSize = this.condActionSize;
         _loc1_.condIdleToOverDown = this.condIdleToOverDown;
         _loc1_.condOutDownToIdle = this.condOutDownToIdle;
         _loc1_.condOutDownToOverDown = this.condOutDownToOverDown;
         _loc1_.condOverDownToOutDown = this.condOverDownToOutDown;
         _loc1_.condOverDownToOverUp = this.condOverDownToOverUp;
         _loc1_.condOverUpToOverDown = this.condOverUpToOverDown;
         _loc1_.condOverUpToIdle = this.condOverUpToIdle;
         _loc1_.condIdleToOverUp = this.condIdleToOverUp;
         _loc1_.condOverDownToIdle = this.condOverDownToIdle;
         _loc1_.condKeyPress = this.condKeyPress;
         var _loc2_:uint = 0;
         while(_loc2_ < this.actions.length)
         {
            _loc1_.actions.push(this.actions[_loc2_].clone());
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc5_:uint = 0;
         var _loc6_:_14132 = null;
         var _loc3_:Array = [];
         if(this.condIdleToOverDown)
         {
            _loc3_.push("idleToOverDown");
         }
         if(this.condOutDownToIdle)
         {
            _loc3_.push("outDownToIdle");
         }
         if(this.condOutDownToOverDown)
         {
            _loc3_.push("outDownToOverDown");
         }
         if(this.condOverDownToOutDown)
         {
            _loc3_.push("overDownToOutDown");
         }
         if(this.condOverDownToOverUp)
         {
            _loc3_.push("overDownToOverUp");
         }
         if(this.condOverUpToOverDown)
         {
            _loc3_.push("overUpToOverDown");
         }
         if(this.condOverUpToIdle)
         {
            _loc3_.push("overUpToIdle");
         }
         if(this.condIdleToOverUp)
         {
            _loc3_.push("idleToOverUp");
         }
         if(this.condOverDownToIdle)
         {
            _loc3_.push("overDownToIdle");
         }
         var _loc4_:* = "CondActionRecord (" + _loc3_.join(", ") + ")";
         if(this.condKeyPress > 0)
         {
            _loc4_ += ", KeyPress: " + this.condKeyPress;
         }
         if((param2 & SWF.TOSTRING_FLAG_AVM1_BYTECODE) == 0)
         {
            _loc5_ = 0;
            while(_loc5_ < this._actions.length)
            {
               _loc4_ += "\n" + StringUtils.repeat(param1 + 2) + "[" + _loc5_ + "] " + this._actions[_loc5_].toString(param1 + 2);
               _loc5_++;
            }
         }
         else
         {
            _loc6_ = new _14132(this._actions,[],this._14978);
            _loc5_ = 0;
            while(_loc5_ < this._actions.length)
            {
               _loc4_ += "\n" + StringUtils.repeat(param1 + 4) + this._actions[_loc5_]._14979(param1 + 4,_loc6_);
               _loc5_++;
            }
            if(_loc6_._14983 != null)
            {
               _loc4_ += "\n" + StringUtils.repeat(param1 + 4) + _loc6_._14983 + ":";
            }
         }
         return _loc4_;
      }
   }
}

