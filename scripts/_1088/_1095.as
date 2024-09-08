package _1088
{
   import _1045._1085;
   import _1177.UIEvent;
   
   public class _1095 extends _1085
   {
      private var _8448:Number = 100;
      
      private var _8445:Boolean = false;
      
      private var _minimum:Number = 0;
      
      private var _8446:Boolean = false;
      
      private var _8447:Number = 1;
      
      private var _8441:Boolean = false;
      
      private var _value:Number = 0;
      
      private var _8443:Number = 0;
      
      private var _8444:Boolean = false;
      
      private var _8442:Number = 1;
      
      private var _8439:Boolean = false;
      
      private var _8438:Boolean = false;
      
      public function _1095()
      {
         super();
         _2576 = true;
      }
      
      public function get maximum() : Number
      {
         return this._8448;
      }
      
      public function set maximum(param1:Number) : void
      {
         if(param1 == this._8448)
         {
            return;
         }
         this._8448 = param1;
         this._8445 = true;
         _2466();
      }
      
      public function get minimum() : Number
      {
         return this._minimum;
      }
      
      public function set minimum(param1:Number) : void
      {
         if(param1 == this._minimum)
         {
            return;
         }
         this._minimum = param1;
         this._8446 = true;
         _2466();
      }
      
      public function get _8047() : Number
      {
         return this._8447;
      }
      
      public function set _8047(param1:Number) : void
      {
         if(param1 == this._8447)
         {
            return;
         }
         this._8447 = param1;
         this._8441 = true;
         _2466();
      }
      
      public function get value() : Number
      {
         return this._8444 ? this._8443 : this._value;
      }
      
      public function set value(param1:Number) : void
      {
         if(param1 == this.value)
         {
            return;
         }
         this._8443 = param1;
         this._8444 = true;
         _2466();
      }
      
      public function get _8236() : Number
      {
         return this._8442;
      }
      
      public function set _8236(param1:Number) : void
      {
         this._8438 = true;
         if(param1 == this._8442)
         {
            return;
         }
         if(isNaN(param1))
         {
            this._8442 = 1;
            this._8438 = false;
         }
         else
         {
            this._8442 = param1;
         }
         this._8439 = true;
         this._8441 = true;
         _2466();
      }
      
      override protected function _2476() : void
      {
         var _loc1_:Number = NaN;
         super._2476();
         if(this.minimum > this.maximum)
         {
            if(!this._8445)
            {
               this._minimum = this._8448;
            }
            else
            {
               this._8448 = this._minimum;
            }
         }
         if(this._8444 || this._8445 || this._8446 || this._8439)
         {
            _loc1_ = this._8444 ? this._8443 : this._value;
            this._8444 = false;
            this._8445 = false;
            this._8446 = false;
            this._8439 = false;
            this.setValue(this._8231(_loc1_,this._8236));
         }
         if(this._8441)
         {
            if(this._8438)
            {
               this._8447 = this._8440(this._8447);
            }
            else
            {
               this._8442 = this._8447;
               this.setValue(this._8231(this._value,this._8236));
            }
            this._8441 = false;
         }
      }
      
      private function _8440(param1:Number) : Number
      {
         var _loc2_:Number = this._8236;
         if(_loc2_ == 0)
         {
            return param1;
         }
         var _loc3_:Number = Math.round(param1 / _loc2_) * _loc2_;
         return Math.abs(_loc3_) < _loc2_ ? _loc2_ : _loc3_;
      }
      
      protected function _8231(param1:Number, param2:Number) : Number
      {
         var _loc8_:Array = null;
         if(param2 == 0)
         {
            return Math.max(this.minimum,Math.min(this.maximum,param1));
         }
         var _loc3_:Number = this.maximum - this.minimum;
         var _loc4_:Number = 1;
         param1 -= this.minimum;
         if(param2 != Math.round(param2))
         {
            _loc8_ = new String(1 + param2).split(".");
            _loc4_ = Math.pow(10,_loc8_[1].length);
            _loc3_ *= _loc4_;
            param1 = Math.round(param1 * _loc4_);
            param2 = Math.round(param2 * _loc4_);
         }
         var _loc5_:Number = Math.max(0,Math.floor(param1 / param2) * param2);
         var _loc6_:Number = Math.min(_loc3_,Math.floor((param1 + param2) / param2) * param2);
         var _loc7_:Number = param1 - _loc5_ >= (_loc6_ - _loc5_) / 2 ? _loc6_ : _loc5_;
         return _loc7_ / _loc4_ + this.minimum;
      }
      
      protected function setValue(param1:Number) : void
      {
         if(this._value == param1)
         {
            return;
         }
         if(isNaN(param1))
         {
            param1 = 0;
         }
         if(!isNaN(this.maximum) && !isNaN(this.minimum) && this.maximum > this.minimum)
         {
            this._value = Math.min(this.maximum,Math.max(this.minimum,param1));
         }
         else
         {
            this._value = param1;
         }
         this._8444 = false;
         this.dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT));
      }
      
      public function _8042(param1:Boolean = true) : void
      {
         if(this._8047 == 0)
         {
            return;
         }
         var _loc2_:Number = param1 ? this.value + this._8047 : this.value - this._8047;
         this.setValue(this._8231(_loc2_,this._8236));
      }
   }
}

