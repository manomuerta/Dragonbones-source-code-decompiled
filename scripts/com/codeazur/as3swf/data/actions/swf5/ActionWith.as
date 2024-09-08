package com.codeazur.as3swf.data.actions.swf5
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.*;
   import com.codeazur.utils.StringUtils;
   
   public class ActionWith extends Action implements IAction
   {
      public static const CODE:uint = 148;
      
      public var withBody:Vector.<IAction>;
      
      protected var _14978:uint;
      
      public function ActionWith(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
         this.withBody = new Vector.<IAction>();
         this._14978 = 0;
      }
      
      override public function parse(param1:SWFData) : void
      {
         var _loc2_:uint = param1.readUI16();
         var _loc3_:uint = param1.position + _loc2_;
         while(param1.position < _loc3_)
         {
            this.withBody.push(param1.readACTIONRECORD());
         }
         this._14978 = Action._14976(this.withBody);
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:SWFData = new SWFData();
         var _loc3_:SWFData = new SWFData();
         var _loc4_:uint = 0;
         while(_loc4_ < this.withBody.length)
         {
            _loc3_.writeACTIONRECORD(this.withBody[_loc4_]);
            _loc4_++;
         }
         _loc2_.writeUI16(_loc3_.length);
         _loc2_.writeBytes(_loc3_);
         write(param1,_loc2_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:ActionWith = new ActionWith(code,length,pos);
         var _loc2_:uint = 0;
         while(_loc2_ < this.withBody.length)
         {
            _loc1_.withBody.push(this.withBody[_loc2_].clone());
            _loc2_++;
         }
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc2_:String = "[ActionWith]";
         var _loc3_:uint = 0;
         while(_loc3_ < this.withBody.length)
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc3_ + "] " + this.withBody[_loc3_].toString(param1 + 4);
            _loc3_++;
         }
         return _loc2_;
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         var _loc3_:* = _14975(param1) + "with {";
         param2 = new _14132(this.withBody,param2._14985.concat(),this._14978);
         var _loc4_:uint = 0;
         while(_loc4_ < this.withBody.length)
         {
            if(this.withBody[_loc4_])
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + this.withBody[_loc4_]._14979(param1 + 4,param2);
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

