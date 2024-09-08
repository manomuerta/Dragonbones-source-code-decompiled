package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.ActionValueType;
   import com.codeazur.utils.StringUtils;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class SWFActionValue
   {
      private static var ba:ByteArray = _15012();
      
      public var type:uint;
      
      public var string:String;
      
      public var number:Number;
      
      public var register:uint;
      
      public var boolean:Boolean;
      
      public var integer:uint;
      
      public var constant:uint;
      
      public function SWFActionValue(param1:SWFData = null)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      private static function _15012() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.length = 8;
         return _loc1_;
      }
      
      public function parse(param1:SWFData) : void
      {
         this.type = param1.readUI8();
         switch(this.type)
         {
            case ActionValueType.STRING:
               this.string = param1.readString();
               break;
            case ActionValueType.FLOAT:
               this.number = param1.readFLOAT();
               break;
            case ActionValueType.NULL:
            case ActionValueType.UNDEFINED:
               break;
            case ActionValueType.REGISTER:
               this.register = param1.readUI8();
               break;
            case ActionValueType.BOOLEAN:
               this.boolean = param1.readUI8() != 0;
               break;
            case ActionValueType.DOUBLE:
               ba.position = 0;
               ba[4] = param1.readUI8();
               ba[5] = param1.readUI8();
               ba[6] = param1.readUI8();
               ba[7] = param1.readUI8();
               ba[0] = param1.readUI8();
               ba[1] = param1.readUI8();
               ba[2] = param1.readUI8();
               ba[3] = param1.readUI8();
               this.number = ba.readDouble();
               break;
            case ActionValueType.INTEGER:
               this.integer = param1.readUI32();
               break;
            case ActionValueType.CONSTANT_8:
               this.constant = param1.readUI8();
               break;
            case ActionValueType.CONSTANT_16:
               this.constant = param1.readUI16();
               break;
            default:
               throw new Error("Unknown ActionValueType: " + this.type);
         }
      }
      
      public function publish(param1:SWFData) : void
      {
         param1.writeUI8(this.type);
         switch(this.type)
         {
            case ActionValueType.STRING:
               param1.writeString(this.string);
               break;
            case ActionValueType.FLOAT:
               param1.writeFLOAT(this.number);
               break;
            case ActionValueType.NULL:
            case ActionValueType.UNDEFINED:
               break;
            case ActionValueType.REGISTER:
               param1.writeUI8(this.register);
               break;
            case ActionValueType.BOOLEAN:
               param1.writeUI8(this.boolean ? 1 : 0);
               break;
            case ActionValueType.DOUBLE:
               ba.position = 0;
               ba.writeDouble(this.number);
               param1.writeUI8(ba[4]);
               param1.writeUI8(ba[5]);
               param1.writeUI8(ba[6]);
               param1.writeUI8(ba[7]);
               param1.writeUI8(ba[0]);
               param1.writeUI8(ba[1]);
               param1.writeUI8(ba[2]);
               param1.writeUI8(ba[3]);
               break;
            case ActionValueType.INTEGER:
               param1.writeUI32(this.integer);
               break;
            case ActionValueType.CONSTANT_8:
               param1.writeUI8(this.constant);
               break;
            case ActionValueType.CONSTANT_16:
               param1.writeUI16(this.constant);
               break;
            default:
               throw new Error("Unknown ActionValueType: " + this.type);
         }
      }
      
      public function clone() : SWFActionValue
      {
         var _loc1_:SWFActionValue = new SWFActionValue();
         switch(this.type)
         {
            case ActionValueType.FLOAT:
            case ActionValueType.DOUBLE:
               _loc1_.number = this.number;
               break;
            case ActionValueType.CONSTANT_8:
            case ActionValueType.CONSTANT_16:
               _loc1_.constant = this.constant;
               break;
            case ActionValueType.NULL:
            case ActionValueType.UNDEFINED:
               break;
            case ActionValueType.STRING:
               _loc1_.string = this.string;
               break;
            case ActionValueType.REGISTER:
               _loc1_.register = this.register;
               break;
            case ActionValueType.BOOLEAN:
               _loc1_.boolean = this.boolean;
               break;
            case ActionValueType.INTEGER:
               _loc1_.integer = this.integer;
               break;
            default:
               throw new Error("Unknown ActionValueType: " + this.type);
         }
         return _loc1_;
      }
      
      public function toString() : String
      {
         var _loc1_:* = "";
         switch(this.type)
         {
            case ActionValueType.STRING:
               _loc1_ = StringUtils.simpleEscape(this.string) + " (string)";
               break;
            case ActionValueType.FLOAT:
               _loc1_ = this.number + " (float)";
               break;
            case ActionValueType.NULL:
               _loc1_ = "null";
               break;
            case ActionValueType.UNDEFINED:
               _loc1_ = "undefined";
               break;
            case ActionValueType.REGISTER:
               _loc1_ = this.register + " (register)";
               break;
            case ActionValueType.BOOLEAN:
               _loc1_ = this.boolean + " (boolean)";
               break;
            case ActionValueType.DOUBLE:
               _loc1_ = this.number + " (double)";
               break;
            case ActionValueType.INTEGER:
               _loc1_ = this.integer + " (integer)";
               break;
            case ActionValueType.CONSTANT_8:
               _loc1_ = this.constant + " (constant8)";
               break;
            case ActionValueType.CONSTANT_16:
               _loc1_ = this.constant + " (constant16)";
               break;
            default:
               _loc1_ = "unknown";
         }
         return _loc1_;
      }
      
      public function _14988(param1:Array) : String
      {
         var _loc2_:* = "";
         switch(this.type)
         {
            case ActionValueType.STRING:
               _loc2_ = "\"" + StringUtils.simpleEscape(this.string) + "\"";
               break;
            case ActionValueType.FLOAT:
            case ActionValueType.DOUBLE:
               _loc2_ = this.number.toString();
               if(_loc2_.indexOf(".") == -1)
               {
                  _loc2_ += ".0";
               }
               break;
            case ActionValueType.NULL:
               _loc2_ = "null";
               break;
            case ActionValueType.UNDEFINED:
               _loc2_ = "undefined";
               break;
            case ActionValueType.REGISTER:
               _loc2_ = "$" + this.register;
               break;
            case ActionValueType.BOOLEAN:
               _loc2_ = this.boolean.toString();
               break;
            case ActionValueType.INTEGER:
               _loc2_ = this.integer.toString();
               break;
            case ActionValueType.CONSTANT_8:
            case ActionValueType.CONSTANT_16:
               _loc2_ = "\"" + StringUtils.simpleEscape(param1[this.constant]) + "\"";
               break;
            default:
               _loc2_ = "UNKNOWN";
         }
         return _loc2_;
      }
   }
}

