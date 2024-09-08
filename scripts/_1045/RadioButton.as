package _1045
{
   import _1088._1102;
   import _1177.UIEvent;
   import egret.core.ns_egret;
   import egret.utils._1295;
   
   use namespace ns_egret;
   
   public class RadioButton extends _1102
   {
      private static var _8238:_1295;
      
      ns_egret var _8242:int = 0;
      
      ns_egret var radioButtonGroup:_1081 = null;
      
      private var _5918:_1081;
      
      private var _8241:Boolean = false;
      
      private var _8245:String = "radioGroup";
      
      private var _value:Object;
      
      public function RadioButton()
      {
         super();
         this.groupName = "radioGroup";
      }
      
      override public function get enabled() : Boolean
      {
         if(!super.enabled)
         {
            return false;
         }
         return !this.ns_egret::radioButtonGroup || this.ns_egret::radioButtonGroup.enabled;
      }
      
      public function get group() : _1081
      {
         var _loc1_:_1081 = null;
         if(!this._5918 && Boolean(this._8245))
         {
            if(!_8238)
            {
               _8238 = new _1295();
            }
            _loc1_ = _8238.get(this._8245);
            if(!_loc1_)
            {
               _loc1_ = new _1081();
               _loc1_.ns_egret::name = this._8245;
               _8238.set(this._8245,_loc1_);
            }
            this._5918 = _loc1_;
         }
         return this._5918;
      }
      
      public function set group(param1:_1081) : void
      {
         if(this._5918 == param1)
         {
            return;
         }
         if(this.ns_egret::radioButtonGroup)
         {
            this.ns_egret::radioButtonGroup.ns_egret::_8240(this);
         }
         this._5918 = param1;
         this._8245 = !!param1 ? this.group.ns_egret::name : "radioGroup";
         this._8241 = true;
         _2466();
         invalidateDisplayList();
      }
      
      public function get groupName() : String
      {
         return this._8245;
      }
      
      public function set groupName(param1:String) : void
      {
         if(!param1 || param1 == "")
         {
            return;
         }
         this._8245 = param1;
         if(this.ns_egret::radioButtonGroup)
         {
            this.ns_egret::radioButtonGroup.ns_egret::_8240(this);
         }
         this._5918 = null;
         this._8241 = true;
         _2466();
         invalidateDisplayList();
      }
      
      override public function set selected(param1:Boolean) : void
      {
         super.selected = param1;
         invalidateDisplayList();
      }
      
      public function get value() : Object
      {
         return this._value;
      }
      
      public function set value(param1:Object) : void
      {
         if(this._value == param1)
         {
            return;
         }
         this._value = param1;
         if(selected && Boolean(this.group))
         {
            this.group.dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT));
         }
      }
      
      override protected function _2476() : void
      {
         if(this._8241)
         {
            this._8244();
            this._8241 = false;
         }
         super._2476();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         if(this.group)
         {
            if(selected)
            {
               this._5918.selection = this;
            }
            else if(this.group.selection == this)
            {
               this._5918.selection = null;
            }
         }
      }
      
      override protected function _8239() : void
      {
         if(!this.enabled || selected)
         {
            return;
         }
         if(!this.ns_egret::radioButtonGroup)
         {
            this._8244();
         }
         super._8239();
         this.group.ns_egret::setSelection(this);
      }
      
      private function _8244() : _1081
      {
         var _loc1_:_1081 = this.group;
         if(_loc1_)
         {
            _loc1_.ns_egret::_8243(this);
         }
         return _loc1_;
      }
   }
}

