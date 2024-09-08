package _472
{
   import _1009.LoginLimitedWindow;
   import _1009.LoginWindow;
   import _11106._13167;
   import _11111._11110;
   import _1331._1332;
   import _1374.Alert;
   import _1404._1407;
   import _1529._1528;
   import _1529._1530;
   import _6._9;
   import _648._12463;
   import _783._12475;
   import _93._94;
   import com.adobe.crypto.MD5;
   import com.hurlant.util.Base64;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   
   public class _12461 extends _94
   {
      public static var _12967:int = 0;
      
      public static var _12966:int = 1;
      
      public static var _12965:int = 2;
      
      private static var _12677:uint = 0;
      
      public static const KeyError:uint = _12677++;
      
      public static const NetError:uint = _12677++;
      
      public static const DataError:uint = _12677++;
      
      public static const JSONError:uint = _12677++;
      
      public static const UnknownError:uint = _12677++;
      
      public static const ResultError:uint = _12677++;
      
      public static const MailInvalid:uint = _12677++;
      
      public static const MailRegistered:uint = _12677++;
      
      public static const MailUnregistered:uint = _12677++;
      
      public static const MailLocked:uint = _12677++;
      
      public static const MailLimit:uint = _12677++;
      
      public static const UsernameInvalid:uint = _12677++;
      
      public static const UsernameRegistered:uint = _12677++;
      
      public static const PasswordInvalid:uint = _12677++;
      
      public static const IDExpired:uint = _12677++;
      
      public static const IDTimeout:uint = _12677++;
      
      public static const CreateOrderError:uint = _12677++;
      
      public static const GoodsSoldOut:uint = _12677++;
      
      public static const GoodsDown:uint = _12677++;
      
      public static const MissingParameters:uint = _12677++;
      
      public static const FileSizeLimited:uint = _12677++;
      
      public static const WorksCountLimited:uint = _12677++;
      
      public static const Success:uint = 200;
      
      public static const LoginLimit:uint = 605;
      
      public static const ForceLoginLimit:uint = 608;
      
      public static const LicenceLogoutLimit:uint = 606;
      
      public static const NonExistentPreference:uint = 618;
      
      public static const CheckValidUsername:String = "http://bbs.egret.com/member.php";
      
      public static const CheckValidMail:String = "http://bbs.egret.com/member.php";
      
      public static const Register:String = "http://bbs.egret.com/member.php";
      
      public static const RegisterB:String = "http://bbs.egret.com/member.php";
      
      public static const ResetPassword:String = "http://bbs.egret.com/member.php";
      
      public static const ResetPasswordA:String = "http://bbs.egret.com/member.php";
      
      public static const ResetPasswordB:String = "http://bbs.egret.com/member.php";
      
      public static const Logout:String = "http://wechatse.egret.com/apiv1/user/logout2";
      
      public static const LicenceLogout:String = "http://wechatse.egret.com/apiv1/user/activealone";
      
      public static const CheckLogin:String = "http://wechatse.egret.com/apiv1/user/verify";
      
      public static const SetPreference:String = "http://wechatse.egret.com/apiv1/user/setpreference";
      
      public static const GetPreference:String = "http://wechatse.egret.com/apiv1/user/getpreference";
      
      public static const GetGoodsInfo:String = "http://dbadmin.egret.com/goods?isApi=1";
      
      public static const GetOrderInfo:String = "http://dbadmin.egret.com/order";
      
      public static const Pay:String = "http://dbpay.egret.com/";
      
      public static const PayAli:String = "alipay";
      
      public static const PayWX:String = "wxpay";
      
      public static const PayPayPal:String = "paypal";
      
      public static const UploadWorkToStore:String = "http://t.egret.com/upload";
      
      public static const DBGET_WORK:String = "http://wechatse.egret.com/apiv1/work/dragonbone";
      
      public static const DBBUY_WORK:String = "http://wechatse.egret.com/apiv1/work/buy";
      
      public static const DBGO_CHARGE:String = "http://t.egret.com/user/charge.html";
      
      private var _12692:Boolean;
      
      private var _2352:Object;
      
      private var _12686:Function;
      
      private var _13369:Timer;
      
      private var _13368:Boolean = false;
      
      private var _13365:uint = 0;
      
      public function _12461()
      {
         this._11970 = new URLRequest();
         this._loader = new URLLoader();
         this._4761 = _1407.getInstance(_12463);
         this._13369 = new Timer(24 * 3600 * 1000,1);
         super();
         this._13369.addEventListener(TimerEvent.TIMER,this._13364);
      }
      
      override protected function _1576() : void
      {
         this._loader.addEventListener(Event.COMPLETE,this._loaderHandler);
         this._loader.addEventListener(IOErrorEvent.IO_ERROR,this._loaderHandler);
         this._loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this._loaderHandler);
         _1565(_12475.SHOW_LOGIN,this._12673);
         _1565(_12475.SHOW_LIMIT,this._12673);
         _1565(_12475.SHOW_PAY,this._12673);
         _1565(_12475.LOGIN,this._12673);
         _1565(_12475.LOGOUT,this._12673);
         _14312.clear();
         _14312._14653("systemDefalut");
         _14312.initialize();
         _14312._1664();
         if(!this._4761._3766 && this._4761.mail && this._4761.password && this._4761._12675 && this._4761.autoLogin2)
         {
            this.login(this._4761.mail,this._4761.password,1,null);
         }
      }
      
      private function _12673(param1:_9) : void
      {
         switch(param1.type)
         {
            case _12475.SHOW_LOGIN:
               new LoginWindow(param1.data).open();
               break;
            case _12475.SHOW_LIMIT:
               new LoginLimitedWindow(this._4761.mail,this._4761.password).open();
               break;
            case _12475.SHOW_PAY:
               Alert.show(tr("Alert.needPay"),"");
               break;
            case _12475.LOGIN:
               _14312.clear();
               _14312._14653(this._4761.uid);
               _14312.initialize();
               _14312._1664();
               break;
            case _12475.LOGOUT:
               if(this._4761._3766)
               {
                  if(param1.data)
                  {
                     switch(param1.data.code)
                     {
                        case LicenceLogoutLimit:
                           Alert.show(tr("Alert.deauthorizeLimit"),"");
                     }
                  }
               }
               else
               {
                  _14312.clear();
                  _14312._14653("systemDefalut");
                  _14312.initialize();
                  _14312._1664();
               }
         }
      }
      
      private function _loaderHandler(param1:Event) : void
      {
         switch(param1.type)
         {
            case Event.COMPLETE:
               this._12686(true);
               break;
            default:
               this._12686(false);
         }
      }
      
      private function _12682(param1:Function) : void
      {
         if(param1 != null)
         {
            switch(param1.length)
            {
               case 0:
                  param1();
                  break;
               case 1:
                  param1(this._2352);
                  break;
               default:
                  param1(this._12692,this._2352);
            }
         }
      }
      
      private function _12690(param1:String) : String
      {
         return MD5.hash("egret" + param1 + "egret");
      }
      
      private function _12689(param1:String) : String
      {
         param1 = decodeURI(param1);
         return param1 + "&sign=" + MD5.hash(param1 + "&key=86539022057b67fcb068103a0dc93b66").toUpperCase();
      }
      
      private function _12685(param1:String) : Array
      {
         var _loc2_:String = new Date().getTime().toString();
         return [new URLRequestHeader("timestamp",_loc2_),new URLRequestHeader("signature",MD5.hash(param1 + _loc2_)),new URLRequestHeader("client","DragonBones:4.5")];
      }
      
      private function _12681(param1:String, param2:Object, ... rest) : Boolean
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = uint(rest.length);
         while(_loc4_ < _loc5_)
         {
            if(param2.code === rest[_loc4_])
            {
               param2.code = rest[_loc4_ + 1];
               break;
            }
            _loc4_ += 2;
         }
         if(param2.code != Success)
         {
            _11110.instance._13189._11132(param1,String(param2.code));
         }
         return param2.code === Success;
      }
      
      private function _12688(param1:String, param2:* = null) : Object
      {
         var outputCode:uint = 0;
         var outputMsg:String = null;
         var gaAction:String = null;
         var _2222:* = undefined;
         var requestName:String = param1;
         var data:* = param2;
         if(data === null)
         {
            outputCode = NetError;
            outputMsg = tr("Net.error.0001");
            gaAction = _13167.NETWORK_ERROR;
         }
         else if(data)
         {
            try
            {
               return data is String ? JSON.parse(data) : data;
            }
            catch(error:Error)
            {
               outputCode = JSONError;
               outputMsg = "JSON error.";
               _2222 = data;
               gaAction = _13167.JSON_ERROR;
            }
         }
         else
         {
            outputCode = DataError;
            outputMsg = "Data error.";
            gaAction = _13167.DATA_ERROR;
         }
         _11110.instance._13189._11132(requestName,gaAction,_2222);
         return {
            "code":outputCode,
            "msg":outputMsg,
            "data":_2222
         };
      }
      
      private function _12687(param1:String, param2:* = null) : Object
      {
         var _loc3_:Object = this._12688(param1,param2);
         _loc3_.message = _loc3_.msg;
         _loc3_.msg = null;
         return _loc3_;
      }
      
      public function _12676(param1:String, param2:Function) : void
      {
         var mail:String = param1;
         var callback:Function = param2;
         this._11970.url = CheckValidMail;
         this._11970.method = URLRequestMethod.GET;
         this._11970.data = new URLVariables();
         this._11970.data.mod = "checkemailapi";
         this._11970.data.email = com.hurlant.util.Base64.encode(mail);
         this._11970.data.key = this._12690(mail);
         this._12686 = function(param1:Boolean):void
         {
            var _loc2_:String = "Check Email Valid";
            if(param1)
            {
               _2352 = _12688(_loc2_,_loader.data);
               _12692 = _12681(_loc2_,_2352,101,MailInvalid,102,MailRegistered);
            }
            else
            {
               _2352 = _12688(_loc2_);
               _12692 = false;
            }
            _12682(callback);
         };
         this._loader.load(this._11970);
      }
      
      public function _12674(param1:String, param2:Function) : void
      {
         var username:String = param1;
         var callback:Function = param2;
         this._11970.url = CheckValidUsername;
         this._11970.method = URLRequestMethod.GET;
         this._11970.data = new URLVariables();
         this._11970.data.mod = "checkusernameapi";
         this._11970.data.username = com.hurlant.util.Base64.encode(username);
         this._11970.data.key = this._12690(username);
         this._12686 = function(param1:Boolean):void
         {
            var _loc2_:String = "Check Username Valid";
            if(param1)
            {
               _2352 = _12688(_loc2_,_loader.data);
               _12692 = _12681(_loc2_,_2352,101,UsernameInvalid,102,UsernameInvalid,103,UsernameInvalid,104,UsernameRegistered);
            }
            else
            {
               _2352 = _12688(_loc2_);
               _12692 = false;
            }
            _12682(callback);
         };
         this._loader.load(this._11970);
      }
      
      public function registerA(param1:String, param2:Function) : void
      {
         var mail:String = param1;
         var callback:Function = param2;
         this._11970.url = Register;
         this._11970.method = URLRequestMethod.GET;
         this._11970.data = new URLVariables();
         this._11970.data.mod = "validatemailapi";
         this._11970.data.email = com.hurlant.util.Base64.encode(mail);
         this._11970.data.lan = _1528.language === _1530.zh_CN ? "zh" : "en";
         this._11970.data.key = this._12690(mail);
         this._12686 = function(param1:Boolean):void
         {
            var _loc2_:String = "Register Request";
            if(param1)
            {
               _2352 = _12688(_loc2_,_loader.data);
               _12692 = _12681(_loc2_,_2352,101,KeyError);
            }
            else
            {
               _2352 = _12688(_loc2_);
               _12692 = false;
            }
            _1567(new _12475(_12475.REGISTER,_2352));
            _12682(callback);
         };
         this._loader.load(this._11970);
      }
      
      public function register(param1:String, param2:String, param3:String, param4:String, param5:Function) : void
      {
         var verificationCode:String = param1;
         var email:String = param2;
         var username:String = param3;
         var password:String = param4;
         var callback:Function = param5;
         this._11970.url = Register;
         this._11970.method = URLRequestMethod.GET;
         this._11970.data = new URLVariables();
         this._11970.data.mod = "register";
         this._11970.data.isDBapi = 1;
         this._11970.data.email = com.hurlant.util.Base64.encode(email);
         this._11970.data.username = com.hurlant.util.Base64.encode(username);
         this._11970.data.code = verificationCode;
         this._11970.data.password = com.hurlant.util.Base64.encode(password);
         this._11970.data.key = this._12690(email + username);
         this._12686 = function(param1:Boolean):void
         {
            var _loc2_:String = "Register";
            if(param1)
            {
               _2352 = _12688(_loc2_,_loader.data);
               _12692 = _12681(_loc2_,_2352,101,MailRegistered,102,UsernameRegistered,103,UsernameInvalid,104,MailInvalid,105,IDExpired,107,IDExpired,106,IDTimeout);
            }
            else
            {
               _2352 = _12688(_loc2_);
               _12692 = false;
            }
            _1567(new _12475(_12475.REGISTER,_2352));
            _12682(callback);
         };
         this._loader.load(this._11970);
      }
      
      public function changePassword(param1:String, param2:String, param3:Function) : void
      {
         var _12684:String = param1;
         var password:String = param2;
         var callback:Function = param3;
         this._11970.url = ResetPassword;
         this._11970.method = URLRequestMethod.GET;
         this._11970.data = new URLVariables();
         this._11970.data.mod = "resetpasswdapi";
         this._11970.data.email = com.hurlant.util.Base64.encode(this._4761.mail);
         this._11970.data.oldpasswd = com.hurlant.util.Base64.encode(_12684);
         this._11970.data.passwd = com.hurlant.util.Base64.encode(password);
         this._11970.data.key = this._12690(this._4761.mail);
         this._12686 = function(param1:Boolean):void
         {
            var _loc2_:String = "Change Password";
            if(param1)
            {
               _2352 = _12688(_loc2_,_loader.data);
               _12692 = _12681(_loc2_,_2352,101,KeyError,103,PasswordInvalid);
               if(_12692)
               {
                  _4761.password = password;
               }
            }
            else
            {
               _2352 = _12688(_loc2_);
               _12692 = false;
            }
            _1567(new _12475(_12475.RESET_PASSWORD,_2352));
            _12682(callback);
         };
         this._loader.load(this._11970);
      }
      
      public function resetPasswordA(param1:String, param2:Function) : void
      {
         var mail:String = param1;
         var callback:Function = param2;
         this._11970.url = ResetPasswordA;
         this._11970.method = URLRequestMethod.GET;
         this._11970.data = new URLVariables();
         this._11970.data.mod = "lostpasswdapi";
         this._11970.data.email = com.hurlant.util.Base64.encode(mail);
         this._11970.data.lan = _1528.language === _1530.zh_CN ? "zh" : "en";
         this._11970.data.key = this._12690(mail);
         this._12686 = function(param1:Boolean):void
         {
            var _loc2_:String = "Reset Password Request";
            if(param1)
            {
               _2352 = _12688(_loc2_,_loader.data);
               _12692 = _12681(_loc2_,_2352,101,KeyError,102,UsernameInvalid,103,MailUnregistered,104,MailLocked,105,UsernameInvalid,106,MailLimit);
            }
            else
            {
               _2352 = _12688(_loc2_);
               _12692 = false;
            }
            _1567(new _12475(_12475.RESET_PASSWORD_A,_2352));
            _12682(callback);
         };
         this._loader.load(this._11970);
      }
      
      public function resetPasswordB(param1:String, param2:String, param3:String, param4:Function) : void
      {
         var verificationCode:String = param1;
         var email:String = param2;
         var password:String = param3;
         var callback:Function = param4;
         this._11970.url = ResetPasswordB;
         this._11970.method = URLRequestMethod.GET;
         this._11970.data = new URLVariables();
         this._11970.data.mod = "resetpasswdapi";
         this._11970.data.email = com.hurlant.util.Base64.encode(email);
         this._11970.data.id = verificationCode;
         this._11970.data.passwd = com.hurlant.util.Base64.encode(password);
         this._11970.data.key = this._12690(email);
         this._12686 = function(param1:Boolean):void
         {
            var _loc2_:String = "Reset Password";
            if(param1)
            {
               _2352 = _12688(_loc2_,_loader.data);
               _12692 = _12681(_loc2_,_2352,101,KeyError,102,IDExpired);
               if(_12692)
               {
                  _4761.password = password;
               }
            }
            else
            {
               _2352 = _12688(_loc2_);
               _12692 = false;
            }
            _1567(new _12475(_12475.RESET_PASSWORD_B,_2352));
            _12682(callback);
         };
         this._loader.load(this._11970);
      }
      
      public function login(param1:String, param2:String, param3:uint, param4:Function) : void
      {
         var mail:String = param1;
         var password:String = param2;
         var type:uint = param3;
         var callback:Function = param4;
         this._4761.mail = mail;
         _1332.instance.login(mail,password,type,function(param1:*):void
         {
            var _loc2_:String = type == 1 ? "Login" : "Force Login";
            if(param1 !== null)
            {
               _2352 = _12687(_loc2_,param1);
               _12692 = _12681(_loc2_,_2352,0,Success,10000,MailInvalid,10004,PasswordInvalid,10009,Success);
               if(_12692)
               {
                  if(_4761._12675)
                  {
                     _4761.autoLogin2 = true;
                  }
                  _13367(true);
               }
            }
            else
            {
               _2352 = _12687(_loc2_);
               _12692 = false;
            }
            _4761.password = _12692 || _2352.code === LoginLimit || _2352.code === ForceLoginLimit ? password : "";
            _1567(new _12475(_12475.LOGIN,_2352));
            _12682(callback);
         });
      }
      
      public function logout(param1:uint, param2:Function, param3:Boolean = false) : void
      {
         var requstName:String = null;
         var type:uint = param1;
         var callback:Function = param2;
         var manual:Boolean = param3;
         if(!this._4761._3766)
         {
            this._12682(callback);
            this._13367(false);
            return;
         }
         this._11970.method = URLRequestMethod.POST;
         if(type === 1)
         {
            requstName = "Logout";
            this._11970.url = Logout;
            this._11970.requestHeaders = this._12685("Userlogout2");
            this._11970.data = JSON.stringify({
               "client_id":this._4761._12691,
               "statistics":this._4761.statistics,
               "token":this._4761.token
            });
         }
         else
         {
            requstName = "Deauthorize";
            this._11970.url = LicenceLogout;
            this._11970.requestHeaders = this._12685("UseractiveAlone");
            this._11970.data = JSON.stringify({
               "client_id":this._4761._12691,
               "account":this._4761.mail,
               "password":MD5.hash(this._4761.password)
            });
         }
         this._12686 = function(param1:Boolean):void
         {
            if(param1)
            {
               _2352 = _12687(requstName,_loader.data);
               _12692 = _12681(requstName,_2352,0,Success,613,Success,615,Success);
               if(_12692)
               {
                  _4761.egret.logout();
                  if(manual)
                  {
                     _4761.autoLogin2 = false;
                  }
               }
            }
            else
            {
               _2352 = _12687(requstName);
               _12692 = false;
            }
            _13367(false);
            _1567(new _12475(_12475.LOGOUT,_2352));
            _12682(callback);
         };
         this._loader.load(this._11970);
      }
      
      public function _9219(param1:Function, param2:Boolean = true) : void
      {
         var callback:Function = param1;
         var allowFailed:Boolean = param2;
         this._11970.method = URLRequestMethod.POST;
         this._11970.requestHeaders = this._12685("Userverify");
         this._11970.url = CheckLogin;
         this._11970.data = JSON.stringify({
            "client_id":this._4761._12691,
            "account":this._4761.mail,
            "password":MD5.hash(this._4761.password)
         });
         this._12686 = function(param1:Boolean):void
         {
            var _loc2_:String = "Check Login";
            if(param1)
            {
               _2352 = _12687(_loc2_,_loader.data);
               _12692 = _12681(_loc2_,_2352,0,Success);
               if(!_12692 || _2352.data == null)
               {
                  _4761.egret.logout();
                  _1567(new _12475(_12475.OFFLINE,_2352));
               }
               else
               {
                  _4761.config.set("level",_2352.data["level"]);
                  _4761.config.set("paid",_2352.data["paid"]);
                  _13367(true);
               }
            }
            else
            {
               _11110.instance._13189._11132(_loc2_,_13167.NETWORK_ERROR);
               if(allowFailed && _13365 < 2)
               {
                  ++_13365;
                  _12692 = true;
                  _13367(true);
               }
               else
               {
                  _12692 = false;
                  _4761.egret.logout();
                  _1567(new _12475(_12475.OFFLINE,_2352));
               }
            }
            _12682(callback);
         };
         this._loader.load(this._11970);
      }
      
      public function callPaidFunction(param1:int, param2:Function, ... rest) : void
      {
         var proxy:Function = null;
         var level:int = param1;
         var callback:Function = param2;
         var args:Array = rest;
         proxy = function():void
         {
            var _loc1_:Boolean = true;
            if(callback != null)
            {
               if(Boolean(args) && args.length > 0)
               {
                  callback.apply(this,args);
               }
               else
               {
                  callback();
               }
               _loc1_ = false;
            }
            _1567(new _12475(_12475.CALL_PAID_FUNCTION,_loc1_ ? proxy as Object : null));
         };
         proxy();
      }
      
      public function _12581(param1:int, param2:Function, param3:Function, ... rest) : void
      {
         var level:int = param1;
         var _2379:Function = param2;
         var callback:Function = param3;
         var args:Array = rest;
         if(this._13368)
         {
            this._9219(function():void
            {
               if(callback != null)
               {
                  if(Boolean(args) && args.length > 0)
                  {
                     callback.apply(this,args);
                  }
                  else
                  {
                     callback();
                  }
               }
            });
         }
         else if(callback != null)
         {
            if(Boolean(args) && args.length > 0)
            {
               callback.apply(this,args);
            }
            else
            {
               callback();
            }
         }
      }
      
      public function _12679(param1:String, param2:Function = null) : void
      {
         var loaderHandler:Function = null;
         var loader:URLLoader = null;
         var string:String = param1;
         var callback:Function = param2;
         this._11970.method = URLRequestMethod.POST;
         this._11970.requestHeaders = this._12685("UsersetPreference");
         this._11970.url = SetPreference;
         this._11970.data = JSON.stringify({
            "client_id":this._4761._12691,
            "account":this._4761.mail,
            "password":MD5.hash(this._4761.password),
            "setting":string
         });
         loaderHandler = function(param1:Event):void
         {
            loader.removeEventListener(Event.COMPLETE,loaderHandler);
            loader.removeEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
            loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
            var _loc2_:String = "Set Preference";
            if(param1.type === Event.COMPLETE)
            {
               _2352 = _12687(_loc2_,loader.data);
               _12692 = _12681(_loc2_,_2352,0,Success);
            }
            else
            {
               _2352 = _12687(_loc2_);
               _12692 = false;
            }
            if(callback != null)
            {
               _12682(callback);
            }
         };
         loader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,loaderHandler);
         loader.addEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
         loader.load(this._11970);
      }
      
      public function _12678(param1:Function) : void
      {
         var loaderHandler:Function = null;
         var loader:URLLoader = null;
         var callback:Function = param1;
         this._11970.method = URLRequestMethod.POST;
         this._11970.requestHeaders = this._12685("UsergetPreference");
         this._11970.url = GetPreference;
         this._11970.data = JSON.stringify({
            "client_id":this._4761._12691,
            "account":this._4761.mail,
            "password":MD5.hash(this._4761.password)
         });
         loaderHandler = function(param1:Event):void
         {
            loader.removeEventListener(Event.COMPLETE,loaderHandler);
            loader.removeEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
            loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
            var _loc2_:String = "Set Preference";
            if(param1.type === Event.COMPLETE)
            {
               _2352 = _12687(_loc2_,loader.data);
               _12692 = _12681(_loc2_,_2352,0,Success);
            }
            else
            {
               _2352 = _12687(_loc2_);
               _12692 = false;
            }
            _12682(callback);
         };
         loader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,loaderHandler);
         loader.addEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
         loader.load(this._11970);
      }
      
      public function setBusinessInfo(param1:String, param2:Function = null) : void
      {
         var loaderHandler:Function = null;
         var loader:URLLoader = null;
         var string:String = param1;
         var callback:Function = param2;
         this._11970.method = URLRequestMethod.POST;
         this._11970.requestHeaders = this._12685("setBusinessInfo");
         this._11970.url = "http://wechatse.egret.com/apiv1/user/setbusinessinfo";
         this._11970.data = JSON.stringify({
            "client_id":this._4761._12691,
            "account":this._4761.mail,
            "password":MD5.hash(this._4761.password),
            "business_info":string
         });
         loaderHandler = function(param1:Event):void
         {
            loader.removeEventListener(Event.COMPLETE,loaderHandler);
            loader.removeEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
            loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
            var _loc2_:String = "Set Enterprise Info";
            if(param1.type === Event.COMPLETE)
            {
               _2352 = _12687(_loc2_,loader.data);
               _12692 = _12681(_loc2_,_2352,0,Success);
            }
            else
            {
               _2352 = _12687(_loc2_);
               _12692 = false;
            }
            if(callback != null)
            {
               _12682(callback);
            }
         };
         loader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,loaderHandler);
         loader.addEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
         loader.load(this._11970);
      }
      
      public function getBusinessInfo(param1:Function) : void
      {
         var loaderHandler:Function = null;
         var loader:URLLoader = null;
         var callback:Function = param1;
         this._11970.method = URLRequestMethod.POST;
         this._11970.requestHeaders = this._12685("getBusinessInfo");
         this._11970.url = "http://wechatse.egret.com/apiv1/user/getbusinessinfo";
         this._11970.data = JSON.stringify({
            "client_id":this._4761._12691,
            "account":this._4761.mail,
            "password":MD5.hash(this._4761.password)
         });
         loaderHandler = function(param1:Event):void
         {
            loader.removeEventListener(Event.COMPLETE,loaderHandler);
            loader.removeEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
            loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
            var _loc2_:String = "Get Enterprise Info";
            if(param1.type === Event.COMPLETE)
            {
               _2352 = _12687(_loc2_,loader.data);
               _12692 = _12681(_loc2_,_2352,0,Success);
            }
            else
            {
               _2352 = _12687(_loc2_);
               _12692 = false;
            }
            _12682(callback);
         };
         loader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,loaderHandler);
         loader.addEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
         loader.load(this._11970);
      }
      
      public function _12680(param1:Function) : void
      {
         var loaderHandler:Function = null;
         var loader:URLLoader = null;
         var callback:Function = param1;
         this._11970.url = GetGoodsInfo;
         this._11970.method = URLRequestMethod.GET;
         loaderHandler = function(param1:Event):void
         {
            loader.removeEventListener(Event.COMPLETE,loaderHandler);
            loader.removeEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
            loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
            var _loc2_:String = "Get Goods Info";
            if(param1.type === Event.COMPLETE)
            {
               _2352 = _12688(_loc2_,loader.data);
               _12692 = _12681(_loc2_,_2352,104,ResultError);
            }
            else
            {
               _2352 = _12688(_loc2_);
               _12692 = false;
            }
            _12682(callback);
         };
         loader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,loaderHandler);
         loader.addEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
         loader.load(this._11970);
      }
      
      public function _12683(param1:String, param2:Function) : void
      {
         var loaderHandler:Function = null;
         var loader:URLLoader = null;
         var orderID:String = param1;
         var callback:Function = param2;
         this._11970.url = GetOrderInfo;
         this._11970.method = URLRequestMethod.GET;
         this._11970.data = new URLVariables();
         this._11970.data.order_num = orderID;
         this._11970.data = this._12689((this._11970.data as URLVariables).toString()) + "&behavior=getOrder";
         loaderHandler = function(param1:Event):void
         {
            loader.removeEventListener(Event.COMPLETE,loaderHandler);
            loader.removeEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
            loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
            var _loc2_:String = "Get Order Info";
            if(param1.type === Event.COMPLETE)
            {
               _2352 = _12688(_loc2_,loader.data);
               _12692 = _12681(_loc2_,_2352,103,ResultError);
            }
            else
            {
               _2352 = _12688(_loc2_);
               _12692 = false;
            }
            _12682(callback);
         };
         loader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,loaderHandler);
         loader.addEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
         loader.load(this._11970);
      }
      
      public function pay(param1:int, param2:int, param3:Function) : void
      {
         var payTypeStr:String = null;
         var loaderHandler:Function = null;
         var loader:URLLoader = null;
         var goodsID:int = param1;
         var payType:int = param2;
         var callback:Function = param3;
         switch(payType)
         {
            case _12967:
            default:
               this._11970.url = Pay + PayAli;
               payTypeStr = "Ali";
               break;
            case _12966:
               this._11970.url = Pay + PayWX;
               payTypeStr = "WX";
               break;
            case _12965:
               this._11970.url = Pay + PayPayPal;
               payTypeStr = "PayPal";
         }
         this._11970.method = URLRequestMethod.GET;
         this._11970.data = new URLVariables();
         this._11970.data.goods_id = goodsID;
         this._11970.data.user_id = this._4761.uid;
         this._11970.data = this._12689((this._11970.data as URLVariables).toString());
         loaderHandler = function(param1:Event):void
         {
            loader.removeEventListener(Event.COMPLETE,loaderHandler);
            loader.removeEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
            loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
            var _loc2_:String = "Pay " + payTypeStr;
            if(param1.type === Event.COMPLETE)
            {
               _2352 = _12688(_loc2_,loader.data);
               _12692 = _12681(_loc2_,_2352,109,KeyError,101,KeyError,104,CreateOrderError,105,GoodsSoldOut,106,GoodsDown);
            }
            else
            {
               _2352 = _12688(_loc2_);
               _12692 = false;
            }
            _12682(callback);
         };
         loader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,loaderHandler);
         loader.addEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
         loader.load(this._11970);
      }
      
      public function _13366(param1:String, param2:String, param3:String, param4:ByteArray, param5:ByteArray, param6:String, param7:Function) : void
      {
         var loaderHandler:Function = null;
         var step:int = 0;
         var id:String = null;
         var loader:URLLoader = null;
         var fileList:Array = null;
         var name:String = param1;
         var descript:String = param2;
         var markdown:String = param3;
         var preview:ByteArray = param4;
         var zip:ByteArray = param5;
         var html:String = param6;
         var callback:Function = param7;
         var createWork:Function = function(param1:String, param2:*):void
         {
            var _loc3_:URLVariables = new URLVariables();
            _loc3_.uid = _4761.uid;
            _loc3_.name = name;
            _loc3_.descript = descript;
            _loc3_.md = markdown;
            _loc3_.worksStatus = 0;
            _loc3_.fileType = param1;
            _11970.url = UploadWorkToStore + "?" + _12689(_loc3_.toString());
            _11970.data = param2;
            loader.addEventListener(Event.COMPLETE,loaderHandler);
            loader.addEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
            loader.load(_11970);
         };
         var uploadFile:Function = function(param1:String, param2:*, param3:Boolean):void
         {
            var _loc4_:URLVariables;
            (_loc4_ = new URLVariables()).uid = _4761.uid;
            _loc4_.id = id;
            _loc4_.fileType = param1;
            if(param3)
            {
               _loc4_.worksStatus = 1;
            }
            else
            {
               _loc4_.worksStatus = 0;
            }
            _11970.url = UploadWorkToStore + "?" + _12689(_loc4_.toString());
            _11970.data = param2;
            loader.addEventListener(Event.COMPLETE,loaderHandler);
            loader.addEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
            loader.load(_11970);
         };
         loaderHandler = function(param1:Event):void
         {
            loader.removeEventListener(Event.COMPLETE,loaderHandler);
            loader.removeEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
            loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loaderHandler);
            var _loc2_:String = "Upload Store " + step;
            if(param1.type === Event.COMPLETE)
            {
               _2352 = _12688(_loc2_,loader.data);
               _12692 = _12681(_loc2_,_2352,406,KeyError,401,MissingParameters,403,FileSizeLimited,407,WorksCountLimited);
            }
            else
            {
               _2352 = _12688(_loc2_);
               _12692 = false;
            }
            if(_12692)
            {
               if(step === 0)
               {
                  if(_2352.data)
                  {
                     id = _2352.data.id;
                  }
                  else
                  {
                     _12692 = false;
                     _11110.instance._13189._11132(_loc2_,_13167.RESULTDATA_ERROR);
                     _12682(callback);
                  }
               }
               if(fileList.length > 0)
               {
                  uploadFile(fileList.shift(),fileList.shift(),fileList.length < 2);
               }
               else
               {
                  _12682(callback);
               }
               ++step;
            }
            else
            {
               _12682(callback);
            }
         };
         step = 0;
         id = "";
         loader = new URLLoader();
         fileList = ["jpg",preview,"zip",zip,"html",html];
         this._11970.method = URLRequestMethod.POST;
         createWork(fileList.shift(),fileList.shift());
      }
      
      private function _13364() : void
      {
         this._13368 = true;
      }
      
      private function _13367(param1:Boolean) : void
      {
         this._13369.reset();
         this._13368 = false;
         this._13365 = 0;
         if(param1)
         {
            this._13369.start();
         }
      }
   }
}

