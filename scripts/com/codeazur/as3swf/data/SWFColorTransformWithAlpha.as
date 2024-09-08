package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import flash.geom.ColorTransform;
   
   public class SWFColorTransformWithAlpha extends SWFColorTransform
   {
      public function SWFColorTransformWithAlpha(param1:SWFData = null)
      {
         super(param1);
      }
      
      public function get aMult() : Number
      {
         return _15017 / 256;
      }
      
      public function set aMult(param1:Number) : void
      {
         _15017 = clamp(param1 * 256);
         this._15015();
      }
      
      public function get aAdd() : Number
      {
         return _15021;
      }
      
      public function set aAdd(param1:Number) : void
      {
         _15021 = clamp(param1);
         this._15016();
      }
      
      override public function get colorTransform() : ColorTransform
      {
         return new ColorTransform(rMult,gMult,bMult,this.aMult,rAdd,gAdd,bAdd,this.aAdd);
      }
      
      override public function parse(param1:SWFData) : void
      {
         var _loc2_:uint = 0;
         param1.resetBitsPending();
         hasAddTerms = param1.readUB(1) == 1;
         hasMultTerms = param1.readUB(1) == 1;
         _loc2_ = param1.readUB(4);
         if(hasMultTerms)
         {
            _15020 = param1.readSB(_loc2_);
            _15019 = param1.readSB(_loc2_);
            _15018 = param1.readSB(_loc2_);
            _15017 = param1.readSB(_loc2_);
         }
         else
         {
            _15020 = 256;
            _15019 = 256;
            _15018 = 256;
            _15017 = 256;
         }
         if(hasAddTerms)
         {
            _15024 = param1.readSB(_loc2_);
            _15023 = param1.readSB(_loc2_);
            _15022 = param1.readSB(_loc2_);
            _15021 = param1.readSB(_loc2_);
         }
         else
         {
            _15024 = 0;
            _15023 = 0;
            _15022 = 0;
            _15021 = 0;
         }
      }
      
      override public function publish(param1:SWFData) : void
      {
         param1.resetBitsPending();
         param1.writeUB(1,hasAddTerms ? 1 : 0);
         param1.writeUB(1,hasMultTerms ? 1 : 0);
         var _loc2_:Array = [];
         if(hasMultTerms)
         {
            _loc2_.push(_15020,_15019,_15018,_15017);
         }
         if(hasAddTerms)
         {
            _loc2_.push(_15024,_15023,_15022,_15021);
         }
         var _loc3_:uint = hasMultTerms || hasAddTerms ? param1.calculateMaxBits(true,_loc2_) : 1;
         param1.writeUB(4,_loc3_);
         if(hasMultTerms)
         {
            param1.writeSB(_loc3_,_15020);
            param1.writeSB(_loc3_,_15019);
            param1.writeSB(_loc3_,_15018);
            param1.writeSB(_loc3_,_15017);
         }
         if(hasAddTerms)
         {
            param1.writeSB(_loc3_,_15024);
            param1.writeSB(_loc3_,_15023);
            param1.writeSB(_loc3_,_15022);
            param1.writeSB(_loc3_,_15021);
         }
      }
      
      override public function clone() : SWFColorTransform
      {
         var _loc1_:SWFColorTransformWithAlpha = new SWFColorTransformWithAlpha();
         _loc1_.hasAddTerms = hasAddTerms;
         _loc1_.hasMultTerms = hasMultTerms;
         _loc1_.rMult = rMult;
         _loc1_.gMult = gMult;
         _loc1_.bMult = bMult;
         _loc1_.aMult = this.aMult;
         _loc1_.rAdd = rAdd;
         _loc1_.gAdd = gAdd;
         _loc1_.bAdd = bAdd;
         _loc1_.aAdd = this.aAdd;
         return _loc1_;
      }
      
      override protected function _15015() : void
      {
         hasMultTerms = _15020 != 256 || _15019 != 256 || _15018 != 256 || _15017 != 256;
      }
      
      override protected function _15016() : void
      {
         hasAddTerms = _15024 != 0 || _15023 != 0 || _15022 != 0 || _15021 != 0;
      }
      
      override public function toString() : String
      {
         return "(" + rMult + "," + gMult + "," + bMult + "," + this.aMult + "," + rAdd + "," + gAdd + "," + bAdd + "," + this.aAdd + ")";
      }
   }
}

