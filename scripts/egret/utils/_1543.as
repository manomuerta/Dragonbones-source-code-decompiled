package egret.utils
{
   import avmplus.getQualifiedClassName;
   import flash.utils.ByteArray;
   
   public class _1543
   {
      public function _1543()
      {
         super();
      }
      
      public static function _10200(param1:*) : Boolean
      {
         if(param1 === undefined || param1 === null)
         {
            return false;
         }
         return Object.prototype.toString.call(param1) === "[object Object]";
      }
      
      public static function _10201(param1:Object, ... rest) : Object
      {
         var destination:Object = param1;
         var sources:Array = rest;
         sources.forEach(function(param1:*, param2:int, param3:Array):void
         {
            var _loc4_:String = null;
            for(_loc4_ in param1)
            {
               destination[_loc4_] = param1[_loc4_];
            }
         });
         return destination;
      }
      
      public static function _10202(param1:Object, param2:Object, param3:Boolean = true) : Object
      {
         var _loc4_:String = null;
         if(!_10200(param1))
         {
            return param2;
         }
         if(_10200(param2))
         {
            for(_loc4_ in param2)
            {
               if(param1.hasOwnProperty(_loc4_))
               {
                  if(param3)
                  {
                     if(_10200(param1[_loc4_]) && _10200(param2[_loc4_]))
                     {
                        _10202(param1[_loc4_],param2[_loc4_],param3);
                     }
                     else
                     {
                        param1[_loc4_] = param2[_loc4_];
                     }
                  }
               }
               else
               {
                  param1[_loc4_] = param2[_loc4_];
               }
            }
         }
         return param1;
      }
      
      public static function clone(param1:Object) : Object
      {
         if(!param1)
         {
            return null;
         }
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(param1);
         _loc2_.position = 0;
         return _loc2_.readObject();
      }
      
      public static function _10199(param1:Object) : int
      {
         var _loc3_:* = undefined;
         var _loc2_:int = 0;
         for(_loc3_ in param1)
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      public static function compare(param1:Object, param2:Object) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         if(param1 == param2)
         {
            return true;
         }
         if(getQualifiedClassName(param1) != getQualifiedClassName(param2))
         {
            return false;
         }
         if(param1 is Array)
         {
            if(param1.length != param2.length)
            {
               return false;
            }
            _loc3_ = 0;
            while(_loc3_ < param1.length)
            {
               if(!compare(param1[_loc3_],param2[_loc3_]))
               {
                  return false;
               }
               _loc3_++;
            }
         }
         else if(param1 is String || param1 is int || param1 is Number || param1 is uint)
         {
            if(param1 != param2)
            {
               return false;
            }
         }
         else if(param1 is Object)
         {
            _loc4_ = 0;
            _loc5_ = 0;
            for(_loc6_ in param1)
            {
               _loc4_++;
            }
            for(_loc6_ in param2)
            {
               _loc5_++;
            }
            if(_loc4_ != _loc5_)
            {
               return false;
            }
            for(_loc6_ in param1)
            {
               if(!param2.hasOwnProperty(_loc6_))
               {
                  return false;
               }
               _loc7_ = param1[_loc6_];
               _loc8_ = param2[_loc6_];
               if(!compare(_loc7_,_loc8_))
               {
                  return false;
               }
            }
         }
         return true;
      }
   }
}

