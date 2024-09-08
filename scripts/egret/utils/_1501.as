package egret.utils
{
   import flash.desktop.NativeApplication;
   
   public class _1501
   {
      private static var _10084:String;
      
      private static var _10083:String;
      
      private static const SEPARATOR:String = ".";
      
      public function _1501()
      {
         super();
      }
      
      public static function get currentVersion() : String
      {
         if(_10084)
         {
            return _10084;
         }
         var _loc1_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc2_:Namespace = _loc1_.namespace();
         _10084 = _loc1_._loc2_::versionNumber[0].toString();
         return _10084;
      }
      
      public static function get currentVersionLabel() : String
      {
         if(_10083)
         {
            return _10083;
         }
         var _loc1_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc2_:Namespace = _loc1_.namespace();
         if(_loc1_._loc2_::versionLabel[0])
         {
            _10083 = _loc1_._loc2_::versionLabel[0].toString();
         }
         else
         {
            _10083 = "";
         }
         return _10083;
      }
      
      public static function compareVersion(param1:String, param2:String) : Boolean
      {
         var _loc3_:Array = parseVersion(param1);
         var _loc4_:Array = parseVersion(param2);
         if(_loc3_[0] < _loc4_[0])
         {
            return true;
         }
         if(_loc3_[0] == _loc4_[0] && _loc3_[1] < _loc4_[1])
         {
            return true;
         }
         if(_loc3_[0] == _loc4_[0] && _loc3_[1] == _loc4_[1] && _loc3_[2] < _loc4_[2])
         {
            return true;
         }
         if(_loc3_[0] == _loc4_[0] && _loc3_[1] == _loc4_[1] && _loc3_[2] == _loc4_[2])
         {
            if(String(_loc3_[3]).localeCompare(String(_loc4_[3])) < 0)
            {
               return true;
            }
         }
         return false;
      }
      
      private static function parseVersion(param1:String) : Array
      {
         var s:String;
         var startWith:Function;
         var endWith:Function;
         var elements:Array;
         var elementSize:int;
         var numbers:Vector.<int>;
         var versionId:String = param1;
         var result:Array = [0,0,0,""];
         if(versionId == null)
         {
            return result;
         }
         s = StringUtil.trim(versionId);
         startWith = function(param1:String, param2:String):Boolean
         {
            if(param1 === null || param2 === null)
            {
               return param1 === null && param2 === null;
            }
            if(param2.length > param1.length)
            {
               return false;
            }
            if(param1.indexOf(param2) == 0)
            {
               return true;
            }
            return false;
         };
         endWith = function(param1:String, param2:String):Boolean
         {
            if(param1 === null || param2 === null)
            {
               return param1 === null && param2 === null;
            }
            if(param2.length > param1.length)
            {
               return false;
            }
            if(param1.lastIndexOf(param2) == param1.length - param2.length)
            {
               return true;
            }
            return false;
         };
         if(s == "")
         {
            return result;
         }
         if(startWith(s,SEPARATOR))
         {
            return result;
         }
         if(endWith(s,SEPARATOR))
         {
            return result;
         }
         if(s.indexOf(SEPARATOR + SEPARATOR) != -1)
         {
            return result;
         }
         elements = s.split(SEPARATOR);
         elementSize = int(elements.length);
         if(elementSize <= 0)
         {
            return result;
         }
         if(elementSize > 4)
         {
            return result;
         }
         numbers = Vector.<int>([0,0,0]);
         if(isNaN(elements[0]))
         {
            return result;
         }
         numbers[0] = int(elements[0]);
         if(numbers[0] < 0)
         {
            return result;
         }
         if(elementSize >= 2)
         {
            if(isNaN(elements[1]))
            {
               return result;
            }
            numbers[1] = int(elements[1]);
            if(numbers[1] < 0)
            {
               return result;
            }
         }
         if(elementSize >= 3)
         {
            if(isNaN(elements[2]))
            {
               return result;
            }
            numbers[2] = int(elements[2]);
            if(numbers[2] < 0)
            {
               return result;
            }
         }
         result[0] = numbers[0];
         result[1] = numbers[1];
         result[2] = numbers[2];
         if(elementSize >= 4)
         {
            result[3] = String(elements[3]);
         }
         else
         {
            result[3] = "";
         }
         return result;
      }
   }
}

