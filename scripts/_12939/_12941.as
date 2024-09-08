package _12939
{
   import _12933._12934;
   
   public class _12941
   {
      public static var items:Array = [];
      
      public function _12941()
      {
         super();
      }
      
      public static function _12945(param1:Array, param2:int, param3:int, param4:int, param5:int) : Array
      {
         var _loc6_:int = 0;
         while(_loc6_ < param5)
         {
            param1[param2][_loc6_ + param3] = param4;
            _loc6_++;
         }
         return param1;
      }
      
      public static function _13165(param1:String, param2:int) : String
      {
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            _loc3_ += param1;
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function _13069(param1:int, param2:int, param3:Object) : Array
      {
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < param2)
         {
            if(param3 is Array)
            {
               _loc4_[param1 + _loc5_] = copyArray(param3 as Array);
            }
            else
            {
               _loc4_[param1 + _loc5_] = param3;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public static function _13068(param1:Array, param2:Array) : Array
      {
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            param1.push(param2[_loc3_]);
            _loc3_++;
         }
         return param1;
      }
      
      public static function _13130(param1:Array) : Array
      {
         var _loc3_:String = null;
         var _loc2_:Array = new Array();
         for(_loc3_ in param1)
         {
            _loc2_[_loc3_] = _12941.copyArray(param1[_loc3_]);
         }
         return _loc2_;
      }
      
      public static function copyArray(param1:Array) : Array
      {
         var _loc3_:* = undefined;
         var _loc2_:Array = new Array();
         for each(_loc3_ in param1)
         {
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
      
      public static function _13078(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : _12934
      {
         var _loc7_:_12934 = null;
         var _loc8_:_12934 = null;
         for each(_loc7_ in items)
         {
            if(_loc7_.pad == param6)
            {
               if(_loc7_._13148 == param5)
               {
                  if(_loc7_.mm == param1)
                  {
                     if(_loc7_._13147 == param2)
                     {
                        if(_loc7_._13152 == param3)
                        {
                           if(_loc7_._13151 == param4)
                           {
                              return _loc7_;
                           }
                        }
                     }
                  }
               }
            }
         }
         _loc8_ = _12934._13143(param1,param2,param3,param4,param5,param6);
         items.unshift(_loc8_);
         return _loc8_;
      }
   }
}

