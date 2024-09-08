package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.exporters.core.IShapeExporter;
   import com.codeazur.utils.StringUtils;
   
   public class SWFShapeWithStyle extends SWFShape
   {
      protected var _initialFillStyles:Vector.<SWFFillStyle>;
      
      protected var _initialLineStyles:Vector.<SWFLineStyle>;
      
      public function SWFShapeWithStyle(param1:SWFData = null, param2:uint = 1, param3:Number = 20)
      {
         this._initialFillStyles = new Vector.<SWFFillStyle>();
         this._initialLineStyles = new Vector.<SWFLineStyle>();
         super(param1,param2,param3);
      }
      
      public function get initialFillStyles() : Vector.<SWFFillStyle>
      {
         return this._initialFillStyles;
      }
      
      public function get initialLineStyles() : Vector.<SWFLineStyle>
      {
         return this._initialLineStyles;
      }
      
      override public function parse(param1:SWFData, param2:uint = 1) : void
      {
         var _loc3_:uint = 0;
         param1.resetBitsPending();
         var _loc4_:uint = this.readStyleArrayLength(param1,param2);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            this.initialFillStyles.push(param1.readFILLSTYLE(param2));
            _loc3_++;
         }
         var _loc5_:uint = this.readStyleArrayLength(param1,param2);
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            this.initialLineStyles.push(param2 <= 3 ? param1.readLINESTYLE(param2) : param1.readLINESTYLE2(param2));
            _loc3_++;
         }
         param1.resetBitsPending();
         var _loc6_:uint = param1.readUB(4);
         var _loc7_:uint = param1.readUB(4);
         readShapeRecords(param1,_loc6_,_loc7_,param2);
      }
      
      override public function publish(param1:SWFData, param2:uint = 1) : void
      {
         var _loc3_:uint = 0;
         param1.resetBitsPending();
         var _loc4_:uint = this.initialFillStyles.length;
         this.writeStyleArrayLength(param1,_loc4_,param2);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            this.initialFillStyles[_loc3_].publish(param1,param2);
            _loc3_++;
         }
         var _loc5_:uint = this.initialLineStyles.length;
         this.writeStyleArrayLength(param1,_loc5_,param2);
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            this.initialLineStyles[_loc3_].publish(param1,param2);
            _loc3_++;
         }
         var _loc6_:uint = param1.calculateMaxBits(false,[getMaxFillStyleIndex()]);
         var _loc7_:uint = param1.calculateMaxBits(false,[getMaxLineStyleIndex()]);
         param1.resetBitsPending();
         param1.writeUB(4,_loc6_);
         param1.writeUB(4,_loc7_);
         writeShapeRecords(param1,_loc6_,_loc7_,param2);
      }
      
      override public function export(param1:IShapeExporter = null) : void
      {
         _fillStyles = this._initialFillStyles.concat();
         _lineStyles = this._initialLineStyles.concat();
         super.export(param1);
      }
      
      override public function toString(param1:uint = 0) : String
      {
         var _loc2_:uint = 0;
         var _loc3_:String = "";
         if(this._initialFillStyles.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1) + "FillStyles:";
            _loc2_ = 0;
            while(_loc2_ < this._initialFillStyles.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "[" + (_loc2_ + 1) + "] " + this._initialFillStyles[_loc2_].toString();
               _loc2_++;
            }
         }
         if(this._initialLineStyles.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1) + "LineStyles:";
            _loc2_ = 0;
            while(_loc2_ < this._initialLineStyles.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "[" + (_loc2_ + 1) + "] " + this._initialLineStyles[_loc2_].toString();
               _loc2_++;
            }
         }
         return _loc3_ + super.toString(param1);
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
   }
}

