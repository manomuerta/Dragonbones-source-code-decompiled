package egret.managers
{
   import egret.core.Injector;
   import egret.core.ns_egret;
   import egret.managers.impl.TranslatorImpl;
   
   use namespace ns_egret;
   
   public class Translator
   {
      private static var _impl:ITranslator;
      
      private static var localesMap:Object = {};
      
      public static var locale:String = "zh_CN";
      
      private static var initialized:Boolean = false;
      
      public function Translator()
      {
         super();
      }
      
      private static function get impl() : ITranslator
      {
         if(!_impl)
         {
            try
            {
               _impl = Injector.getInstance(ITranslator);
            }
            catch(e:Error)
            {
               _impl = new TranslatorImpl();
            }
         }
         return _impl;
      }
      
      ns_egret static function addLocale(param1:Class, param2:String) : void
      {
         if(initialized)
         {
            if(param2 == locale)
            {
               impl.addLocaleConfig(param1);
            }
            return;
         }
         var _loc3_:Array = localesMap[param2];
         if(!_loc3_)
         {
            _loc3_ = localesMap[param2] = [param1];
         }
         else
         {
            _loc3_.push(param1);
         }
      }
      
      private static function initialize() : void
      {
         var _loc2_:Class = null;
         initialized = true;
         var _loc1_:Array = localesMap[locale];
         if(!_loc1_)
         {
            return;
         }
         for each(_loc2_ in _loc1_)
         {
            impl.addLocaleConfig(_loc2_);
         }
      }
      
      public static function getText(param1:String, param2:Array = null) : String
      {
         if(!initialized)
         {
            initialize();
         }
         return impl.getText(param1,param2);
      }
      
      public static function addLocaleConfig(param1:*) : void
      {
         impl.addLocaleConfig(param1);
      }
   }
}

