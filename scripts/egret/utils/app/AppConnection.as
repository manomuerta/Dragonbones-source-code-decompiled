package egret.utils.app
{
   import egret.utils.FileUtil;
   import egret.utils.SystemInfo;
   import flash.desktop.NativeApplication;
   import flash.events.EventDispatcher;
   import flash.events.StatusEvent;
   import flash.filesystem.File;
   import flash.net.LocalConnection;
   import flash.utils.setTimeout;
   
   public class AppConnection extends EventDispatcher
   {
      private static var instance:AppConnection;
      
      private var localConnection:LocalConnection;
      
      private var messages:Array;
      
      private var sendingMessage:Object;
      
      public function AppConnection()
      {
         this.messages = [];
         super();
      }
      
      public static function get eventDispatcher() : EventDispatcher
      {
         return instance;
      }
      
      public static function initialize() : void
      {
         if(instance)
         {
            return;
         }
         instance = new AppConnection();
         instance.initialize();
      }
      
      public static function get appManagerPath() : String
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         if(SystemInfo.isMacOS)
         {
            return "/Library/Egret/EgretAppManager.app/Contents/Resources/";
         }
         _loc1_ = FileUtil.escapePath(File.userDirectory.nativePath);
         _loc2_ = _loc1_.substring(0,_loc1_.indexOf("/"));
         return _loc2_ + "/Program Files/Common Files/Egret/EgretAppManager/";
      }
      
      public static function sendToManager(param1:String, ... rest) : void
      {
         var _send:Function = null;
         var tryTimes:int = 0;
         var onSend:Function = null;
         var messageName:String = param1;
         var args:Array = rest;
         if(!instance.openAppManager())
         {
            return;
         }
         _send = function():void
         {
            var _loc1_:Array = [];
            _loc1_.push("EgretAppManager");
            _loc1_.push(messageName);
            _loc1_ = _loc1_.concat(args);
            AppConnection.send.apply(null,_loc1_);
         };
         tryTimes = 0;
         onSend = function(param1:AppConnectionEvent):void
         {
            if(param1.appID != "EgretAppManager" || param1.messageName != messageName)
            {
               return;
            }
            ++tryTimes;
            if(!param1.result && tryTimes < 20)
            {
               setTimeout(_send,100);
            }
            else
            {
               eventDispatcher.removeEventListener(AppConnectionEvent.SEND,onSend);
            }
         };
         eventDispatcher.addEventListener(AppConnectionEvent.SEND,onSend);
         setTimeout(_send,100);
      }
      
      public static function send(param1:String, param2:String, ... rest) : void
      {
         if(!instance)
         {
            initialize();
         }
         var _loc4_:Object = {
            "appID":param1,
            "messageName":param2,
            "args":rest
         };
         if(instance.sendingMessage)
         {
            instance.messages.push(_loc4_);
         }
         else
         {
            instance.sendingMessage = _loc4_;
            instance.localConnection.send("_" + param1,"handle",param2,rest);
         }
      }
      
      private function initialize() : void
      {
         this.localConnection = new LocalConnection();
         this.localConnection.allowDomain("*");
         this.localConnection.client = this;
         this.localConnection.addEventListener(StatusEvent.STATUS,this.onStatus);
         try
         {
            this.localConnection.connect("_" + NativeApplication.nativeApplication.applicationID);
         }
         catch(error:Error)
         {
         }
         this.addEventListener(AppConnectionEvent.RECEIVE,this.onReceive);
      }
      
      protected function onReceive(param1:AppConnectionEvent) : void
      {
         if(param1.messageName == "exit")
         {
            NativeApplication.nativeApplication.exit();
         }
      }
      
      protected function onStatus(param1:StatusEvent) : void
      {
         var _loc2_:Boolean = false;
         if(param1.level == "error")
         {
            _loc2_ = false;
         }
         else
         {
            _loc2_ = true;
         }
         var _loc3_:String = this.sendingMessage.messageName;
         var _loc4_:String = this.sendingMessage.appID;
         var _loc5_:Array = this.sendingMessage.args;
         var _loc6_:AppConnectionEvent;
         (_loc6_ = new AppConnectionEvent(AppConnectionEvent.SEND,_loc3_,_loc5_)).appID = _loc4_;
         _loc6_.result = _loc2_;
         eventDispatcher.dispatchEvent(_loc6_);
         this.sendingMessage = null;
         if(this.messages.length > 0)
         {
            this.sendingMessage = this.messages.shift();
            this.localConnection.send("_" + this.sendingMessage.appID,"handle",this.sendingMessage.messageName,this.sendingMessage.args);
         }
      }
      
      private function openAppManager() : Boolean
      {
         var file:File;
         var path:String = "";
         if(SystemInfo.isMacOS)
         {
            path = new File(appManagerPath).parent.parent.nativePath + "/";
         }
         else
         {
            path = appManagerPath + "EgretAppManager.exe";
         }
         file = new File(path);
         try
         {
            file.openWithDefaultApplication();
         }
         catch(error:Error)
         {
            return false;
         }
         return true;
      }
      
      public function handle(param1:String, param2:Array) : void
      {
         var _loc3_:AppConnectionEvent = new AppConnectionEvent(AppConnectionEvent.RECEIVE,param1,param2);
         eventDispatcher.dispatchEvent(_loc3_);
      }
   }
}

