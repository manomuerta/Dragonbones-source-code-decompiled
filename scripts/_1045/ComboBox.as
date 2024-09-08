package _1045
{
   import _1088._1092;
   import _1088._1094;
   import _1177.UIEvent;
   import egret.core.ns_egret;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   
   use namespace ns_egret;
   
   public class ComboBox extends _1092
   {
      private static const _2469:int = _1094.ns_egret::_2469;
      
      public var textInput:TextInput;
      
      private var _7418:Number = -1;
      
      private var _7433:Boolean;
      
      private var _7423:String = "";
      
      public var _7425:Function = null;
      
      private var _7426:Function;
      
      private var _7420:Boolean = false;
      
      private var _7447:String;
      
      private var _7441:Boolean = false;
      
      private var _7445:int = 0;
      
      private var _7435:Boolean = false;
      
      public var _7443:Boolean = true;
      
      private var _7444:String;
      
      private var _7434:Boolean;
      
      public function ComboBox()
      {
         super();
         ns_egret::_2460 = true;
      }
      
      public function set _7428(param1:Function) : void
      {
         if(param1 == this._7426)
         {
            return;
         }
         this._7426 = param1;
         this._7420 = true;
         _2466();
      }
      
      public function get _7428() : Function
      {
         return this._7426;
      }
      
      public function get prompt() : String
      {
         return this._7447;
      }
      
      public function set prompt(param1:String) : void
      {
         if(this._7447 == param1)
         {
            return;
         }
         this._7447 = param1;
         this._7441 = true;
         _2466();
      }
      
      public function get maxChars() : int
      {
         return this._7445;
      }
      
      public function set maxChars(param1:int) : void
      {
         if(param1 == this._7445)
         {
            return;
         }
         this._7445 = param1;
         this._7435 = true;
         _2466();
      }
      
      public function get restrict() : String
      {
         return this._7444;
      }
      
      public function set restrict(param1:String) : void
      {
         if(param1 == this._7444)
         {
            return;
         }
         this._7444 = param1;
         this._7434 = true;
         _2466();
      }
      
      override public function set selectedIndex(param1:int) : void
      {
         super.selectedIndex = param1;
         this._7418 = param1;
      }
      
      override ns_egret function set _7421(param1:Number) : void
      {
         super.ns_egret::_7421 = param1;
         this._7418 = param1;
      }
      
      private function _7432() : void
      {
         var _loc1_:Vector.<int> = null;
         var _loc2_:int = 0;
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         this._7418 = _2469;
         if(!dataProvider || dataProvider.length <= 0)
         {
            return;
         }
         if(this.textInput.text != "")
         {
            if(this._7425 != null)
            {
               _loc1_ = this._7425(this,this.textInput.text);
            }
            else
            {
               _loc1_ = this._7431(this.textInput.text);
            }
            if(_loc1_.length > 0)
            {
               super.ns_egret::_7419(_loc1_[0],true);
               _loc2_ = this.textInput.text.length;
               _loc3_ = !!dataProvider ? dataProvider.getItemAt(_loc1_[0]) : undefined;
               if(_loc3_)
               {
                  _loc4_ = _7442(_loc3_);
                  _loc5_ = this.textInput.text.length;
                  this._7423 = this.textInput.text;
                  this.textInput.text = _loc4_;
                  this.textInput.setSelection(_loc5_,_loc4_.length);
               }
            }
            else
            {
               super.ns_egret::_7419(_2469);
            }
         }
         else
         {
            super.ns_egret::_7419(NO_SELECTION);
         }
      }
      
      private function _7431(param1:String) : Vector.<int>
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Vector.<int> = new Vector.<int>();
         _loc4_ = this._7439(param1,0,dataProvider.length);
         if(_loc4_ != -1)
         {
            _loc5_.push(_loc4_);
         }
         return _loc5_;
      }
      
      private function _7439(param1:String, param2:int, param3:int) : Number
      {
         var _loc4_:String = null;
         while(param2 != param3)
         {
            _loc4_ = _7442(dataProvider.getItemAt(param2));
            _loc4_ = _loc4_.substring(0,param1.length);
            if(param1 == _loc4_ || param1.toUpperCase() == _loc4_.toUpperCase())
            {
               return param2;
            }
            param2++;
         }
         return -1;
      }
      
      private function _7424() : *
      {
         var _loc1_:String = this.textInput.text;
         if(_loc1_ == "")
         {
            return undefined;
         }
         if(this._7428 != null)
         {
            return this._7426(_loc1_);
         }
         return _loc1_;
      }
      
      ns_egret function _7437() : void
      {
         var _loc1_:* = undefined;
         if(this._7418 == _2469)
         {
            _loc1_ = this._7424();
            if(_loc1_ != undefined)
            {
               ns_egret::_2479(_loc1_,true);
            }
            else
            {
               ns_egret::_2475(NO_SELECTION,true);
            }
         }
         else
         {
            ns_egret::_2475(this._7418,true);
         }
         if(this.textInput)
         {
            this.textInput.setSelection(-1,-1);
         }
         this._7433 = false;
      }
      
      override protected function _2476() : void
      {
         var _loc1_:* = ns_egret::_2461 != ns_egret::NO_PROPOSED_SELECTION;
         if(ns_egret::_2461 == _2469 && ns_egret::_2468 == undefined)
         {
            ns_egret::_2461 = ns_egret::NO_PROPOSED_SELECTION;
         }
         super._2476();
         if(this.textInput)
         {
            if(this._7441)
            {
               this.textInput.prompt = this._7447;
               this._7441 = false;
            }
            if(this._7435)
            {
               this.textInput.maxChars = this._7445;
               this._7435 = false;
            }
            if(this._7434)
            {
               this.textInput.restrict = this._7444;
               this._7434 = false;
            }
         }
         if(_loc1_ && selectedIndex == NO_SELECTION)
         {
            this._7423 = this.textInput.text = "";
         }
      }
      
      override ns_egret function _7430(param1:* = undefined) : void
      {
         super.ns_egret::_7430();
         if(this.textInput)
         {
            if(param1 == undefined)
            {
               param1 = _2484;
            }
            if(param1 != null && param1 != undefined)
            {
               this._7423 = this.textInput.text = _7442(param1);
            }
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.textInput)
         {
            this.ns_egret::_7430();
            this.textInput.addEventListener(Event.CHANGE,this._7422);
            this.textInput.addEventListener(FocusEvent.FOCUS_OUT,this._7427);
            this.textInput.addEventListener(KeyboardEvent.KEY_DOWN,this._7436);
            this.textInput.maxChars = this.maxChars;
            this.textInput.restrict = this.restrict;
         }
      }
      
      private function _7427(param1:FocusEvent) : void
      {
         this.ns_egret::_7437();
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.textInput)
         {
            this.textInput.removeEventListener(Event.CHANGE,this._7422);
            this.textInput.removeEventListener(FocusEvent.FOCUS_OUT,this._7427);
            this.textInput.removeEventListener(KeyboardEvent.KEY_DOWN,this._7436);
         }
      }
      
      protected function _7436(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.ns_egret::_7437();
            _7440(true);
         }
      }
      
      override ns_egret function _7419(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:Object = null;
         var _loc4_:String = null;
         super.ns_egret::_7419(param1,param2);
         if(param1 >= 0)
         {
            _loc3_ = !!dataProvider ? dataProvider.getItemAt(param1) : undefined;
            if(Boolean(_loc3_) && Boolean(this.textInput))
            {
               _loc4_ = _7442(_loc3_);
               this._7423 = this.textInput.text = _loc4_;
               this.textInput.selectAll();
               this._7433 = false;
            }
         }
      }
      
      override public function _2581() : void
      {
         if(Boolean(stage) && Boolean(this.textInput))
         {
            stage.focus = this.textInput._2577 as InteractiveObject;
         }
      }
      
      override ns_egret function _7417(param1:UIEvent) : void
      {
         super.ns_egret::_7417(param1);
         this.ns_egret::_7421 = this._7433 ? NO_SELECTION : selectedIndex;
      }
      
      override protected function _7416(param1:UIEvent) : void
      {
         super._7416(param1);
         if(!param1.isDefaultPrevented())
         {
            this.ns_egret::_7437();
         }
      }
      
      override protected function _2485(param1:int) : void
      {
         if(param1 == selectedIndex)
         {
            this.ns_egret::_7430("");
         }
         super._2485(param1);
      }
      
      protected function _7422(param1:Event) : void
      {
         this._7433 = true;
         if(this._7423.length > this.textInput.text.length)
         {
            super.ns_egret::_7419(_2469);
         }
         else if(this._7423 != this.textInput.text)
         {
            if(this._7443)
            {
               if(!_7438)
               {
                  _6629();
                  addEventListener(UIEvent.OPEN,this._7429);
                  return;
               }
            }
            this._7432();
         }
         this._7423 = this.textInput.text;
      }
      
      private function _7429(param1:UIEvent) : void
      {
         removeEventListener(UIEvent.OPEN,this._7429);
         this._7432();
      }
   }
}

