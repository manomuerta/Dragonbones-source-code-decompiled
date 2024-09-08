package _1009
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1177.UIEvent;
   import _127._128;
   import _127._171;
   import _1343._839;
   import _1374.Alert;
   import _1374.TextInput;
   import _1404._1407;
   import _472._12461;
   import _648._12463;
   import _783._12475;
   import _97._125;
   import egret.utils.tr;
   import flash.display.NativeWindowType;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class LoginWindow extends _171
   {
      private static const MODE_INIT:int = -2;
      
      private static const MODE_LOGIN:int = 0;
      
      private static const MODE_REG_1:int = 1;
      
      private static const MODE_REG_2:int = 2;
      
      private static const MODE_RESET_1:int = 3;
      
      private static const MODE_RESET_2:int = 4;
      
      private static var _12841:Dictionary = new Dictionary();
      
      private static var _12840:Dictionary = new Dictionary();
      
      private var _12868:int = -2;
      
      public var userData:Object;
      
      private var _7238:Function;
      
      private var _12763:Group;
      
      private var _12869:Group;
      
      private var _12862:Group;
      
      private var _12863:Group;
      
      private var _12842:Group;
      
      private var _12861:Group;
      
      private var _7229:_128;
      
      private var _7235:Label;
      
      private var _10525:Button;
      
      private var _10524:Button;
      
      private var _12865:Boolean = false;
      
      private var _mode:int = -1;
      
      public function LoginWindow(param1:* = null)
      {
         this._12594 = _1407.getInstance(_12463);
         this._12569 = _1407.getInstance(_12461);
         super();
         this.width = 480;
         this.maximizable = false;
         this.minimizable = false;
         this.resizable = false;
         this.type = NativeWindowType.UTILITY;
         this.addEventListener(UIEvent.CREATION_COMPLETE,this._7228);
         if(param1 is Function)
         {
            this._7238 = param1;
         }
         else if(param1)
         {
            this.userData = param1;
            this._12868 = MODE_RESET_1;
         }
      }
      
      protected function _7228(param1:UIEvent) : void
      {
         this.nativeWindow.stage.addEventListener(KeyboardEvent.KEY_DOWN,this._2575);
      }
      
      protected function _2575(param1:KeyboardEvent) : void
      {
         if(this._10524.enabled && param1.keyCode == Keyboard.ENTER)
         {
            this._12749(null);
         }
      }
      
      override protected function _2438() : void
      {
         var findPasswordBtn:Button;
         var _2513:Group;
         super._2438();
         closeButton.visible = true;
         _2512.top = _2512.bottom = 15;
         this._12763 = this._12765(tr("LoginWindow.Email"),this._12594.mail,"example@example.com");
         this._12869 = this._12765(tr("LoginWindow.Code"),"",tr("LoginWindow.CodePrompt"),false);
         this._12862 = this._12765(tr("LoginWindow.Username"));
         this._12863 = this._12765("",this._12594._12675 ? this._12594.password : "");
         this._12842 = this._12765("");
         this._12871.textColor = 13421772;
         this._7233.displayAsPassword = true;
         this._12845.displayAsPassword = true;
         this._12762.maxChars = 48;
         this._12860.maxChars = 16;
         this._7233.maxChars = 16;
         this._12860.restrict = "^/\\:*?\"\' <>|.^&";
         this._12861 = _125._2397(20);
         this._12861.percentWidth = 100;
         this._7229 = new _128();
         this._7229.label = tr("LoginWindow.RemeberPassword");
         this._7229.selected = this._12594._12675;
         this._7229.addEventListener(Event.CHANGE,function(param1:Event):void
         {
            _12594._12675 = _7229.selected;
         });
         findPasswordBtn = new Button();
         findPasswordBtn.skinName = _839;
         findPasswordBtn.label = tr("LoginWindow.RetrievePassword");
         findPasswordBtn.addEventListener(MouseEvent.CLICK,this._7231);
         this._12861.addElement(this._7229);
         this._12861.addElement(findPasswordBtn);
         _2512.addElement(this._12861);
         this._7235 = new Label();
         this._7235.percentWidth = 100;
         this._7235.height = 20;
         this._7235.textAlign = TextFormatAlign.CENTER;
         this._7235._6080 = 1;
         _2512.addElement(this._7235);
         _2513 = _125._2397(20);
         _2513.percentWidth = 100;
         this._10525 = _125._12513("");
         this._10525.addEventListener(MouseEvent.CLICK,this._12751);
         _2513.addElement(this._10525);
         this._10524 = _125._12513("");
         this._10524.addEventListener(MouseEvent.CLICK,this._12749);
         _2513.addElement(this._10524);
         _2512.addElement(_2513);
         this.mode = this._12868 >= 0 ? this._12868 : 0;
         this.processing = false;
         addEventListener(Event.CLOSE,this._9529);
      }
      
      private function _12765(param1:String, param2:String = "", param3:String = "", param4:Boolean = true) : Group
      {
         var _loc5_:Group;
         (_loc5_ = new Group()).percentWidth = 100;
         _loc5_.height = 40;
         var _loc6_:Label;
         (_loc6_ = new Label()).text = param1;
         _loc6_.width = 120;
         _loc6_.top = 5;
         _loc6_.textAlign = "right";
         _loc5_.addElement(_loc6_);
         var _loc7_:TextInput;
         (_loc7_ = new TextInput()).left = _loc6_.width + 10;
         _loc7_.right = 65;
         _loc7_.text = param2;
         _loc7_.prompt = param3;
         _loc7_.addEventListener(Event.CHANGE,this._7232);
         if(param4)
         {
            _loc7_.addEventListener(FocusEvent.FOCUS_IN,this._12752);
            _loc7_.addEventListener(FocusEvent.FOCUS_OUT,this._12750);
         }
         _loc5_.addElement(_loc7_);
         var _loc8_:Label;
         (_loc8_ = new Label()).percentWidth = 100;
         _loc8_.left = _loc6_.width + 10;
         _loc8_.top = 25;
         _loc8_.textColor = 16711680;
         _loc5_.addElement(_loc8_);
         _2512.addElement(_loc5_);
         return _loc5_;
      }
      
      private function _9529(param1:Event) : void
      {
         removeEventListener(Event.CLOSE,this._9529);
      }
      
      private function set processing(param1:Boolean) : void
      {
         this._12865 = param1;
         this._12846();
         this._12844();
      }
      
      protected function _7231(param1:MouseEvent) : void
      {
         this.mode = MODE_RESET_1;
      }
      
      protected function _12751(param1:MouseEvent) : void
      {
         switch(this._mode)
         {
            case MODE_LOGIN:
               this.mode = MODE_REG_1;
               break;
            case MODE_RESET_1:
               if(this.userData)
               {
                  this.close();
                  new LoginLimitedWindow(this.userData.email,this.userData.password).open();
                  break;
               }
            case MODE_REG_1:
               this._12762.text = this._12594.mail;
               this._7233.text = this._12594.password;
               this.mode = MODE_LOGIN;
               break;
            case MODE_REG_2:
               this.mode = MODE_REG_1;
               break;
            case MODE_RESET_2:
               this.mode = MODE_RESET_1;
         }
      }
      
      protected function _12749(param1:MouseEvent) : void
      {
         if(!this._12761())
         {
            return;
         }
         this.showText(tr("LoginWindow.Loading"));
         switch(this._mode)
         {
            case MODE_LOGIN:
               this.login();
               break;
            case MODE_REG_1:
               this._12856();
               break;
            case MODE_REG_2:
               this.register();
               break;
            case MODE_RESET_1:
               this._12853();
               break;
            case MODE_RESET_2:
               this.resetPassword();
         }
      }
      
      protected function set mode(param1:int) : void
      {
         var _loc2_:Timer = null;
         if(this._mode == param1)
         {
            if(this._mode == MODE_REG_2)
            {
               this._12839(_12841);
            }
            else if(this._mode == MODE_RESET_2)
            {
               this._12839(_12840);
            }
            return;
         }
         if(this._mode == MODE_REG_2)
         {
            _loc2_ = _12841[this.email];
         }
         else if(this._mode == MODE_RESET_2)
         {
            _loc2_ = _12840[this.email];
         }
         if(_loc2_)
         {
            _loc2_.removeEventListener(TimerEvent.TIMER,this.onTimer);
         }
         this._12857();
         this._12764.textColor = 16711680;
         this._mode = param1;
         this._12762.enabled = this._mode != MODE_REG_2 && this._mode != MODE_RESET_2;
         this._12869.visible = this._12869.includeInLayout = this._mode == MODE_REG_2 || this._mode == MODE_RESET_2;
         this._12862.visible = this._12862.includeInLayout = this._mode == MODE_REG_2;
         this._12863.visible = this._12863.includeInLayout = this._mode != MODE_REG_1 && this._mode != MODE_RESET_1;
         this._12842.visible = this._12842.includeInLayout = this._mode == MODE_REG_2 || this._mode == MODE_RESET_2;
         this._12861.visible = this._12861.includeInLayout = this._mode == MODE_LOGIN;
         this._12859.text = this._mode != MODE_RESET_2 ? tr("LoginWindow.Password") : tr("LoginWindow.NewPassword");
         this._12843.text = this._mode != MODE_RESET_2 ? tr("LoginWindow.ConfirmPassword") : tr("LoginWindow.ConfirmNewPassword");
         this._12870.text = "";
         this._12764.text = "";
         this._12871.text = "";
         this._12866.text = "";
         this._12867.text = "";
         this._12849.text = "";
         this.showText("");
         switch(this._mode)
         {
            case MODE_LOGIN:
               this.title = tr("LoginWindow.TitleLogin");
               this._10525.label = tr("LoginWindow.Register");
               this._10524.label = tr("LoginWindow.Login");
               break;
            case MODE_REG_1:
               this.title = tr("LoginWindow.TitleRegister");
               this._10525.label = tr("LoginWindow.Back");
               this._10524.label = tr("LoginWindow.Next");
               if(this.email === this._12594.mail)
               {
                  this._12762.text = "";
               }
               break;
            case MODE_REG_2:
               this.title = tr("LoginWindow.TitleRegister");
               this._10525.label = tr("LoginWindow.Prev");
               this._10524.label = tr("LoginWindow.Register");
               this._7233.text = "";
               this._12845.text = "";
               this._12839(_12841);
               break;
            case MODE_RESET_1:
               this.title = tr("LoginWindow.TitleResetPassword");
               this._10525.label = tr("LoginWindow.Back");
               this._10524.label = tr("LoginWindow.Next");
               break;
            case MODE_RESET_2:
               this.title = tr("LoginWindow.TitleResetPassword");
               this._10525.label = tr("LoginWindow.Prev");
               this._10524.label = tr("LoginWindow.Submit");
               this._7233.text = "";
               this._12845.text = "";
               this._12839(_12840);
         }
         this._7232(null);
      }
      
      private function _12839(param1:Dictionary) : void
      {
         var _loc2_:Timer = param1[this.email];
         if(!_loc2_)
         {
            _loc2_ = new Timer(1000,60);
            _loc2_.addEventListener(TimerEvent.TIMER_COMPLETE,this._5388);
            _loc2_.start();
            param1[this.email] = _loc2_;
            param1[_loc2_] = this.email;
         }
         if(_loc2_)
         {
            _loc2_.addEventListener(TimerEvent.TIMER,this.onTimer);
            this._12864(_loc2_);
         }
      }
      
      private function _12852() : void
      {
         this._12569._12676(this.email,function(param1:Boolean, param2:Object):void
         {
            if(param1)
            {
               _12764.text = "";
            }
            else
            {
               switch(param2.code)
               {
                  case _12461.MailInvalid:
                     _12764.text = tr("LoginWindow.EmailInvalid");
                     break;
                  case _12461.MailRegistered:
                     _12764.text = tr("LoginWindow.EmailAlreadyExist");
                     break;
                  default:
                     _12764.text = (param2.message || param2.msg) + " " + param2.code;
               }
            }
         });
      }
      
      private function _12848() : void
      {
         this._12569._12674(this.username,function(param1:Boolean, param2:Object):void
         {
            if(param1)
            {
               _12764.text = "";
            }
            else
            {
               switch(param2.code)
               {
                  case _12461.UsernameInvalid:
                     _12866.text = tr("LoginWindow.UsernameInvalid");
                     break;
                  case _12461.UsernameRegistered:
                     _12866.text = tr("LoginWindow.UsernameAlreadyExist");
                     break;
                  default:
                     _12866.text = (param2.message || param2.msg) + " " + param2.code;
               }
            }
         });
      }
      
      private function _12856() : void
      {
         this.processing = true;
         this._12569._12676(this.email,function(param1:Boolean, param2:Object):void
         {
            var timer:Timer = null;
            var success:Boolean = param1;
            var result:Object = param2;
            processing = false;
            if(success)
            {
               timer = _12841[email];
               if(!timer)
               {
                  processing = true;
                  _12569.registerA(email,function(param1:Boolean, param2:Object):void
                  {
                     processing = false;
                     if(param1)
                     {
                        mode = MODE_REG_2;
                     }
                     else
                     {
                        var _loc3_:* = param2.code;
                        switch(0)
                        {
                        }
                        _7237("Error: #" + param2.code + ". " + (param2.message || param2.msg));
                     }
                  });
               }
               else
               {
                  mode = MODE_REG_2;
               }
            }
            else
            {
               switch(result.code)
               {
                  case _12461.MailRegistered:
                     _7237(tr("LoginWindow.EmailAlreadyExist"));
                     break;
                  default:
                     _7237("Error: #" + result.code + ". " + (result.message || result.msg));
               }
            }
         });
      }
      
      private function register() : void
      {
         this.processing = true;
         this._12569.register(this.code,this.email,this.username,this.password,function(param1:Boolean, param2:Object):void
         {
            processing = false;
            if(param1)
            {
               close();
               _12569.login(email,password,1,null);
               Alert.show(tr("Alert.operateSuccessful"),"");
            }
            else
            {
               switch(param2.code)
               {
                  case _12461.MailInvalid:
                     _7237(tr("LoginWindow.EmailInvalid"));
                     break;
                  case _12461.MailRegistered:
                     _7237(tr("LoginWindow.EmailAlreadyExist"));
                     break;
                  case _12461.UsernameInvalid:
                     _7237(tr("LoginWindow.UsernameInvalid"));
                     break;
                  case _12461.UsernameRegistered:
                     _7237(tr("LoginWindow.UsernameAlreadyExist"));
                     break;
                  case _12461.PasswordInvalid:
                     _7237(tr("LoginWindow.PasswordInvalid"));
                     break;
                  case _12461.IDExpired:
                  case _12461.IDTimeout:
                     _7237(tr("LoginWindow.CodeIncorrect"));
                     break;
                  default:
                     _7237("Error: #" + param2.code + ". " + (param2.message || param2.msg));
               }
            }
         });
      }
      
      private function _12853() : void
      {
         var timer:Timer = _12840[this.email];
         if(!timer)
         {
            this.processing = true;
            this._12569.resetPasswordA(this.email,function(param1:Boolean, param2:Object):void
            {
               processing = false;
               if(param1)
               {
                  mode = MODE_RESET_2;
               }
               else
               {
                  switch(param2.code)
                  {
                     case _12461.MailInvalid:
                        _7237(tr("LoginWindow.EmailInvalid"));
                        break;
                     case _12461.MailUnregistered:
                        _7237(tr("LoginWindow.EmailNotExist"));
                        break;
                     case _12461.MailLocked:
                        _7237(tr("LoginWindow.AccountFreezed"));
                        break;
                     case _12461.MailLimit:
                        _7237(tr("LoginWindow.RetrievePasswordLimit"));
                        break;
                     case _12461.UsernameInvalid:
                        _7237(tr("LoginWindow.AccountFreezed"));
                        break;
                     default:
                        _7237("Error: #" + param2.code + ". " + (param2.message || param2.msg));
                  }
               }
            });
         }
         else
         {
            this.mode = MODE_RESET_2;
         }
      }
      
      private function resetPassword() : void
      {
         this.processing = true;
         this._12569.resetPasswordB(this.code,this.email,this.password,function(param1:Boolean, param2:Object):void
         {
            processing = false;
            if(param1)
            {
               if(_12594.mail === email)
               {
                  close();
                  _12569.login(email,password,1,null);
               }
               else
               {
                  mode = MODE_LOGIN;
               }
               Alert.show(tr("Alert.operateSuccessful"),"");
            }
            else
            {
               switch(param2.code)
               {
                  case _12461.MailInvalid:
                     _7237(tr("LoginWindow.EmailInvalid"));
                     break;
                  case _12461.MailUnregistered:
                     _7237(tr("LoginWindow.EmailNotExist"));
                     break;
                  case _12461.MailLocked:
                     _7237(tr("LoginWindow.AccountFreezed"));
                     break;
                  case _12461.UsernameInvalid:
                     _7237(tr("LoginWindow.AccountFreezed"));
                     break;
                  case _12461.IDExpired:
                     _7237(tr("LoginWindow.CodeIncorrect"));
                     break;
                  default:
                     _7237("Error: #" + param2.code + ". " + (param2.message || param2.msg));
               }
            }
         });
      }
      
      private function login() : void
      {
         this._12569.login(this.email,this.password,1,function(param1:Boolean, param2:Object):void
         {
            if(_12594._3766)
            {
               if(_7238 != null)
               {
                  _7238();
                  _7238 = null;
               }
               close();
            }
            else
            {
               _7233.text = "";
               switch(param2.code)
               {
                  case _12461.MailInvalid:
                  case _12461.PasswordInvalid:
                     _7237(tr("LoginWindow.EmailOrPasswordError"));
                     break;
                  case _12461.LoginLimit:
                     close();
                     _12569._1567(new _12475(_12475.SHOW_LIMIT));
                     break;
                  default:
                     _7237("Error: #" + param2.code + ". " + (param2.message || param2.msg));
               }
            }
         });
      }
      
      private function _5388(param1:TimerEvent) : void
      {
         var _loc3_:String = null;
         var _loc2_:Timer = param1.currentTarget as Timer;
         if(_loc2_)
         {
            _loc3_ = _12840[_loc2_];
            delete _12840[_loc2_];
            delete _12840[_loc3_];
            _loc3_ = _12841[_loc2_];
            delete _12841[_loc2_];
            delete _12841[_loc3_];
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this._12864(param1.currentTarget as Timer);
      }
      
      private function _12864(param1:Timer) : void
      {
         var _loc2_:int = param1.repeatCount - param1.currentCount;
         if(_loc2_ == 0)
         {
            this._12764.text = tr("LoginWindow.SendEmailAgain");
            this._12851();
         }
         else
         {
            this._12764.textColor = 10066329;
            if(param1.currentCount < 5)
            {
               this._12764.text = tr("LoginWindow.EmailSent");
            }
            else
            {
               this._12764.text = tr("LoginWindow.EmailSentTimerToSentAgain",_loc2_);
            }
         }
      }
      
      private function _12857() : void
      {
         this._12764.removeEventListener(MouseEvent.CLICK,this._12854);
         this._12764.removeEventListener(MouseEvent.ROLL_OVER,this._12847);
         this._12764.removeEventListener(MouseEvent.ROLL_OUT,this._12850);
      }
      
      private function _12851() : void
      {
         this._12764.addEventListener(MouseEvent.CLICK,this._12854);
         this._12764.addEventListener(MouseEvent.ROLL_OVER,this._12847);
         this._12764.addEventListener(MouseEvent.ROLL_OUT,this._12850);
         this._12850(null);
      }
      
      private function _12854(param1:MouseEvent) : void
      {
         this._12857();
         switch(this._mode)
         {
            case MODE_REG_2:
               this._12856();
               this._12839(_12841);
               break;
            case MODE_RESET_2:
               this._12853();
               this._12839(_12840);
         }
         this._12764.textColor = 10066329;
      }
      
      private function _12847(param1:MouseEvent) : void
      {
         this._12764.textColor = 4647661;
      }
      
      private function _12850(param1:MouseEvent) : void
      {
         this._12764.textColor = 16711422;
      }
      
      private function _12858() : Boolean
      {
         var _loc1_:RegExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+(w+([.-]\w+))*/;
         var _loc2_:Boolean = Boolean(_loc1_.test(this._12762.text));
         if(!_loc2_)
         {
            this._12764.text = tr("LoginWindow.EmailInvalid");
            return false;
         }
         this._12764.text = "";
         return true;
      }
      
      private function _12855() : Boolean
      {
         if(this._12860.text.length < 3 || this._12860.text.length > 15)
         {
            this._12866.text = tr("LoginWindow.Username3-15");
            return false;
         }
         this._12866.text = "";
         return true;
      }
      
      private function _12753() : Boolean
      {
         var _loc1_:RegExp = /[a-z]/;
         if(this._7233.text.length < 6)
         {
            this._12867.text = tr("LoginWindow.PasswordTooShort");
         }
         else
         {
            if(_loc1_.test(this._7233.text))
            {
               this._12867.text = "";
               return true;
            }
            this._12867.text = tr("LoginWindow.PasswordTooSimple");
         }
         return false;
      }
      
      private function _12745() : Boolean
      {
         if(this._12845.text != this._7233.text)
         {
            this._12849.text = tr("LoginWindow.ConfirmPasswordNotSame");
            return false;
         }
         this._12849.text = "";
         return true;
      }
      
      private function _12761() : Boolean
      {
         var _loc1_:Boolean = this._mode == MODE_LOGIN || this._12858();
         _loc1_ &&= this._mode != MODE_REG_2 || this._12855();
         _loc1_ &&= this._mode != MODE_REG_2 && this._mode != MODE_RESET_2 || this._12753();
         return _loc1_ && (this._mode != MODE_REG_2 && this._mode != MODE_RESET_2 || this._12745());
      }
      
      protected function _7232(param1:Event) : void
      {
         this._12844();
      }
      
      private function _12846() : void
      {
         this._10525.enabled = !this._12865;
      }
      
      private function _12844() : void
      {
         this._10524.enabled = false;
         if(this._12865)
         {
            return;
         }
         switch(this._mode)
         {
            case MODE_LOGIN:
               if(this._12762.text.length > 0 && this._7233.text.length > 0)
               {
                  this._10524.enabled = true;
               }
               break;
            case MODE_REG_1:
            case MODE_RESET_1:
               if(this._12762.text.length > 0)
               {
                  this._10524.enabled = true;
               }
               break;
            case MODE_REG_2:
               if(this._12762.text.length > 0 && this._12870.text.length > 0 && this._12860.text.length > 0 && this._7233.text.length > 0 && this._12845.text.length > 0)
               {
                  this._10524.enabled = true;
               }
               break;
            case MODE_RESET_2:
               if(this._12762.text.length > 0 && this._12870.text.length > 0 && this._7233.text.length > 0 && this._12845.text.length > 0)
               {
                  this._10524.enabled = true;
               }
         }
      }
      
      protected function _12752(param1:FocusEvent) : void
      {
         ((param1.currentTarget.parent as Group).getChildAt(2) as Label).text = "";
      }
      
      protected function _12750(param1:FocusEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this._12762:
               if(this._12858() && this._mode === MODE_REG_1)
               {
                  this._12852();
               }
               break;
            case this._12860:
               if(this._12855() && this._mode === MODE_REG_2)
               {
                  this._12848();
               }
               break;
            case this._7233:
               if(this._mode != MODE_LOGIN)
               {
                  this._12753();
               }
               break;
            case this._12845:
               this._12745();
         }
      }
      
      private function _7237(param1:String) : void
      {
         this._7235.textColor = 16711680;
         this._7235.text = param1;
      }
      
      private function showText(param1:String) : void
      {
         this._7235.textColor = 16711422;
         this._7235.text = param1;
      }
      
      public function get email() : String
      {
         if(Boolean(this._12762) && Boolean(this._12762.text))
         {
            return this._12762.text;
         }
         return "";
      }
      
      public function get code() : String
      {
         if(Boolean(this._12870) && Boolean(this._12870.text))
         {
            return this._12870.text;
         }
         return "";
      }
      
      public function get username() : String
      {
         if(Boolean(this._12860) && Boolean(this._12860.text))
         {
            return this._12860.text;
         }
         return "";
      }
      
      public function get password() : String
      {
         if(Boolean(this._7233) && Boolean(this._7233.text))
         {
            return this._7233.text;
         }
         return "";
      }
      
      private function get _12762() : TextInput
      {
         return this._12763.getChildAt(1) as TextInput;
      }
      
      private function get _12764() : Label
      {
         return this._12763.getChildAt(2) as Label;
      }
      
      private function get _12870() : TextInput
      {
         return this._12869.getChildAt(1) as TextInput;
      }
      
      private function get _12871() : Label
      {
         return this._12869.getChildAt(2) as Label;
      }
      
      private function get _12860() : TextInput
      {
         return this._12862.getChildAt(1) as TextInput;
      }
      
      private function get _12866() : Label
      {
         return this._12862.getChildAt(2) as Label;
      }
      
      private function get _12859() : Label
      {
         return this._12863.getChildAt(0) as Label;
      }
      
      private function get _7233() : TextInput
      {
         return this._12863.getChildAt(1) as TextInput;
      }
      
      private function get _12867() : Label
      {
         return this._12863.getChildAt(2) as Label;
      }
      
      private function get _12843() : Label
      {
         return this._12842.getChildAt(0) as Label;
      }
      
      private function get _12845() : TextInput
      {
         return this._12842.getChildAt(1) as TextInput;
      }
      
      private function get _12849() : Label
      {
         return this._12842.getChildAt(2) as Label;
      }
   }
}

