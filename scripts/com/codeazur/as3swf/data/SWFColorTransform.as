package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import flash.geom.ColorTransform;
   
   public class SWFColorTransform
   {
      protected var _15020:int = 256;
      
      protected var _15019:int = 256;
      
      protected var _15018:int = 256;
      
      protected var _15017:int = 256;
      
      protected var _15024:int = 0;
      
      protected var _15023:int = 0;
      
      protected var _15022:int = 0;
      
      protected var _15021:int = 0;
      
      public var hasMultTerms:Boolean;
      
      public var hasAddTerms:Boolean;
      
      public function SWFColorTransform(param1:SWFData = null)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      public function get rMult() : Number
      {
         return this._15020 / 256;
      }
      
      public function get gMult() : Number
      {
         return this._15019 / 256;
      }
      
      public function get bMult() : Number
      {
         return this._15018 / 256;
      }
      
      public function set rMult(param1:Number) : void
      {
         this._15020 = this.clamp(param1 * 256);
         this._15015();
      }
      
      public function set gMult(param1:Number) : void
      {
         this._15019 = this.clamp(param1 * 256);
         this._15015();
      }
      
      public function set bMult(param1:Number) : void
      {
         this._15018 = this.clamp(param1 * 256);
         this._15015();
      }
      
      public function get rAdd() : Number
      {
         return this._15024;
      }
      
      public function get gAdd() : Number
      {
         return this._15023;
      }
      
      public function get bAdd() : Number
      {
         return this._15022;
      }
      
      public function set rAdd(param1:Number) : void
      {
         this._15024 = this.clamp(param1);
         this._15016();
      }
      
      public function set gAdd(param1:Number) : void
      {
         this._15023 = this.clamp(param1);
         this._15016();
      }
      
      public function set bAdd(param1:Number) : void
      {
         this._15022 = this.clamp(param1);
         this._15016();
      }
      
      public function get colorTransform() : ColorTransform
      {
         return new ColorTransform(this.rMult,this.gMult,this.bMult,1,this.rAdd,this.gAdd,this.bAdd,0);
      }
      
      public function parse(param1:SWFData) : void
      {
         param1.resetBitsPending();
         this.hasAddTerms = param1.readUB(1) == 1;
         this.hasMultTerms = param1.readUB(1) == 1;
         var _loc2_:uint = param1.readUB(4);
         if(this.hasMultTerms)
         {
            this._15020 = param1.readSB(_loc2_);
            this._15019 = param1.readSB(_loc2_);
            this._15018 = param1.readSB(_loc2_);
         }
         else
         {
            this._15020 = 256;
            this._15019 = 256;
            this._15018 = 256;
         }
         if(this.hasAddTerms)
         {
            this._15024 = param1.readSB(_loc2_);
            this._15023 = param1.readSB(_loc2_);
            this._15022 = param1.readSB(_loc2_);
         }
         else
         {
            this._15024 = 0;
            this._15023 = 0;
            this._15022 = 0;
         }
      }
      
      public function publish(param1:SWFData) : void
      {
         param1.resetBitsPending();
         param1.writeUB(1,this.hasAddTerms ? 1 : 0);
         param1.writeUB(1,this.hasMultTerms ? 1 : 0);
         var _loc2_:Array = [];
         if(this.hasMultTerms)
         {
            _loc2_.push(this._15020,this._15019,this._15018);
         }
         if(this.hasAddTerms)
         {
            _loc2_.push(this._15024,this._15023,this._15022);
         }
         var _loc3_:uint = param1.calculateMaxBits(true,_loc2_);
         param1.writeUB(4,_loc3_);
         if(this.hasMultTerms)
         {
            param1.writeSB(_loc3_,this._15020);
            param1.writeSB(_loc3_,this._15019);
            param1.writeSB(_loc3_,this._15018);
         }
         if(this.hasAddTerms)
         {
            param1.writeSB(_loc3_,this._15024);
            param1.writeSB(_loc3_,this._15023);
            param1.writeSB(_loc3_,this._15022);
         }
      }
      
      public function clone() : SWFColorTransform
      {
         var _loc1_:SWFColorTransform = new SWFColorTransform();
         _loc1_.hasAddTerms = this.hasAddTerms;
         _loc1_.hasMultTerms = this.hasMultTerms;
         _loc1_.rMult = this.rMult;
         _loc1_.gMult = this.gMult;
         _loc1_.bMult = this.bMult;
         _loc1_.rAdd = this.rAdd;
         _loc1_.gAdd = this.gAdd;
         _loc1_.bAdd = this.bAdd;
         return _loc1_;
      }
      
      protected function _15015() : void
      {
         this.hasMultTerms = this._15020 != 256 || this._15019 != 256 || this._15018 != 256;
      }
      
      protected function _15016() : void
      {
         this.hasAddTerms = this._15024 != 0 || this._15023 != 0 || this._15022 != 0;
      }
      
      protected function clamp(param1:Number) : int
      {
         return Math.min(Math.max(param1,-32768),32767);
      }
      
      public function isIdentity() : Boolean
      {
         return !this.hasMultTerms && !this.hasAddTerms;
      }
      
      public function toString() : String
      {
         return "(" + this.rMult + "," + this.gMult + "," + this.bMult + "," + this.rAdd + "," + this.gAdd + "," + this.bAdd + ")";
      }
   }
}

