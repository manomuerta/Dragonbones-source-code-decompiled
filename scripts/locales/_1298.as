package locales
{
   import egret.core.ns_egret;
   import egret.managers.Translator;
   
   use namespace ns_egret;
   
   public class _1298
   {
      private static var zh_CN:Class = _1298_zh_CN;
      
      private static var en_US:Class = _1298_en_US;
      
      public function _1298()
      {
         super();
      }
      
      public static function init() : void
      {
         Translator.ns_egret::addLocale(zh_CN,"zh_CN");
         Translator.ns_egret::addLocale(en_US,"en_US");
      }
   }
}

