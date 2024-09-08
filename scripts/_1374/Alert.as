package _1374
{
   import _1045.Button;
   import _1177.CloseEvent;
   import _1467._1466;
   import _1491._1490;
   import egret.core._1117;
   import egret.core._1135;
   import egret.core.ns_egret;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.display.NativeWindow;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   
   use namespace ns_egret;
   
   public class Alert extends Window
   {
      public static const FIRST_BUTTON:int = 1;
      
      public static const SECOND_BUTTON:int = 2;
      
      public static const THIRD_BUTTON:int = 3;
      
      public static const CLOSE_BUTTON:int = 4;
      
      private var _9528:_1135;
      
      private var _2496:String = "";
      
      private var _2494:String = "";
      
      private var _2495:String = "";
      
      private var _7415:String = "";
      
      private var _9529:Function;
      
      public var _2508:_1117;
      
      public var firstButton:Button;
      
      public var secondButton:Button;
      
      public var _2509:Button;
      
      public function Alert()
      {
         super();
         type = "utility";
         if(SystemInfo.isMacOS)
         {
            this.skinName = _1466;
         }
         else
         {
            this.skinName = _1490;
         }
      }
      
      public static function show(param1:String = "", param2:String = "", param3:_1135 = null, param4:Function = null, param5:String = "Alert.Confirm", param6:String = "", param7:String = "", param8:Boolean = true, param9:Number = NaN) : Alert
      {
         var _loc10_:Alert = null;
         (_loc10_ = new Alert())._2505 = param1;
         _loc10_.title = param2;
         param5 = tr(param5);
         _loc10_._2496 = param5;
         _loc10_._2494 = param6;
         _loc10_._2495 = param7;
         _loc10_._2503 = param4;
         _loc10_._2507 = param8;
         _loc10_._2504 = param3;
         if(!isNaN(param9))
         {
            _loc10_.width = param9;
         }
         _loc10_.open();
         return _loc10_;
      }
      
      override protected function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:CloseEvent = null;
         if(param1.keyCode == 13)
         {
            this._2517();
         }
         else if(param1.keyCode == Keyboard.ESCAPE)
         {
            close();
            if(this._2503 != null)
            {
               _loc2_ = new CloseEvent(CloseEvent.CLOSE);
               _loc2_.detail = Alert.CLOSE_BUTTON;
               this._2503(_loc2_);
            }
         }
      }
      
      override public function open(param1:Boolean = true) : void
      {
         super.open(param1);
         var _loc2_:NativeWindow = !!this._2504 ? this._2504.nativeWindow : Application.ns_egret::_9530.nativeWindow;
         var _loc3_:Rectangle = _loc2_.bounds;
         nativeWindow.x = Math.round(_loc3_.x + _loc3_.width * 0.5 - nativeWindow.width * 0.5);
         nativeWindow.y = Math.round(_loc3_.y + _loc3_.height * 0.5 - nativeWindow.height * 0.5);
         if(nativeWindow.x < 0)
         {
            nativeWindow.x = 0;
         }
         if(nativeWindow.y < 0)
         {
            nativeWindow.y = 0;
         }
      }
      
      public function get _2504() : _1135
      {
         return this._9528;
      }
      
      public function set _2504(param1:_1135) : void
      {
         this._9528 = param1;
      }
      
      public function get _2499() : String
      {
         return this._2496;
      }
      
      public function set _2499(param1:String) : void
      {
         if(this._2496 == param1)
         {
            return;
         }
         this._2496 = param1;
         if(this.firstButton)
         {
            this.firstButton.label = param1;
         }
      }
      
      public function get _2497() : String
      {
         return this._2494;
      }
      
      public function set _2497(param1:String) : void
      {
         if(this._2494 == param1)
         {
            return;
         }
         this._2494 = param1;
         if(this.secondButton)
         {
            if(param1 == null || param1 == "")
            {
               this.secondButton.includeInLayout = this.secondButton.visible = this._2494 != "" && this._2494 != null;
            }
         }
      }
      
      public function get _2498() : String
      {
         return this._2495;
      }
      
      public function set _2498(param1:String) : void
      {
         if(this._2495 == param1)
         {
            return;
         }
         this._2495 = param1;
         if(this._2509)
         {
            if(param1 == null || param1 == "")
            {
               this._2509.includeInLayout = this._2509.visible = this._2495 != "" && this._2495 != null;
            }
         }
      }
      
      public function get _2505() : String
      {
         return this._7415;
      }
      
      public function set _2505(param1:String) : void
      {
         if(this._7415 == param1)
         {
            return;
         }
         this._7415 = param1;
         if(this._2508)
         {
            this._2508.text = param1;
         }
      }
      
      public function get _2503() : Function
      {
         return this._9529;
      }
      
      public function set _2503(param1:Function) : void
      {
         this._9529 = param1;
      }
      
      override protected function _2517(param1:MouseEvent = null) : void
      {
         var _loc2_:CloseEvent = new CloseEvent(CloseEvent.CLOSE,false,true);
         if(this._2503 != null)
         {
            if(param1)
            {
               switch(param1.currentTarget)
               {
                  case this.firstButton:
                     _loc2_.detail = Alert.FIRST_BUTTON;
                     break;
                  case this.secondButton:
                     _loc2_.detail = Alert.SECOND_BUTTON;
                     break;
                  case this._2509:
                     _loc2_.detail = Alert.THIRD_BUTTON;
                     break;
                  case closeButton:
                     _loc2_.detail = Alert.CLOSE_BUTTON;
               }
            }
            else if(Boolean(this.firstButton) && this.firstButton.visible)
            {
               _loc2_.detail = Alert.FIRST_BUTTON;
            }
            else if(Boolean(this.secondButton) && this.secondButton.visible)
            {
               _loc2_.detail = Alert.SECOND_BUTTON;
            }
            else if(Boolean(this._2509) && this._2509.visible)
            {
               _loc2_.detail = Alert.THIRD_BUTTON;
            }
            else
            {
               _loc2_.detail = Alert.CLOSE_BUTTON;
            }
            this._2503(_loc2_);
         }
         if(!_loc2_.isDefaultPrevented())
         {
            close();
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._2508)
         {
            this._2508.text = this._7415;
         }
         else if(param2 == this.firstButton)
         {
            this.firstButton.label = this._2496;
            this.firstButton.addEventListener(MouseEvent.CLICK,this._2517);
         }
         else if(param2 == this.secondButton)
         {
            this.secondButton.label = this._2494;
            this.secondButton.includeInLayout = this.secondButton.visible = this._2494 != "" && this._2494 != null;
            this.secondButton.addEventListener(MouseEvent.CLICK,this._2517);
         }
         else if(param2 == this._2509)
         {
            this._2509.label = this._2495;
            this._2509.includeInLayout = this._2509.visible = this._2495 != "" && this._2495 != null;
            this._2509.addEventListener(MouseEvent.CLICK,this._2517);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.firstButton)
         {
            this.firstButton.removeEventListener(MouseEvent.CLICK,this._2517);
         }
         else if(param2 == this.secondButton)
         {
            this.secondButton.removeEventListener(MouseEvent.CLICK,this._2517);
         }
         else if(param2 == this._2509)
         {
            this._2509.removeEventListener(MouseEvent.CLICK,this._2517);
         }
      }
   }
}

