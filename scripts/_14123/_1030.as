package _14123
{
   import _1033._12500;
   import _1045.Button;
   import _1045.Group;
   import _1045._1107;
   import _1177.CloseEvent;
   import _1177.UIEvent;
   import _1185._1197;
   import _127._14039;
   import _127._171;
   import _1374.Alert;
   import _1404._1407;
   import _1529._1528;
   import _1529._1530;
   import _472._12461;
   import _472._471;
   import _625.SettingWindowController;
   import _639._642;
   import _648._12463;
   import _783._12475;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   
   public class _1030 extends _171
   {
      public static var _14317:int = 0;
      
      private var _2642:_14039;
      
      private var _14952:_1107;
      
      public var _14658:_14124;
      
      public var _14659:_14127;
      
      public var _14956:_14128;
      
      public var _14661:_14125;
      
      public var _14954:_14122;
      
      private var content:Group;
      
      public var _7283:Button;
      
      private var _7310:uint;
      
      private var _7305:uint;
      
      private var _14951:int;
      
      private var _4062:Number;
      
      private var _6510:Number;
      
      public function _1030()
      {
         this._12594 = _1407.getInstance(_12463);
         this._12569 = _1407.getInstance(_12461);
         this._2642 = new _14039();
         this._14658 = new _14124();
         this._14659 = new _14127();
         this._14956 = new _14128();
         this._14661 = new _14125();
         this._14954 = new _14122();
         super();
         title = tr("Setting.Title");
         this._4062 = _642.getInstance().backgroundSize;
         this._6510 = _642.getInstance().boneSize;
         resizable = false;
         doubleClickEnabled = false;
         if(_1528.language == _1530.en_US)
         {
            this.width = 629;
            this.height = 445;
         }
         else
         {
            this.width = 551;
            this.height = 445;
         }
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.content = _125._2398(0);
         this.content.percentHeight = 100;
         this.content.percentWidth = 100;
         var _loc1_:_1197 = _1197(_2512.layout);
         _loc1_._2410 = 10;
         var _loc2_:Group = new Group();
         _loc2_.graphics.lineStyle(1,0);
         _loc2_.graphics.beginFill(2041905);
         _loc2_.graphics.drawRect(0,0,110,310);
         _loc2_.graphics.endFill();
         _loc2_.percentHeight = 100;
         _loc2_.width = 110;
         this._2642.percentWidth = 100;
         var _loc3_:_1197 = new _1197();
         _loc3_.gap = 0;
         this._2642.layout = _loc3_;
         this._2642._14334([tr("Setting.Normal"),tr("Setting.System"),tr("Setting.View"),tr("Setting.export.ruler"),tr("Setting.Account")]);
         this._2642._14317 = _14317;
         _loc2_.addElement(this._2642);
         this.content.addElement(_loc2_);
         var _loc4_:Group;
         (_loc4_ = new Group()).percentHeight = 100;
         _loc4_.percentWidth = 100;
         this._14952 = new _1107();
         this._14952.percentWidth = 100;
         this._14952.percentHeight = 100;
         this._14952.addElement(this._14658);
         this._14952.addElement(this._14659);
         this._14952.addElement(this._14956);
         this._14952.addElement(this._14661);
         this._14952.addElement(this._14954);
         this._14952.selectedIndex = _14317;
         _loc4_.addElement(this._14952);
         this.content.addElement(_loc4_);
         var _loc5_:Group;
         (_loc5_ = new Group()).percentWidth = 100;
         this._7283 = _125._2399();
         this._7283.horizontalCenter = 0;
         _loc5_.addElement(this._7283);
         var _loc6_:_12500;
         (_loc6_ = new _12500()).left = 0;
         _loc6_.right = 16;
         _2512.addElement(this.content);
         _2512.addElement(_loc6_);
         _2512.addElement(_loc5_);
         this._14955();
         this._12694();
      }
      
      private function _14955() : void
      {
         this._2642.addEventListener(Event.CHANGE,this._14953);
         this._7283.addEventListener(MouseEvent.CLICK,_2517);
         this._14956._7309.addEventListener(MouseEvent.CLICK,this._6641);
         this._14956._7309.addEventListener(Event.CHANGE,this._4052);
         this._14956._7309.addEventListener(UIEvent.CONFIRM,this._4052);
         this._14956._7309.addEventListener(Event.CANCEL,this._4052);
         this._14956._7309.addEventListener(Event.CLEAR,this._4052);
         this._14956._7303.addEventListener(MouseEvent.CLICK,this._6641);
         this._14956._7303.addEventListener(Event.CHANGE,this._4052);
         this._14956._7303.addEventListener(UIEvent.CONFIRM,this._4052);
         this._14956._7303.addEventListener(Event.CANCEL,this._4052);
         this._14956._7303.addEventListener(Event.CLEAR,this._4052);
         this._14956._7313.txt.addEventListener(FocusEvent.FOCUS_OUT,this._4037);
         this._14956._7313._2599 = this._4037;
         this._14956._7307.addEventListener(Event.CHANGE,this._4039);
         this._14956._7307.addEventListener(UIEvent.CHANGE_END,this._4030);
         this._14956._7307.addEventListener(UIEvent.CHANGE_START,this._4026);
         this._14956._7306.txt.addEventListener(FocusEvent.FOCUS_OUT,this._6506);
         this._14956._7306._2599 = this._6506;
         this._14956._7302.addEventListener(Event.CHANGE,this._4039);
         this._14956._7302.addEventListener(UIEvent.CHANGE_END,this._4030);
         this._14956._7302.addEventListener(UIEvent.CHANGE_START,this._4026);
         this._14661._14950.addEventListener(MouseEvent.CLICK,this._6641);
         this._14661._14950.addEventListener(Event.CHANGE,this._4052);
         this._14661._14950.addEventListener(UIEvent.CONFIRM,this._4052);
         this._14661._14950.addEventListener(Event.CANCEL,this._4052);
         this._14661._14950.addEventListener(Event.CLEAR,this._4052);
         this._14954._3761.addEventListener(MouseEvent.CLICK,this._7308);
         this._14954._12888.addEventListener(MouseEvent.CLICK,this._7308);
      }
      
      public function _12694() : void
      {
         if(this._12594._3766)
         {
            this._14954._7314.text = this._12594.mail;
            this._14954._3761.label = tr("Setting.Logout");
            this._14954._12888.visible = this._14954._12888.includeInLayout = true;
            this._14954._12889.visible = this._14954._12889.includeInLayout = true;
         }
         else
         {
            this._14954._7314.text = tr("Setting.User");
            this._14954._3761.label = tr("Setting.Login");
            this._14954._12888.visible = this._14954._12888.includeInLayout = false;
            this._14954._12889.visible = this._14954._12889.includeInLayout = false;
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._14658.deleteCheckBox.selected = _642.getInstance().deleteConfirm;
         this._14658.imageCheckBox.selected = _642.getInstance().imageSmooth;
         this._14658.boneCheckBox.selected = _642.getInstance().autoBindSlot;
         this._14956._7309._4061 = _642.getInstance().backgroundColor;
         this._14956._7303._4061 = _642.getInstance().boneColor;
         this._14956._7313.txt.text = _642.getInstance().backgroundSize.toString();
         this._14956._7307.value = _642.getInstance().backgroundSize;
         this._14956._7306.txt.text = _642.getInstance().boneSize.toString();
         this._14956._7302.value = _642.getInstance().boneSize;
         this._14661.rulerCheckBox.selected = _642.getInstance().useruler;
         this._14661.rlineCheckBox.selected = _642.getInstance().assistLine;
         this._14661.rLineSelectCheckBox.selected = _642.getInstance().assistLineenable;
         this._14661._14950._4061 = _642.getInstance().assistLineColor;
         this._12694();
         var _loc3_:String = _642.getInstance().language;
         if(_loc3_ == null)
         {
            _loc3_ = _1528.language;
         }
         switch(_loc3_)
         {
            case _1530.zh_CN:
               this._14658._11716.selectedIndex = 0;
               break;
            case _1530.en_US:
               this._14658._11716.selectedIndex = 1;
               break;
            default:
               this._14658._11716.selectedIndex = 2;
         }
      }
      
      private function _7308(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var appCtrl:_471 = _1407.getInstance(_471) as _471;
         if(e.target === this._14954._3761)
         {
            if(this._12594._3766)
            {
               this._12569.logout(1,null,true);
            }
            else
            {
               this._12569._1567(new _12475(_12475.SHOW_LOGIN));
            }
         }
         else
         {
            Alert.show(tr("Alert.deauthorizeConfirm"),"",null,function(param1:CloseEvent):void
            {
               var event:CloseEvent = param1;
               if(event.detail == Alert.FIRST_BUTTON)
               {
                  _12569.logout(2,function(param1:Boolean, param2:Object):void
                  {
                     if(param1)
                     {
                        Alert.show(tr("Alert.deauthorizeSucess"),"",null,null,tr("Alert.Confirm"));
                     }
                  },true);
               }
            },tr("Alert.Confirm"),tr("Alert.Cancel"));
         }
      }
      
      private function _4052(param1:Event) : void
      {
         var _loc2_:Number = 1;
         switch(param1.currentTarget)
         {
            case this._14956._7309:
               if(param1.type == Event.CLEAR || param1.type == UIEvent.CONFIRM)
               {
                  if(this._14956._7309._4061 != this._7310)
                  {
                     this._7310 = this._14956._7309._4061;
                     _642.getInstance().backgroundColor = this._7310;
                     this._7300._5612();
                     this._7300._13909();
                  }
               }
               else if(param1.type == Event.CHANGE || param1.type == Event.CANCEL)
               {
                  this._7310 = this._14956._7309._4061;
                  _642.getInstance().backgroundColor = this._7310;
                  this._7300._5612();
                  this._7300._13909();
               }
               break;
            case this._14956._7303:
               if(param1.type == Event.CLEAR || param1.type == UIEvent.CONFIRM)
               {
                  if(this._14956._7303._4061 != this._7305)
                  {
                     this._7305 = this._14956._7303._4061;
                     _642.getInstance().boneColor = this._7305;
                     this._7300.updataBoneColor();
                  }
               }
               else if(param1.type == Event.CHANGE || param1.type == Event.CANCEL)
               {
                  this._7305 = this._14956._7303._4061;
                  _642.getInstance().boneColor = this._7305;
                  this._7300.updataBoneColor();
               }
               break;
            case this._14661._14950:
               if(param1.type == Event.CLEAR || param1.type == UIEvent.CONFIRM)
               {
                  if(this._14661._14950._4061 != this._14951)
                  {
                     this._14951 = this._14661._14950._4061;
                     _642.getInstance().assistLineColor = this._14951;
                     this._7300._14655();
                  }
               }
               else if(param1.type == Event.CHANGE || param1.type == Event.CANCEL)
               {
                  this._14951 = this._14661._14950._4061;
                  _642.getInstance().assistLineColor = this._14951;
                  this._7300._14655();
               }
         }
      }
      
      private function _6641(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this._14956._7309:
               this._7310 = this._14956._7309._4061;
               _642.getInstance().backgroundColor = this._7310;
               break;
            case this._14956._7303:
               this._7305 = this._14956._7303._4061;
               _642.getInstance().boneColor = this._7305;
               break;
            case this._14661._14950:
               this._14951 = this._14661._14950._4061;
               _642.getInstance().assistLineColor = this._14951;
         }
      }
      
      private function _4039(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         switch(param1.currentTarget)
         {
            case this._14956._7307:
               _loc2_ = this._14956._7307.value;
               this._14956._7313.txt.text = _loc2_.toString();
               _642.getInstance().backgroundSize = _loc2_;
               this._7300._5612();
               break;
            case this._14956._7302:
               _loc3_ = this._14956._7302.value;
               this._14956._7306.txt.text = _loc3_.toString();
               _642.getInstance().boneSize = _loc3_;
               this._7300.updataBoneSize();
         }
      }
      
      private function _4030(param1:Event) : void
      {
         switch(param1.currentTarget)
         {
            case this._14956._7307:
               this._4037(null);
               break;
            case this._14956._7302:
               this._6506(null);
         }
      }
      
      private function _4026(param1:Event) : void
      {
         switch(param1.currentTarget)
         {
            case this._14956._7307:
               this._4062 = int(this._14956._7307.value);
               break;
            case this._14956._7302:
               this._6510 = int(this._14956._7302.value);
         }
      }
      
      private function _4037(param1:FocusEvent) : void
      {
         var _loc2_:Number = Number(this._14956._7313.txt.text);
         if(_loc2_ > 100)
         {
            _loc2_ = 100;
         }
         else if(_loc2_ < 5)
         {
            _loc2_ = 5;
         }
         var _loc3_:Number = this._4062;
         if(_loc3_ != _loc2_)
         {
            this._14956._7307.value = _loc2_;
            this._14956._7313.txt.text = _loc2_.toString();
            _642.getInstance().backgroundSize = _loc2_;
            this._7300._5612();
            this._4062 = _loc2_;
         }
      }
      
      private function _6506(param1:FocusEvent) : void
      {
         var _loc2_:Number = Number(this._14956._7306.txt.text);
         if(_loc2_ > this._14956._7312)
         {
            _loc2_ = this._14956._7312;
         }
         else if(_loc2_ < this._14956._7311)
         {
            _loc2_ = this._14956._7311;
         }
         var _loc3_:Number = this._6510;
         if(_loc3_ != _loc2_)
         {
            this._14956._7302.value = _loc2_;
            this._14956._7306.txt.text = _loc2_.toString();
            _642.getInstance().boneSize = _loc2_;
            this._7300.updataBoneSize();
            this._6510 = _loc2_;
         }
      }
      
      private function _7252(param1:Event) : void
      {
         var _loc2_:int = int(param1.currentTarget.text);
         if(_loc2_ > this._14956._7316)
         {
            _loc2_ = this._14956._7316;
            param1.currentTarget.text = _loc2_.toString();
         }
         else if(_loc2_ < this._14956._7315)
         {
            _loc2_ = this._14956._7315;
            param1.currentTarget.text = _loc2_.toString();
         }
         switch(param1.currentTarget)
         {
            case this._14956._7313:
               if(_loc2_ != this._14956._7307.value)
               {
                  this._14956._7307.value = _loc2_;
                  _642.getInstance().backgroundSize = _loc2_;
                  this._7300._5612();
               }
               break;
            case this._14956._7306:
               if(_loc2_ != this._14956._7302.value)
               {
                  this._14956._7302.value = _loc2_;
                  _642.getInstance().boneSize = _loc2_;
                  this._7300.updataBoneSize();
               }
         }
      }
      
      private function _14953(param1:Event) : void
      {
         _14317 = this._2642._14317;
         this._14952.selectedIndex = _14317;
      }
      
      private function get _7300() : SettingWindowController
      {
         return _1407.getInstance(SettingWindowController) as SettingWindowController;
      }
   }
}

