package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWF;
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   import com.codeazur.utils.StringUtils;
   
   public class SWFClipActionRecord
   {
      public var eventFlags:SWFClipEventFlags;
      
      public var keyCode:uint;
      
      protected var _actions:Vector.<IAction>;
      
      protected var _14978:uint;
      
      public function SWFClipActionRecord(param1:SWFData = null, param2:uint = 0)
      {
         super();
         this._actions = new Vector.<IAction>();
         if(param1 != null)
         {
            this.parse(param1,param2);
         }
      }
      
      public function get actions() : Vector.<IAction>
      {
         return this._actions;
      }
      
      public function parse(param1:SWFData, param2:uint) : void
      {
         var _loc3_:IAction = null;
         this.eventFlags = param1.readCLIPEVENTFLAGS(param2);
         param1.readUI32();
         if(this.eventFlags.keyPressEvent)
         {
            this.keyCode = param1.readUI8();
         }
         while(_loc3_ = param1.readACTIONRECORD(), _loc3_ != null)
         {
            this._actions.push(_loc3_);
         }
         this._14978 = Action._14976(this._actions);
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeCLIPEVENTFLAGS(this.eventFlags,param2);
         var _loc3_:SWFData = new SWFData();
         if(this.eventFlags.keyPressEvent)
         {
            _loc3_.writeUI8(this.keyCode);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.actions.length)
         {
            _loc3_.writeACTIONRECORD(this.actions[_loc4_]);
            _loc4_++;
         }
         _loc3_.writeUI8(0);
         param1.writeUI32(_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc4_:uint = 0;
         var _loc5_:_14132 = null;
         var _loc3_:* = "ClipActionRecord (" + this.eventFlags.toString() + ")";
         if(this.keyCode > 0)
         {
            _loc3_ += ", KeyCode: " + this.keyCode;
         }
         if((param2 & SWF.TOSTRING_FLAG_AVM1_BYTECODE) == 0)
         {
            _loc4_ = 0;
            while(_loc4_ < this._actions.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "[" + _loc4_ + "] " + this._actions[_loc4_].toString(param1 + 2);
               _loc4_++;
            }
         }
         else
         {
            _loc5_ = new _14132(this._actions,[],this._14978);
            _loc4_ = 0;
            while(_loc4_ < this._actions.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + this._actions[_loc4_]._14979(param1 + 4,_loc5_);
               _loc4_++;
            }
            if(_loc5_._14983 != null)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + _loc5_._14983 + ":";
            }
         }
         return _loc3_;
      }
   }
}

