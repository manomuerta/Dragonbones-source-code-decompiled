package com.codeazur.as3swf.data.actions
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.utils.StringUtils;
   
   public class Action implements IAction
   {
      protected var _code:uint;
      
      protected var _length:uint;
      
      protected var _14980:uint;
      
      protected var _14981:String;
      
      public function Action(param1:uint, param2:uint, param3:uint)
      {
         super();
         this._code = param1;
         this._length = param2;
         this._14980 = param3;
         this._14981 = null;
      }
      
      public static function _14976(param1:Vector.<IAction>) : uint
      {
         var _loc4_:IAction = null;
         var _loc6_:uint = 0;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:_14133 = null;
         var _loc10_:uint = 0;
         var _loc2_:uint = 1;
         var _loc3_:uint = 0;
         var _loc5_:uint = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param1[_loc6_];
            if(_loc4_ is _14133)
            {
               _loc8_ = false;
               _loc9_ = _loc4_ as _14133;
               if((_loc10_ = _loc9_.pos + _loc9_._14974 + _loc9_.branchOffset) <= _loc9_.pos)
               {
                  _loc7_ = int(_loc6_);
                  while(_loc7_ >= 0)
                  {
                     if(_loc10_ == param1[_loc7_].pos)
                     {
                        _loc3_++;
                        _loc8_ = true;
                        break;
                     }
                     _loc7_--;
                  }
               }
               else
               {
                  _loc7_ = _loc6_ + 1;
                  while(_loc7_ < _loc5_)
                  {
                     if(_loc10_ == param1[_loc7_].pos)
                     {
                        _loc3_++;
                        _loc8_ = true;
                        break;
                     }
                     _loc7_++;
                  }
                  if(!_loc8_)
                  {
                     _loc4_ = param1[_loc7_ - 1];
                     if(_loc10_ == _loc4_.pos + _loc4_._14974)
                     {
                        _loc7_ = -1;
                        _loc8_ = true;
                     }
                  }
               }
               if(_loc8_)
               {
                  _loc9_._14977 = _loc7_;
                  if(_loc7_ >= 0)
                  {
                     (_loc4_ = param1[_loc7_])._14982 = "L";
                  }
               }
               else
               {
                  _loc9_._14977 = -2;
               }
            }
            _loc6_++;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param1[_loc6_];
            if(_loc4_._14982 != null)
            {
               _loc4_._14982 += _loc2_++;
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      public function get code() : uint
      {
         return this._code;
      }
      
      public function get length() : uint
      {
         return this._length;
      }
      
      public function get _14974() : uint
      {
         return this._length + (this._code >= 128 ? 3 : 1);
      }
      
      public function get pos() : uint
      {
         return this._14980;
      }
      
      public function get _14982() : String
      {
         return this._14981;
      }
      
      public function set _14982(param1:String) : void
      {
         this._14981 = param1;
      }
      
      public function parse(param1:SWFData) : void
      {
      }
      
      public function publish(param1:SWFData) : void
      {
         this.write(param1);
      }
      
      public function clone() : IAction
      {
         return new Action(this.code,this.length,this.pos);
      }
      
      protected function write(param1:SWFData, param2:SWFData = null) : void
      {
         param1.writeUI8(this.code);
         if(this.code >= 128)
         {
            if(!(param2 != null && param2.length > 0))
            {
               this._length = 0;
               throw new Error("Action body null or empty.");
            }
            this._length = param2.length;
            param1.writeUI16(this._length);
            param1.writeBytes(param2);
         }
         else
         {
            this._length = 0;
         }
      }
      
      public function toString(param1:uint = 0) : String
      {
         return "[Action] Code: " + this._code.toString(16) + ", Length: " + this._length;
      }
      
      public function _14979(param1:uint, param2:_14132) : String
      {
         return this._14975(param1) + "unknown (0x" + this._code.toString(16) + ")";
      }
      
      public function _14975(param1:uint) : String
      {
         if(this._14982 != null)
         {
            return this._14982 + ":\n" + StringUtils.repeat(param1 + 2);
         }
         return StringUtils.repeat(2);
      }
   }
}

