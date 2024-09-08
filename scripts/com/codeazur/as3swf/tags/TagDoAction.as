package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWF;
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   import com.codeazur.utils.StringUtils;
   
   public class TagDoAction implements ITag
   {
      public static const TYPE:uint = 12;
      
      protected var _actions:Vector.<IAction>;
      
      protected var _14978:uint;
      
      public function TagDoAction()
      {
         super();
         this._actions = new Vector.<IAction>();
         this._14978 = 0;
      }
      
      public function get actions() : Vector.<IAction>
      {
         return this._actions;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc5_:IAction = null;
         while(_loc5_ = param1.readACTIONRECORD(), _loc5_ != null)
         {
            this._actions.push(_loc5_);
         }
         this._14978 = Action._14976(this._actions);
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         var _loc4_:uint = 0;
         while(_loc4_ < this._actions.length)
         {
            _loc3_.writeACTIONRECORD(this._actions[_loc4_]);
            _loc4_++;
         }
         _loc3_.writeUI8(0);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DoAction";
      }
      
      public function get version() : uint
      {
         return 3;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:uint = 0;
         var _loc5_:_14132 = null;
         var _loc4_:String = Tag.toStringCommon(this.type,this.name,param1) + "Records: " + this._actions.length;
         if((param2 & SWF.TOSTRING_FLAG_AVM1_BYTECODE) == 0)
         {
            _loc3_ = 0;
            while(_loc3_ < this._actions.length)
            {
               _loc4_ += "\n" + StringUtils.repeat(param1 + 2) + "[" + _loc3_ + "] " + this._actions[_loc3_].toString(param1 + 2);
               _loc3_++;
            }
         }
         else
         {
            _loc5_ = new _14132(this._actions,[],this._14978);
            _loc3_ = 0;
            while(_loc3_ < this._actions.length)
            {
               _loc4_ += "\n" + StringUtils.repeat(param1 + 2) + this._actions[_loc3_]._14979(param1 + 2,_loc5_);
               _loc3_++;
            }
            if(_loc5_._14983 != null)
            {
               _loc4_ += "\n" + StringUtils.repeat(param1 + 4) + _loc5_._14983 + ":";
            }
         }
         return _loc4_;
      }
   }
}

