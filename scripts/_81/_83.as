package _81
{
   import flash.geom.ColorTransform;
   
   public class _83 extends ColorTransform
   {
      public static var _1920:_83 = new _83();
      
      public function _83(param1:Number = 1, param2:Number = 1, param3:Number = 1, param4:Number = 1)
      {
         super(param1,param2,param3,param4,0,0,0,0);
      }
      
      public static function _1712(param1:ColorTransform) : _83
      {
         return new _83(param1.redMultiplier,param1.greenMultiplier,param1.blueMultiplier,param1.alphaMultiplier);
      }
      
      public function copyFrom(param1:_83) : _83
      {
         redMultiplier = param1.redMultiplier;
         greenMultiplier = param1.greenMultiplier;
         blueMultiplier = param1.blueMultiplier;
         alphaMultiplier = param1.alphaMultiplier;
         return this;
      }
      
      public function _2183(param1:_83) : _83
      {
         redMultiplier = param1.redMultiplier;
         greenMultiplier = param1.greenMultiplier;
         blueMultiplier = param1.blueMultiplier;
         return this;
      }
      
      public function clone() : _83
      {
         var _loc1_:_83 = new _83();
         _loc1_.copyFrom(this);
         return _loc1_;
      }
      
      public function add(param1:_83) : void
      {
         redMultiplier += param1.redMultiplier;
         greenMultiplier += param1.greenMultiplier;
         blueMultiplier += param1.blueMultiplier;
         alphaMultiplier += param1.alphaMultiplier;
      }
      
      public function _1930(param1:_83) : void
      {
         redMultiplier -= param1.redMultiplier;
         greenMultiplier -= param1.greenMultiplier;
         blueMultiplier -= param1.blueMultiplier;
         alphaMultiplier -= param1.alphaMultiplier;
      }
      
      public function _1929(param1:Number) : void
      {
         redMultiplier *= param1;
         greenMultiplier *= param1;
         blueMultiplier *= param1;
         alphaMultiplier *= param1;
      }
      
      public function _2196(param1:_83) : Boolean
      {
         return redMultiplier == param1.redMultiplier && greenMultiplier == param1.greenMultiplier && blueMultiplier == param1.blueMultiplier && alphaMultiplier == param1.alphaMultiplier;
      }
      
      public function _1928() : Boolean
      {
         return redMultiplier == 0 && greenMultiplier == 0 && blueMultiplier == 0 && alphaMultiplier == 0;
      }
      
      public function get _2184() : uint
      {
         return uint(blueMultiplier * 255) + uint(greenMultiplier * 255) * 256 + uint(redMultiplier * 255) * 65536;
      }
      
      public function clear() : void
      {
         redMultiplier = 1;
         greenMultiplier = 1;
         blueMultiplier = 1;
         alphaMultiplier = 1;
         redOffset = 0;
         greenOffset = 0;
         blueOffset = 0;
         alphaOffset = 0;
      }
   }
}

