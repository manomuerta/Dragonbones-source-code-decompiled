package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.utils.StringUtils;
   
   public class SWFShapeRecordStyleChange extends SWFShapeRecord
   {
      public var stateNewStyles:Boolean = false;
      
      public var stateLineStyle:Boolean = false;
      
      public var stateFillStyle1:Boolean = false;
      
      public var stateFillStyle0:Boolean = false;
      
      public var stateMoveTo:Boolean = false;
      
      public var moveDeltaX:int = 0;
      
      public var moveDeltaY:int = 0;
      
      public var fillStyle0:uint = 0;
      
      public var fillStyle1:uint = 0;
      
      public var lineStyle:uint = 0;
      
      public var numFillBits:uint = 0;
      
      public var numLineBits:uint = 0;
      
      protected var _fillStyles:Vector.<SWFFillStyle>;
      
      protected var _lineStyles:Vector.<SWFLineStyle>;
      
      public function SWFShapeRecordStyleChange(param1:SWFData = null, param2:uint = 0, param3:uint = 0, param4:uint = 0, param5:uint = 1)
      {
         this._fillStyles = new Vector.<SWFFillStyle>();
         this._lineStyles = new Vector.<SWFLineStyle>();
         this.stateNewStyles = (param2 & 0x10) != 0;
         this.stateLineStyle = (param2 & 8) != 0;
         this.stateFillStyle1 = (param2 & 4) != 0;
         this.stateFillStyle0 = (param2 & 2) != 0;
         this.stateMoveTo = (param2 & 1) != 0;
         this.numFillBits = param3;
         this.numLineBits = param4;
         super(param1,param5);
      }
      
      public function get fillStyles() : Vector.<SWFFillStyle>
      {
         return this._fillStyles;
      }
      
      public function get lineStyles() : Vector.<SWFLineStyle>
      {
         return this._lineStyles;
      }
      
      override public function get type() : uint
      {
         return SWFShapeRecord.TYPE_STYLECHANGE;
      }
      
      override public function parse(param1:SWFData = null, param2:uint = 1) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         if(this.stateMoveTo)
         {
            _loc3_ = param1.readUB(5);
            this.moveDeltaX = param1.readSB(_loc3_);
            this.moveDeltaY = param1.readSB(_loc3_);
         }
         this.fillStyle0 = this.stateFillStyle0 ? param1.readUB(this.numFillBits) : 0;
         this.fillStyle1 = this.stateFillStyle1 ? param1.readUB(this.numFillBits) : 0;
         this.lineStyle = this.stateLineStyle ? param1.readUB(this.numLineBits) : 0;
         if(this.stateNewStyles)
         {
            param1.resetBitsPending();
            _loc5_ = this.readStyleArrayLength(param1,param2);
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               this.fillStyles.push(param1.readFILLSTYLE(param2));
               _loc4_++;
            }
            _loc6_ = this.readStyleArrayLength(param1,param2);
            _loc4_ = 0;
            while(_loc4_ < _loc6_)
            {
               this.lineStyles.push(param2 <= 3 ? param1.readLINESTYLE(param2) : param1.readLINESTYLE2(param2));
               _loc4_++;
            }
            param1.resetBitsPending();
            this.numFillBits = param1.readUB(4);
            this.numLineBits = param1.readUB(4);
         }
      }
      
      override public function publish(param1:SWFData = null, param2:uint = 1) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         if(this.stateMoveTo)
         {
            _loc3_ = param1.calculateMaxBits(true,[this.moveDeltaX,this.moveDeltaY]);
            param1.writeUB(5,_loc3_);
            param1.writeSB(_loc3_,this.moveDeltaX);
            param1.writeSB(_loc3_,this.moveDeltaY);
         }
         if(this.stateFillStyle0)
         {
            param1.writeUB(this.numFillBits,this.fillStyle0);
         }
         if(this.stateFillStyle1)
         {
            param1.writeUB(this.numFillBits,this.fillStyle1);
         }
         if(this.stateLineStyle)
         {
            param1.writeUB(this.numLineBits,this.lineStyle);
         }
         if(this.stateNewStyles)
         {
            param1.resetBitsPending();
            _loc5_ = this.fillStyles.length;
            this.writeStyleArrayLength(param1,_loc5_,param2);
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               this.fillStyles[_loc4_].publish(param1,param2);
               _loc4_++;
            }
            _loc6_ = this.lineStyles.length;
            this.writeStyleArrayLength(param1,_loc6_,param2);
            _loc4_ = 0;
            while(_loc4_ < _loc6_)
            {
               this.lineStyles[_loc4_].publish(param1,param2);
               _loc4_++;
            }
            this.numFillBits = param1.calculateMaxBits(false,[_loc5_]);
            this.numLineBits = param1.calculateMaxBits(false,[_loc6_]);
            param1.resetBitsPending();
            param1.writeUB(4,this.numFillBits);
            param1.writeUB(4,this.numLineBits);
         }
      }
      
      protected function readStyleArrayLength(param1:SWFData, param2:uint = 1) : uint
      {
         var _loc3_:uint = param1.readUI8();
         if(param2 >= 2 && _loc3_ == 255)
         {
            _loc3_ = param1.readUI16();
         }
         return _loc3_;
      }
      
      protected function writeStyleArrayLength(param1:SWFData, param2:uint, param3:uint = 1) : void
      {
         if(param3 >= 2 && param2 > 254)
         {
            param1.writeUI8(255);
            param1.writeUI16(param2);
         }
         else
         {
            param1.writeUI8(param2);
         }
      }
      
      override public function clone() : SWFShapeRecord
      {
         var _loc2_:uint = 0;
         var _loc1_:SWFShapeRecordStyleChange = new SWFShapeRecordStyleChange();
         _loc1_.stateNewStyles = this.stateNewStyles;
         _loc1_.stateLineStyle = this.stateLineStyle;
         _loc1_.stateFillStyle1 = this.stateFillStyle1;
         _loc1_.stateFillStyle0 = this.stateFillStyle0;
         _loc1_.stateMoveTo = this.stateMoveTo;
         _loc1_.moveDeltaX = this.moveDeltaX;
         _loc1_.moveDeltaY = this.moveDeltaY;
         _loc1_.fillStyle0 = this.fillStyle0;
         _loc1_.fillStyle1 = this.fillStyle1;
         _loc1_.lineStyle = this.lineStyle;
         _loc1_.numFillBits = this.numFillBits;
         _loc1_.numLineBits = this.numLineBits;
         _loc2_ = 0;
         while(_loc2_ < this.fillStyles.length)
         {
            _loc1_.fillStyles.push(this.fillStyles[_loc2_].clone());
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.lineStyles.length)
         {
            _loc1_.lineStyles.push(this.lineStyles[_loc2_].clone());
            _loc2_++;
         }
         return _loc1_;
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc4_:uint = 0;
         var _loc2_:String = "[SWFShapeRecordStyleChange] ";
         var _loc3_:Array = [];
         if(this.stateMoveTo)
         {
            _loc3_.push("MoveTo: " + this.moveDeltaX + "," + this.moveDeltaY);
         }
         if(this.stateFillStyle0)
         {
            _loc3_.push("FillStyle0: " + this.fillStyle0);
         }
         if(this.stateFillStyle1)
         {
            _loc3_.push("FillStyle1: " + this.fillStyle1);
         }
         if(this.stateLineStyle)
         {
            _loc3_.push("LineStyle: " + this.lineStyle);
         }
         if(_loc3_.length > 0)
         {
            _loc2_ += _loc3_.join(", ");
         }
         if(this.stateNewStyles)
         {
            if(this._fillStyles.length > 0)
            {
               _loc2_ += "\n" + StringUtils.repeat(param1 + 2) + "New FillStyles:";
               _loc4_ = 0;
               while(_loc4_ < this._fillStyles.length)
               {
                  _loc2_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + (_loc4_ + 1) + "] " + this._fillStyles[_loc4_].toString();
                  _loc4_++;
               }
            }
            if(this._lineStyles.length > 0)
            {
               _loc2_ += "\n" + StringUtils.repeat(param1 + 2) + "New LineStyles:";
               _loc4_ = 0;
               while(_loc4_ < this._lineStyles.length)
               {
                  _loc2_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + (_loc4_ + 1) + "] " + this._lineStyles[_loc4_].toString();
                  _loc4_++;
               }
            }
         }
         return _loc2_;
      }
   }
}

