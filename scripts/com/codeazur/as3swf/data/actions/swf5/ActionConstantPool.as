package com.codeazur.as3swf.data.actions.swf5
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.actions.*;
   import com.codeazur.utils.StringUtils;
   
   public class ActionConstantPool extends Action implements IAction
   {
      public static const CODE:uint = 136;
      
      public var constants:Vector.<String>;
      
      public function ActionConstantPool(param1:uint, param2:uint, param3:uint)
      {
         super(param1,param2,param3);
         this.constants = new Vector.<String>();
      }
      
      override public function parse(param1:SWFData) : void
      {
         var _loc2_:uint = param1.readUI16();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            this.constants.push(param1.readString());
            _loc3_++;
         }
      }
      
      override public function publish(param1:SWFData) : void
      {
         var _loc2_:SWFData = new SWFData();
         _loc2_.writeUI16(this.constants.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.constants.length)
         {
            _loc2_.writeString(this.constants[_loc3_]);
            _loc3_++;
         }
         write(param1,_loc2_);
      }
      
      override public function clone() : IAction
      {
         var _loc1_:ActionConstantPool = new ActionConstantPool(code,length,pos);
         var _loc2_:uint = 0;
         while(_loc2_ < this.constants.length)
         {
            _loc1_.constants.push(this.constants[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc2_:String = "[ActionConstantPool] Values: " + this.constants.length;
         var _loc3_:uint = 0;
         while(_loc3_ < this.constants.length)
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 4) + _loc3_ + ": " + StringUtils.simpleEscape(this.constants[_loc3_]);
            _loc3_++;
         }
         return _loc2_;
      }
      
      override public function _14979(param1:uint, param2:_14132) : String
      {
         var _loc3_:* = _14975(param1) + "constantPool";
         param2._14985.length = 0;
         var _loc4_:uint = 0;
         while(_loc4_ < this.constants.length)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + _loc4_ + ": " + StringUtils.simpleEscape(this.constants[_loc4_]);
            param2._14985.push(this.constants[_loc4_]);
            _loc4_++;
         }
         return _loc3_;
      }
   }
}

