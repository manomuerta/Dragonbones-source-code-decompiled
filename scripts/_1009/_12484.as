package _1009
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1177.UIEvent;
   import _127._171;
   import _1374.Alert;
   import _1374.TextInput;
   import _1404._1407;
   import _472._12461;
   import _648._12463;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   
   public class _12484 extends _171
   {
      private var _12763:Group;
      
      private var _12756:Group;
      
      private var _12755:Group;
      
      private var _12747:Group;
      
      private var _7235:Label;
      
      private var _10525:Button;
      
      private var _10524:Button;
      
      public function _12484()
      {
         this._12594 = _1407.getInstance(_12463);
         this._12569 = _1407.getInstance(_12461);
         super();
         this.title = tr("LoginWindow.TitleChangePassword");
         this.width = 480;
         this.maximizable = false;
         this.minimizable = false;
         this.resizable = false;
         this.addEventListener(UIEvent.CREATION_COMPLETE,this._7228);
      }
      
      protected function _7228(param1:UIEvent) : void
      {
         this.nativeWindow.stage.addEventListener(KeyboardEvent.KEY_DOWN,this._2575);
      }
      
      protected function _2575(param1:KeyboardEvent) : void
      {
         if(this._10525.enabled && param1.keyCode == Keyboard.ENTER)
         {
            this._12751(null);
         }
      }
      
      protected function _12751(param1:MouseEvent) : void
      {
         if(!this._12761())
         {
            return;
         }
         this.showText(tr("LoginWindow.Loading"));
         this.changePassword();
      }
      
      protected function _12749(param1:MouseEvent) : void
      {
         this.close();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         super._2438();
         _2512.top = _2512.bottom = 15;
         this._12763 = this._12765(tr("LoginWindow.Email"),this._12594.mail);
         this._12756 = this._12765(tr("LoginWindow.OldPassword"));
         this._12755 = this._12765(tr("LoginWindow.NewPassword"));
         this._12747 = this._12765(tr("LoginWindow.ConfirmNewPassword"));
         this._12757.displayAsPassword = this._12754.displayAsPassword = this._12746.displayAsPassword = true;
         this._7235 = new Label();
         this._7235.percentWidth = 100;
         this._7235.height = 20;
         this._7235.textAlign = TextFormatAlign.CENTER;
         this._7235._6080 = 1;
         _2512.addElement(this._7235);
         _loc1_ = _125._2397(20);
         _loc1_.percentWidth = 100;
         this._10525 = _125._12513("");
         this._10525.addEventListener(MouseEvent.CLICK,this._12751);
         _loc1_.addElement(this._10525);
         this._10524 = _125._12513("");
         this._10524.addEventListener(MouseEvent.CLICK,this._12749);
         _loc1_.addElement(this._10524);
         _2512.addElement(_loc1_);
         this._12762.enabled = false;
         this._12762.editable = false;
         this._10525.label = tr("LoginWindow.Submit");
         this._10524.label = tr("Dialog.cancel");
         this._10525.enabled = false;
         this._12762.maxChars = 48;
         this._12754.maxChars = 16;
         this._12757.maxChars = 16;
      }
      
      private function _12765(param1:String, param2:String = "", param3:String = "") : Group
      {
         var _loc4_:Group;
         (_loc4_ = new Group()).percentWidth = 100;
         _loc4_.height = 40;
         var _loc5_:Label;
         (_loc5_ = new Label()).text = param1;
         _loc5_.width = 100;
         _loc5_.top = 5;
         _loc5_.textAlign = "right";
         _loc4_.addElement(_loc5_);
         var _loc6_:TextInput;
         (_loc6_ = new TextInput()).left = _loc5_.width + 10;
         _loc6_.right = 65;
         _loc6_.text = param2;
         _loc6_.prompt = param3;
         _loc6_.addEventListener(Event.CHANGE,this._7232);
         _loc6_.addEventListener(FocusEvent.FOCUS_IN,this._12752);
         _loc6_.addEventListener(FocusEvent.FOCUS_OUT,this._12750);
         _loc4_.addElement(_loc6_);
         var _loc7_:Label;
         (_loc7_ = new Label()).percentWidth = 100;
         _loc7_.left = _loc5_.width + 10;
         _loc7_.top = 25;
         _loc7_.textColor = 16711680;
         _loc4_.addElement(_loc7_);
         _2512.addElement(_loc4_);
         return _loc4_;
      }
      
      protected function _7232(param1:Event) : void
      {
         this._10525.enabled = false;
         if(this._12762.text.length > 0 && this._12757.text.length > 0 && this._12754.text.length > 0 && this._12746.text.length > 0)
         {
            this._10525.enabled = true;
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
            case this._12754:
               this._12753();
               break;
            case this._12746:
               this._12745();
         }
      }
      
      private function _12753() : Boolean
      {
         var _loc1_:RegExp = /[a-z]/;
         if(this._12754.text.length < 6)
         {
            this._12758.text = tr("LoginWindow.PasswordTooShort");
         }
         else
         {
            if(_loc1_.test(this._12754.text))
            {
               this._12758.text = "";
               return true;
            }
            this._12758.text = tr("LoginWindow.PasswordTooSimple");
         }
         return false;
      }
      
      private function _12745() : Boolean
      {
         if(this._12746.text != this._12754.text)
         {
            this._12748.text = tr("LoginWindow.ConfirmPasswordNotSame");
            return false;
         }
         this._12748.text = "";
         return true;
      }
      
      private function _12761() : Boolean
      {
         var _loc1_:Boolean = this._12753();
         return _loc1_ && this._12745();
      }
      
      private function changePassword() : void
      {
         this._12569.changePassword(this._12684,this._12760,function(param1:Boolean, param2:Object):void
         {
            if(param1)
            {
               close();
               Alert.show(tr("Alert.operateSuccessful"),"");
            }
            else
            {
               switch(param2.code)
               {
                  case _12461.MailInvalid:
                     _7237(tr("LoginWindow.EmailOrPasswordError"));
                     break;
                  case _12461.MailUnregistered:
                     _7237(tr("LoginWindow.EmailNotExist"));
                     break;
                  case _12461.MailLocked:
                     _7237(tr("LoginWindow.AccountFreezed"));
                     break;
                  case _12461.UsernameInvalid:
                     _7237(tr("LoginWindow.UsernameInvalid"));
                     break;
                  case _12461.PasswordInvalid:
                     _7237(tr("LoginWindow.EmailOrPasswordError"));
                     break;
                  default:
                     _7237("Error: " + param2.code);
               }
            }
         });
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
      
      private function get email() : String
      {
         if(Boolean(this._12762) && Boolean(this._12762.text))
         {
            return this._12762.text;
         }
         return "";
      }
      
      private function get _12684() : String
      {
         if(Boolean(this._12757) && Boolean(this._12757.text))
         {
            return this._12757.text;
         }
         return "";
      }
      
      private function get _12760() : String
      {
         if(Boolean(this._12754) && Boolean(this._12754.text))
         {
            return this._12754.text;
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
      
      private function get _12757() : TextInput
      {
         return this._12756.getChildAt(1) as TextInput;
      }
      
      private function get _12759() : Label
      {
         return this._12756.getChildAt(2) as Label;
      }
      
      private function get _12754() : TextInput
      {
         return this._12755.getChildAt(1) as TextInput;
      }
      
      private function get _12758() : Label
      {
         return this._12755.getChildAt(2) as Label;
      }
      
      private function get _12746() : TextInput
      {
         return this._12747.getChildAt(1) as TextInput;
      }
      
      private function get _12748() : Label
      {
         return this._12747.getChildAt(2) as Label;
      }
   }
}

