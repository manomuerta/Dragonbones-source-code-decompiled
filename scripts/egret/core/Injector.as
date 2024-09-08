package egret.core
{
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class Injector
   {
      private static var mapClassDic:Dictionary = new Dictionary();
      
      private static var mapValueDic:Dictionary = new Dictionary();
      
      public function Injector()
      {
         super();
      }
      
      public static function mapClass(param1:Object, param2:Class, param3:String = "") : void
      {
         var _loc4_:String = getKey(param1) + "#" + param3;
         mapClassDic[_loc4_] = param2;
      }
      
      private static function getKey(param1:Object) : String
      {
         if(param1 is String)
         {
            return param1 as String;
         }
         return getQualifiedClassName(param1);
      }
      
      public static function mapValue(param1:Object, param2:Object, param3:String = "") : void
      {
         var _loc4_:String = getKey(param1) + "#" + param3;
         mapValueDic[_loc4_] = param2;
      }
      
      public static function hasMapRule(param1:Object, param2:String = "") : Boolean
      {
         var _loc3_:String = getKey(param1) + "#" + param2;
         if(Boolean(mapValueDic[_loc3_]) || Boolean(mapClassDic[_loc3_]))
         {
            return true;
         }
         return false;
      }
      
      public static function getInstance(param1:Object, param2:String = "") : *
      {
         var _loc5_:* = undefined;
         var _loc3_:String = getKey(param1) + "#" + param2;
         if(mapValueDic[_loc3_])
         {
            return mapValueDic[_loc3_];
         }
         var _loc4_:Class = mapClassDic[_loc3_] as Class;
         if(_loc4_)
         {
            _loc5_ = new _loc4_();
            mapValueDic[_loc3_] = _loc5_;
            delete mapClassDic[_loc3_];
            return _loc5_;
         }
         throw new Error("调用了未配置的注入规则！Class#named:" + _loc3_ + "。 请先在项目初始化里配置指定的注入规则，再调用对应单例。");
      }
      
      public static function getClass(param1:Object, param2:String = "") : Class
      {
         var _loc3_:String = getKey(param1) + "#" + param2;
         var _loc4_:Class = mapClassDic[_loc3_] as Class;
         if(_loc4_)
         {
            return _loc4_;
         }
         throw new Error("调用了未配置的注入规则！Class#named:" + _loc3_ + "。 请先在项目初始化里配置指定的注入规则，再获取对应类定义。");
      }
   }
}

