package _1529
{
   import egret.managers.Translator;
   import egret.utils.StringUtil;
   import flash.system.Capabilities;
   
   public class _1528
   {
      public static const LANGUAGE_AUTO:uint = 0;
      
      public static const LANGUAGE_CONFIG:uint = 1;
      
      private static var _10170:String = "en_US";
      
      public function _1528()
      {
         super();
      }
      
      public static function init(param1:uint) : void
      {
         var _loc4_:String = null;
         var _loc2_:String = "locales/language.xml";
         LanguageConfig.getInstance().loadConfig(_loc2_);
         if(param1 == LANGUAGE_AUTO)
         {
            _loc4_ = Capabilities.languages[0];
            switch(Capabilities.language)
            {
               case "zh-CN":
               case "zh-TW":
                  _10170 = _1530.zh_CN;
                  break;
               default:
                  _10170 = _1530.en_US;
            }
         }
         else if(param1 == LANGUAGE_CONFIG)
         {
            _10170 = LanguageConfig.getInstance().language;
            if(StringUtil.trim(_10170) == "")
            {
               init(LANGUAGE_AUTO);
               return;
            }
         }
         var _loc3_:XML = LanguageConfig.getInstance().getLanguagePackage(_10170);
         Translator.addLocaleConfig(_loc3_);
         Translator.locale = _10170;
      }
      
      public static function get language() : String
      {
         return _10170;
      }
      
      public static function set language(param1:String) : void
      {
         LanguageConfig.getInstance().language = param1;
      }
      
      public static function _12894(param1:String) : void
      {
         _10170 = param1;
         var _loc2_:XML = LanguageConfig.getInstance().getLanguagePackage(_10170);
         Translator.addLocaleConfig(_loc2_);
         Translator.locale = _10170;
      }
   }
}

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

class LanguageConfig
{
   private static var instance:LanguageConfig;
   
   private var relativePath:String;
   
   private var config:XML;
   
   private var configLoaded:Boolean = false;
   
   public function LanguageConfig()
   {
      super();
   }
   
   public static function getInstance() : LanguageConfig
   {
      if(!instance)
      {
         instance = new LanguageConfig();
      }
      return instance;
   }
   
   public function loadConfig(param1:String) : void
   {
      var _loc3_:FileStream = null;
      if(this.configLoaded)
      {
         return;
      }
      this.relativePath = param1;
      var _loc2_:File = File.applicationDirectory.resolvePath(this.relativePath);
      if(_loc2_.exists)
      {
         _loc3_ = new FileStream();
         _loc3_.open(_loc2_,FileMode.READ);
         this.config = new XML(_loc3_.readUTFBytes(_loc3_.bytesAvailable));
         _loc3_.close();
         this.configLoaded = true;
         return;
      }
      throw new Error("语言配置文件加载失败");
   }
   
   public function get language() : String
   {
      return this.config.child("language")[0].toString();
   }
   
   public function set language(param1:String) : void
   {
      var _loc2_:XML = this.config.child("language")[0];
      _loc2_.setChildren(new XML(param1));
      var _loc3_:FileStream = new FileStream();
      _loc3_.open(new File(File.applicationDirectory.resolvePath(this.relativePath).nativePath),FileMode.WRITE);
      _loc3_.writeUTFBytes(this.config.toXMLString());
      _loc3_.close();
   }
   
   public function getAllLanguage() : Array
   {
      var _loc3_:XML = null;
      var _loc1_:XMLList = this.config.child("package");
      var _loc2_:Array = [];
      for each(_loc3_ in _loc1_.children())
      {
         _loc2_.push(_loc3_.@name.toString());
      }
      return _loc2_;
   }
   
   public function getLanguagePackage(param1:String) : XML
   {
      var _loc3_:XML = null;
      var _loc4_:File = null;
      var _loc5_:FileStream = null;
      var _loc6_:String = null;
      var _loc2_:XMLList = this.config.child("package");
      for each(_loc3_ in _loc2_.children())
      {
         if(_loc3_.@name.toString() == param1)
         {
            _loc4_ = File.applicationDirectory.resolvePath(_loc3_.@path.toString());
            if(_loc4_.exists)
            {
               _loc5_ = new FileStream();
               _loc5_.open(_loc4_,FileMode.READ);
               _loc6_ = _loc5_.readUTFBytes(_loc5_.bytesAvailable);
               _loc5_.close();
               return new XML(_loc6_);
            }
            break;
         }
      }
      return null;
   }
}

