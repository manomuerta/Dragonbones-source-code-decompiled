package _648
{
   import _11111._11110;
   import _1374.Alert;
   import egret.utils.FileUtil;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.filesystem.File;
   import flash.html.HTMLLoader;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   
   public class PluginModel
   {
      public var name:String = "unknown";
      
      public var path:Array;
      
      public var description:String = "nothing";
      
      public var author:String = "anonymous";
      
      public var version:String = "0.0.0";
      
      public var icon:String = "";
      
      public var type:String;
      
      public var enabled:int = 1;
      
      public var modificationDate:String = "";
      
      public var _5520:Boolean = true;
      
      public var _3668:Object;
      
      private var _5788:Function;
      
      private var loader:URLLoader;
      
      private var _5789:Function;
      
      private var html:HTMLLoader;
      
      private var _5790:int = 0;
      
      private var _5785:String;
      
      private var _5793:Array;
      
      public function PluginModel()
      {
         this.loader = new URLLoader();
         this._5793 = [];
         super();
      }
      
      public function _5585(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc2_:Object = JSON.parse(param1);
         this.name = _loc2_.name;
         this.path = [];
         for each(_loc3_ in _loc2_.path)
         {
            this.path.push(_loc3_);
         }
         this.description = _loc2_.description;
         this.author = _loc2_.author;
         this.version = _loc2_.version;
         this.icon = _loc2_.icon;
         this.enabled = 1;
         if(_loc2_.hasOwnProperty("modificationDate"))
         {
            this.modificationDate = _loc2_.modificationDate;
         }
      }
      
      public function _5586(param1:Object) : void
      {
         this.name = param1.name;
         this.path = param1.path;
         this.description = param1.description;
         this.author = param1.author;
         this.version = param1.version;
         this.type = param1.type;
         this.icon = param1.icon;
         this.enabled = param1.enabled;
         this.modificationDate = param1.modificationDate;
      }
      
      public function _5589(param1:String, param2:Function) : void
      {
         this._5789 = param2;
         var _loc3_:URLRequest = new URLRequest(param1);
         this.loader.addEventListener(Event.COMPLETE,this._5787);
         this.loader.addEventListener(ErrorEvent.ERROR,this._5786);
         this.loader.load(_loc3_);
      }
      
      private function _5787(param1:Event) : void
      {
         var json:Object = null;
         var e:Event = param1;
         this.loader.removeEventListener(Event.COMPLETE,this._5787);
         try
         {
            json = JSON.parse(e.currentTarget.data as String);
            if(Boolean(json.name) && Boolean(json.path))
            {
               this.name = json.name;
               this.path = json.path;
               if(json.description)
               {
                  this.description = json.description;
               }
               if(json.author)
               {
                  this.author = json.author;
               }
               if(json.version)
               {
                  this.version = json.version;
               }
               if(json.icon)
               {
                  this.icon = json.icon;
               }
               this.enabled = 1;
               json.modificationDate = this.modificationDate;
               this._5789(json);
            }
            else
            {
               Alert.show(tr("Plugin.formatError"));
            }
         }
         catch(error:Error)
         {
            Alert.show(tr("Plugin.formatError"));
         }
      }
      
      public function run(param1:Function) : void
      {
         var jsSDK:File;
         var str:String = null;
         var callback:Function = param1;
         if(!this.html)
         {
            try
            {
               this.html = new HTMLLoader();
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("PluginModel::run",e);
               return;
            }
         }
         if(!this.html)
         {
            _11110.instance._11204._11132("PluginModel::run");
            return;
         }
         this._5788 = callback;
         if(Boolean(this._3668) && Boolean(this.type))
         {
            this._5788(this);
            return;
         }
         this._5790 = 0;
         this._5793.length = 0;
         jsSDK = File.applicationStorageDirectory.resolvePath("plugins/egretPluginSdk.js");
         if(!jsSDK.exists)
         {
            jsSDK = File.applicationDirectory.resolvePath("plugins/egretPluginSdk.js");
            if(!jsSDK.exists)
            {
               jsSDK = File.applicationDirectory;
               jsSDK = new File(FileUtil.getDirectory(jsSDK.nativePath));
               jsSDK = jsSDK.resolvePath("doc").resolvePath("plugins/egretPluginSdk.js");
            }
         }
         for each(str in this.path)
         {
            this._5793.push("plugins/" + this.name + "/" + str);
         }
         this._5791(jsSDK.nativePath);
      }
      
      private function _5791(param1:String) : void
      {
         var jsLoader:URLLoader = null;
         var jsUrl:URLRequest = null;
         var url:String = param1;
         var file:File = File.applicationStorageDirectory.resolvePath(url);
         if(!file.exists)
         {
            Alert.show(tr("Plugin.NoPluginPath",this.wrap() + url));
            return;
         }
         try
         {
            jsLoader = new URLLoader();
            jsUrl = new URLRequest(File.applicationStorageDirectory.resolvePath(url).url);
            jsLoader.addEventListener(Event.COMPLETE,this._5783);
            jsLoader.dataFormat = URLLoaderDataFormat.TEXT;
            jsLoader.load(jsUrl);
         }
         catch(error:Error)
         {
            Alert.show(tr("Plugin.formatError"));
         }
      }
      
      private function _5783(param1:Event) : void
      {
         var _loc2_:String = param1.currentTarget.data as String;
         this.html.window.eval(_loc2_);
         this._5792(this._5793[0]);
      }
      
      private function _5792(param1:String) : void
      {
         var jsLoader:URLLoader = null;
         var jsUrl:URLRequest = null;
         var url:String = param1;
         var file:File = File.applicationStorageDirectory.resolvePath(url);
         if(!file.exists)
         {
            this._5520 = false;
            this._5788(this);
            return;
         }
         try
         {
            jsLoader = new URLLoader();
            jsUrl = new URLRequest(File.applicationStorageDirectory.resolvePath(url).url);
            jsLoader.addEventListener(Event.COMPLETE,this._5784);
            jsLoader.dataFormat = URLLoaderDataFormat.TEXT;
            jsLoader.load(jsUrl);
         }
         catch(error:Error)
         {
            Alert.show(tr("Plugin.formatError"));
         }
      }
      
      private function _5786(param1:ErrorEvent) : void
      {
         Alert.show(tr("Plugin.formatError"));
      }
      
      private function _5784(param1:Event) : void
      {
         var str:String = null;
         var e:Event = param1;
         ++this._5790;
         try
         {
            str = e.currentTarget.data as String;
            this.html.window.eval(str);
            if(this._5790 < this._5793.length)
            {
               this._5792(this._5793[this._5790]);
            }
            else
            {
               this._3668 = new this.html.window["main"]();
               this.type = this._3668.type();
               this._5788(this);
            }
         }
         catch(error:Error)
         {
            Alert.show(tr("Plugin.PluginDamaged"));
         }
      }
      
      public function _5599() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.name = this.name;
         _loc1_.path = this.path;
         _loc1_.description = this.description;
         _loc1_.author = this.author;
         _loc1_.version = this.version;
         _loc1_.type = this.type;
         _loc1_.icon = this.icon;
         _loc1_.enabled = this.enabled;
         _loc1_.modificationDate = this.modificationDate;
         return _loc1_;
      }
      
      private function wrap() : String
      {
         if(SystemInfo.isMacOS)
         {
            return "\n";
         }
         return "\r\n";
      }
   }
}

