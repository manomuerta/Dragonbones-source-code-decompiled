package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class SWFMatrix
   {
      public var scaleX:Number = 1;
      
      public var _15030:Number;
      
      public var scaleY:Number = 1;
      
      public var _15029:Number;
      
      public var rotateSkew0:Number = 0;
      
      public var _15026:Number = 0;
      
      public var rotateSkew1:Number = 0;
      
      public var _15027:Number = 0;
      
      public var translateX:int = 0;
      
      public var translateY:int = 0;
      
      public var xscale:Number;
      
      public var yscale:Number;
      
      public var rotation:Number;
      
      public function SWFMatrix(param1:SWFData = null)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      public function get matrix() : Matrix
      {
         return new Matrix(this.scaleX,this.rotateSkew0,this.rotateSkew1,this.scaleY,this.translateX,this.translateY);
      }
      
      public function get _15028() : Matrix
      {
         return new Matrix(this._15030,this._15026,this._15027,this._15029,this.translateX,this.translateY);
      }
      
      public function parse(param1:SWFData) : void
      {
         var _loc2_:Array = null;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         param1.resetBitsPending();
         this.scaleX = 1;
         this.scaleY = 1;
         this._15030 = 65536;
         this._15029 = 65536;
         if(param1.readUB(1) == 1)
         {
            _loc5_ = param1.readUB(5);
            _loc2_ = param1._15025(_loc5_);
            this._15030 = _loc2_[0];
            this.scaleX = _loc2_[1];
            _loc2_ = param1._15025(_loc5_);
            this._15029 = _loc2_[0];
            this.scaleY = _loc2_[1];
         }
         this.rotateSkew0 = 0;
         this.rotateSkew1 = 0;
         this._15026 = 0;
         this._15027 = 0;
         if(param1.readUB(1) == 1)
         {
            _loc6_ = param1.readUB(5);
            _loc2_ = param1._15025(_loc6_);
            this._15026 = _loc2_[0];
            this.rotateSkew0 = _loc2_[1];
            _loc2_ = param1._15025(_loc6_);
            this._15027 = _loc2_[0];
            this.rotateSkew1 = _loc2_[1];
         }
         var _loc3_:uint = param1.readUB(5);
         this.translateX = param1.readSB(_loc3_);
         this.translateY = param1.readSB(_loc3_);
         var _loc4_:Point = this.matrix.deltaTransformPoint(new Point(0,1));
         this.rotation = 180 / Math.PI * Math.atan2(_loc4_.y,_loc4_.x) - 90;
         if(this.rotation < 0)
         {
            this.rotation = 360 + this.rotation;
         }
         this.xscale = Math.sqrt(this.scaleX * this.scaleX + this.rotateSkew0 * this.rotateSkew0);
         if(this.scaleX < 0)
         {
            this.xscale = -this.xscale;
         }
         this.yscale = Math.sqrt(this.rotateSkew1 * this.rotateSkew1 + this.scaleY * this.scaleY);
         if(this.scaleY < 0)
         {
            this.yscale = -this.yscale;
         }
      }
      
      public function clone() : SWFMatrix
      {
         var _loc1_:SWFMatrix = new SWFMatrix();
         _loc1_.scaleX = this.scaleX;
         _loc1_.scaleY = this.scaleY;
         _loc1_.rotateSkew0 = this.rotateSkew0;
         _loc1_.rotateSkew1 = this.rotateSkew1;
         _loc1_.translateX = this.translateX;
         _loc1_.translateY = this.translateY;
         return _loc1_;
      }
      
      public function isIdentity() : Boolean
      {
         return this.scaleX == 1 && this.scaleY == 1 && this.rotateSkew0 == 0 && this.rotateSkew1 == 0 && this.translateX == 0 && this.translateY == 0;
      }
      
      public function toString() : String
      {
         return "(" + this.scaleX + "," + this.rotateSkew0 + "," + this.rotateSkew1 + "," + this.scaleY + "," + this.translateX + "," + this.translateY + ")";
      }
   }
}

