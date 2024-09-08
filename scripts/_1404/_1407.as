package _1404
{
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class _1407
   {
      private static var mapClassDic:Dictionary = new Dictionary();
      
      private static var _15560:Dictionary = new Dictionary();
      
      private static var mapValueDic:Dictionary = new Dictionary(true);
      
      public function _1407()
      {
         super();
      }
      
      public static function mapClass(param1:Class) : void
      {
         var _loc2_:String = _9842(param1);
         mapClassDic[_loc2_] = param1;
      }
      
      public static function hasMapRule(param1:*) : Boolean
      {
         var _loc2_:String = _9842(param1);
         if(mapClassDic[_loc2_])
         {
            return true;
         }
         return false;
      }
      
      public static function getInstance(param1:*) : *
      {
         var returnClass:Class;
         var clazz:* = param1;
         var key:String = _9842(clazz);
         var instance:* = mapValueDic[key];
         if(instance)
         {
            return instance;
         }
         returnClass = mapClassDic[key] as Class;
         if(!returnClass)
         {
            if(clazz is Class)
            {
               returnClass = mapClassDic[key] = clazz;
            }
            else
            {
               try
               {
                  returnClass = getDefinitionByName(key) as Class;
               }
               catch(e:Error)
               {
               }
               if(returnClass)
               {
                  mapClassDic[key] = returnClass;
               }
            }
         }
         if(returnClass)
         {
            try
            {
               instance = new returnClass();
            }
            catch(e:Error)
            {
               return null;
            }
            mapValueDic[key] = instance;
            return instance;
         }
         return null;
      }
      
      private static function _9842(param1:*) : String
      {
         var _loc2_:String = _15560[param1];
         if(_loc2_)
         {
            return _loc2_;
         }
         if(param1 is Class)
         {
            _loc2_ = getQualifiedClassName(param1);
         }
         else
         {
            _loc2_ = param1.toString();
         }
         _loc2_ = _loc2_.split("::").join(".");
         _15560[param1] = _loc2_;
         return _loc2_;
      }
   }
}

