package _11910
{
   import _11845._11949;
   import flash.filters.ColorMatrixFilter;
   
   public class _11916 extends _11922
   {
      public static const API:Number = 2;
      
      private static var _12287:Array = [];
      
      protected static var _12329:Array = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
      
      protected static var _12332:Number = 0.212671;
      
      protected static var _12333:Number = 0.71516;
      
      protected static var _12331:Number = 0.072169;
      
      protected var _matrix:Array;
      
      protected var _12325:_11920;
      
      public function _11916()
      {
         super("colorMatrixFilter");
      }
      
      public static function _12046(param1:Array, param2:Number, param3:Number = 1) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         if(isNaN(param3))
         {
            param3 = 1;
         }
         var _loc4_:Number = (param2 >> 16 & 0xFF) / 255;
         var _loc5_:Number = (param2 >> 8 & 0xFF) / 255;
         var _loc6_:Number = (param2 & 0xFF) / 255;
         var _loc7_:Number = 1 - param3;
         var _loc8_:Array = [_loc7_ + param3 * _loc4_ * _12332,param3 * _loc4_ * _12333,param3 * _loc4_ * _12331,0,0,param3 * _loc5_ * _12332,_loc7_ + param3 * _loc5_ * _12333,param3 * _loc5_ * _12331,0,0,param3 * _loc6_ * _12332,param3 * _loc6_ * _12333,_loc7_ + param3 * _loc6_ * _12331,0,0,0,0,0,1,0];
         return _12328(_loc8_,param1);
      }
      
      public static function _12326(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         var _loc3_:Array = [_12332 * 256,_12333 * 256,_12331 * 256,0,-256 * param2,_12332 * 256,_12333 * 256,_12331 * 256,0,-256 * param2,_12332 * 256,_12333 * 256,_12331 * 256,0,-256 * param2,0,0,0,1,0];
         return _12328(_loc3_,param1);
      }
      
      public static function _12330(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         param2 *= Math.PI / 180;
         var _loc3_:Number = Math.cos(param2);
         var _loc4_:Number = Math.sin(param2);
         var _loc5_:Array = [_12332 + _loc3_ * (1 - _12332) + _loc4_ * -_12332,_12333 + _loc3_ * -_12333 + _loc4_ * -_12333,_12331 + _loc3_ * -_12331 + _loc4_ * (1 - _12331),0,0,_12332 + _loc3_ * -_12332 + _loc4_ * 0.143,_12333 + _loc3_ * (1 - _12333) + _loc4_ * 0.14,_12331 + _loc3_ * -_12331 + _loc4_ * -0.283,0,0,_12332 + _loc3_ * -_12332 + _loc4_ * -(1 - _12332),_12333 + _loc3_ * -_12333 + _loc4_ * _12333,_12331 + _loc3_ * (1 - _12331) + _loc4_ * _12331,0,0,0,0,0,1,0,0,0,0,0,1];
         return _12328(_loc5_,param1);
      }
      
      public static function _12324(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         param2 = param2 * 100 - 100;
         return _12328([1,0,0,0,param2,0,1,0,0,param2,0,0,1,0,param2,0,0,0,1,0,0,0,0,0,1],param1);
      }
      
      public static function _12323(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         var _loc3_:Number = 1 - param2;
         var _loc4_:Number = _loc3_ * _12332;
         var _loc5_:Number = _loc3_ * _12333;
         var _loc6_:Number = _loc3_ * _12331;
         var _loc7_:Array = [_loc4_ + param2,_loc5_,_loc6_,0,0,_loc4_,_loc5_ + param2,_loc6_,0,0,_loc4_,_loc5_,_loc6_ + param2,0,0,0,0,0,1,0];
         return _12328(_loc7_,param1);
      }
      
      public static function _12327(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         param2 += 0.01;
         var _loc3_:Array = [param2,0,0,0,128 * (1 - param2),0,param2,0,0,128 * (1 - param2),0,0,param2,0,128 * (1 - param2),0,0,0,1,0];
         return _12328(_loc3_,param1);
      }
      
      public static function _12328(param1:Array, param2:Array) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!(param1 is Array) || !(param2 is Array))
         {
            return param2;
         }
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < 4)
         {
            _loc7_ = 0;
            while(_loc7_ < 5)
            {
               _loc5_ = _loc7_ == 4 ? int(param1[_loc4_ + 4]) : 0;
               _loc3_[_loc4_ + _loc7_] = param1[_loc4_] * param2[_loc7_] + param1[_loc4_ + 1] * param2[_loc7_ + 5] + param1[_loc4_ + 2] * param2[_loc7_ + 10] + param1[_loc4_ + 3] * param2[_loc7_ + 15] + _loc5_;
               _loc7_ += 1;
            }
            _loc4_ += 5;
            _loc6_ += 1;
         }
         return _loc3_;
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         var _loc4_:Object = param2;
         _12286(param1,{
            "remove":param2.remove,
            "index":param2.index,
            "addFilter":param2.addFilter
         },param3,ColorMatrixFilter,new ColorMatrixFilter(_12329.slice()),_12287);
         if(_filter == null)
         {
            return true;
         }
         this._matrix = ColorMatrixFilter(_filter).matrix;
         var _loc5_:Array = [];
         if(_loc4_.matrix != null && _loc4_.matrix is Array)
         {
            _loc5_ = _loc4_.matrix;
         }
         else
         {
            if(_loc4_.relative == true)
            {
               _loc5_ = this._matrix.slice();
            }
            else
            {
               _loc5_ = _12329.slice();
            }
            _loc5_ = _12324(_loc5_,_loc4_.brightness);
            _loc5_ = _12327(_loc5_,_loc4_.contrast);
            _loc5_ = _12330(_loc5_,_loc4_.hue);
            _loc5_ = _12323(_loc5_,_loc4_.saturation);
            _loc5_ = _12326(_loc5_,_loc4_.threshold);
            if(!isNaN(_loc4_._12046))
            {
               _loc5_ = _12046(_loc5_,_loc4_._12046,_loc4_.amount);
            }
         }
         this._12325 = new _11920();
         this._12325._init(this._matrix,_loc5_);
         return true;
      }
      
      override public function setRatio(param1:Number) : void
      {
         this._12325.setRatio(param1);
         ColorMatrixFilter(_filter).matrix = this._matrix;
         super.setRatio(param1);
      }
   }
}

