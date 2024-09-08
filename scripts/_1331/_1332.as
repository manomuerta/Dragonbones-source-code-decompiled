package _1331
{
   import _10648._10647;
   import egret.core.ns_egret;
   import egret.utils.SystemInfo;
   import egret.utils._1549;
   import egret.utils.tr;
   import flash.desktop.NativeApplication;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   
   use namespace ns_egret;
   
   public class _1332 extends EventDispatcher
   {
      private static var _instance:_1332;
      
      private static var _12035:Number = 0;
      
      private static var _12896:Boolean = false;
      
      private var _9218:_1549;
      
      private var timer:Timer;
      
      public function _1332()
      {
         this.timer = new Timer(1000 * 60 * 10);
         super();
         this._5592();
      }
      
      public static function get _3766() : Boolean
      {
         return _12896;
      }
      
      public static function set _3766(param1:Boolean) : void
      {
         _12896 = param1;
      }
      
      public static function start() : void
      {
         instance.start();
      }
      
      public static function get instance() : _1332
      {
         if(!_instance)
         {
            _instance = new _1332();
         }
         return _instance;
      }
      
      public function get _3755() : _1549
      {
         return this._9218;
      }
      
      private function start() : void
      {
         this._9217("open");
         this.timer.addEventListener(TimerEvent.TIMER,this._9215);
         this.timer.start();
         NativeApplication.nativeApplication.addEventListener(Event.EXITING,this._9216,false,-2048);
      }
      
      private function _9216(param1:Event) : void
      {
         var event:Event = param1;
         if(event.cancelable && !event.isDefaultPrevented())
         {
            event.preventDefault();
            this._9217("close");
            setTimeout(function():void
            {
               NativeApplication.nativeApplication.exit();
            },100);
         }
      }
      
      private function _9215(param1:TimerEvent) : void
      {
         this._9217();
      }
      
      public function login(param1:String, param2:String, param3:int = 1, param4:Function = null) : void
      {
         var protocolLogin:_1337;
         var username:String = param1;
         var password:String = param2;
         var type:int = param3;
         var callback:Function = param4;
         this._3755.set("username",username);
         this._3755.set("password",password);
         protocolLogin = new _1337();
         protocolLogin.serverURL = _1335.DBUSER_LOGIN;
         protocolLogin.account = username;
         protocolLogin.password = password;
         protocolLogin._12691 = this._3755.get("uuid");
         protocolLogin.type = type;
         protocolLogin.request(function(param1:Object):void
         {
            var statistics:String = null;
            var token:String = null;
            var base64Encode:String = null;
            var realkey:String = null;
            var dec:String = null;
            var protocolInformServerInstall:_10651 = null;
            var data:Object = param1;
            if(data)
            {
               if(data["code"] == 0)
               {
                  _12035 = new Date().time;
                  _12896 = true;
                  _3755.set("uid",data["data"]["user"]["uid"]);
                  _3755.set("nickname",data["data"]["user"]["nickname"]);
                  _3755.set("enc_ucid",data["data"]["user"]["enc_ucid"]);
                  statistics = data["data"]["user"]["statistics"];
                  _3755.set("statistics",statistics);
                  token = data["data"]["user"]["token"];
                  _3755.set("token",token);
                  _3755.set("level",data["data"]["user"]["level"]);
                  _3755.set("paid",data["data"]["user"]["paid"]);
                  base64Encode = _1333.decode(token);
                  realkey = statistics.slice(7,23);
                  _10647.size(256);
                  dec = _10647.dec(base64Encode,realkey);
                  _3755.set("decodetoken",dec);
                  dispatchEvent(new ProtocolEvent(ProtocolEvent.LOGIN_COMPLETE,data));
                  protocolInformServerInstall = new _10651();
                  protocolInformServerInstall.serverURL = _1335.DBUSER_ISINSTALL;
                  protocolInformServerInstall.request(function(param1:Object):void
                  {
                     if(param1)
                     {
                        if(param1["code"] == 0)
                        {
                        }
                     }
                  },function(param1:IOErrorEvent):void
                  {
                  });
               }
               else
               {
                  dispatchEvent(new ProtocolEvent(ProtocolEvent.LOGIN_ERROR,data));
               }
               if(callback != null)
               {
                  callback(data);
               }
            }
            else
            {
               dispatchEvent(new ProtocolEvent(ProtocolEvent.LOGIN_ERROR,tr("LoginWindow.ErrorLogin")));
               if(callback != null)
               {
                  callback(false);
               }
            }
         },function(param1:IOErrorEvent):void
         {
            dispatchEvent(new ProtocolEvent(ProtocolEvent.LOGIN_ERROR,tr("LoginWindow.ErrorBadNet")));
            if(callback != null)
            {
               callback(null);
            }
         });
      }
      
      public function logout() : void
      {
         if(!_3766)
         {
            return;
         }
         _12896 = false;
         this.dispatchEvent(new ProtocolEvent(ProtocolEvent.LOGOUT_COMPLETE,null));
      }
      
      private function _9217(param1:String = "heartbeat") : void
      {
         var _loc2_:_1340 = new _1340();
         _loc2_.act = param1;
         if(this._9218.has("uid"))
         {
            _loc2_._5964 = this._9218.get("uid");
         }
         else
         {
            _loc2_._5964 = "";
         }
         _loc2_.uuid = this._9218.get("uuid");
         _loc2_.request();
      }
      
      private function _5592() : void
      {
         var _loc1_:String = new Date().time.toString() + int(Math.random() * 10000).toString();
         this._9218 = _1549.get(SystemInfo.nativeStoragePath + "Egret/user/login",false);
         if(!this._9218.has("uuid"))
         {
            this._9218.set("uuid",_loc1_);
         }
      }
   }
}

