package locales
{
   import egret.core.ns_egret;
   import egret.managers.Translator;
   
   use namespace ns_egret;
   
   public class _1555
   {
      private static var zh_CN:Class = _1555_zh_CN;
      
      private static var en_US:Class = _1555_en_US;
      
      private static var ru_RF:Class = _1555_ru_RF;
      
      private static var uk_UA:Class = _1555_uk_UA;
      
      public function _1555()
      {
         super();
      }
      
      public static function init() : void
      {
         Translator.ns_egret::addLocale(zh_CN,"zh_CN");
         Translator.ns_egret::addLocale(en_US,"en_US");
         Translator.ns_egret::addLocale(ru_RF,"ru_RF");
         Translator.ns_egret::addLocale(uk_UA,"uk_UA");
      }
   }
}

