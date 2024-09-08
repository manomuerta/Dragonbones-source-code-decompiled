package com.codeazur.as3swf.data.actions.swf4
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFActionValue;
   import com.codeazur.as3swf.data.actions.*;
   import com.codeazur.utils.StringUtils;
   
   public class ActionPush extends Action implements IAction
   {
      public static const CODE:uint = 150;
      
      public var values:Vector.<SWFActionValue>;
      
      public function ActionPush(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
         this.values = new Vector.<SWFActionValue>();
      }
      
      override public function parse(param1:SWFData) : void
      {
         var _loc2_:uint = param1.position + length;
         while(param1.position != _loc2_)
         {
            this.values.push(param1.readACTIONVALUE());
         }
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:SWFData = new SWFData();
         var _loc3_:uint = 0;
         while(_loc3_ < this.values.length)
         {
            _loc2_.writeACTIONVALUE(this.values[_loc3_]);
            _loc3_++;
         }
         write(param1,_loc2_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:ActionPush = new ActionPush(code,length,pos);
         var _loc2_:uint = 0;
         while(_loc2_ < this.values.length)
         {
            _loc1_.values.push(this.values[_loc2_].clone());
            _loc2_++;
         }
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         return "[ActionPush] " + this.values.join(", ");
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         var _loc3_:String = _14975(param1);
         var _loc4_:uint = 0;
         while(_loc4_ < this.values.length)
         {
            if(_loc4_ > 0)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 2);
            }
            _loc3_ += "push " + this.values[_loc4_]._14988(param2._14985);
            _loc4_++;
         }
         return _loc3_;
      }
   }
}

