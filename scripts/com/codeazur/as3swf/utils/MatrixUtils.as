package com.codeazur.as3swf.utils
{
   import com.codeazur.as3swf.data.SWFMatrix;
   import flash.geom.Matrix;
   import flash.utils.ByteArray;
   
   public class MatrixUtils
   {
      public function MatrixUtils()
      {
         super();
      }
      
      public static function interpolate(param1:SWFMatrix, param2:SWFMatrix, param3:Number) : SWFMatrix
      {
         var _loc4_:SWFMatrix = null;
         (_loc4_ = new SWFMatrix()).scaleX = param1.scaleX + (param2.scaleX - param1.scaleX) * param3;
         _loc4_.scaleY = param1.scaleY + (param2.scaleY - param1.scaleY) * param3;
         _loc4_.rotateSkew0 = param1.rotateSkew0 + (param2.rotateSkew0 - param1.rotateSkew0) * param3;
         _loc4_.rotateSkew1 = param1.rotateSkew1 + (param2.rotateSkew1 - param1.rotateSkew1) * param3;
         _loc4_.translateX = param1.translateX + (param2.translateX - param1.translateX) * param3;
         _loc4_.translateY = param1.translateY + (param2.translateY - param1.translateY) * param3;
         return _loc4_;
      }
      
      public static function _15095(param1:ByteArray) : Matrix
      {
         var _loc2_:int = int(param1.readUnsignedByte());
         var _loc3_:* = _loc2_ & 1;
         var _loc4_:* = _loc2_ & 2;
         var _loc5_:* = _loc2_ & 4;
         if(!_loc3_ && !_loc4_ && !_loc5_)
         {
            return null;
         }
         var _loc6_:Number = 1;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 1;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         if(_loc3_)
         {
            _loc6_ = !!(_loc2_ & 0x10) ? Number(param1.readShort()) / 256 : param1.readFloat();
            _loc9_ = !!(_loc2_ & 0x10) ? Number(param1.readShort()) / 256 : param1.readFloat();
         }
         if(_loc4_)
         {
            _loc7_ = !!(_loc2_ & 0x20) ? Number(param1.readShort()) / 256 : param1.readFloat();
            _loc8_ = !!(_loc2_ & 0x20) ? Number(param1.readShort()) / 256 : param1.readFloat();
         }
         if(_loc5_)
         {
            _loc10_ = !!(_loc2_ & 0x40) ? Number(param1.readShort()) / 20 : param1.readFloat();
            _loc11_ = !!(_loc2_ & 0x40) ? Number(param1.readShort()) / 20 : param1.readFloat();
         }
         return new Matrix(_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_);
      }
   }
}

