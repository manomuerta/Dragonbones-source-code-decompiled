package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWF;
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   import com.codeazur.utils.StringUtils;
   
   public class TagDoInitAction extends TagDoAction implements ITag
   {
      public static const TYPE:uint = 59;
      
      public var spriteId:uint;
      
      public function TagDoInitAction()
      {
         super();
      }
      
      override public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc5_:IAction = null;
         this.spriteId = param1.readUI16();
         while(_loc5_ = param1.readACTIONRECORD(), _loc5_ != null)
         {
            _actions.push(_loc5_);
         }
         _14978 = Action._14976(_actions);
      }
      
      override public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeUI16(this.spriteId);
         var _loc4_:uint = 0;
         while(_loc4_ < _actions.length)
         {
            _loc3_.writeACTIONRECORD(_actions[_loc4_]);
            _loc4_++;
         }
         _loc3_.writeUI8(0);
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "DoInitAction";
      }
      
      override public function get version() : uint
      {
         return 6;
      }
      
      override public function get level() : uint
      {
         return 1;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc4_:uint = 0;
         var _loc5_:_14132 = null;
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "SpriteID: " + this.spriteId + ", " + "Records: " + _actions.length;
         if((param2 & SWF.TOSTRING_FLAG_AVM1_BYTECODE) == 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _actions.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "[" + _loc4_ + "] " + _actions[_loc4_].toString(param1 + 2);
               _loc4_++;
            }
         }
         else
         {
            _loc5_ = new _14132(_actions,[],_14978);
            _loc4_ = 0;
            while(_loc4_ < _actions.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + _actions[_loc4_]._14979(param1 + 2,_loc5_);
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

