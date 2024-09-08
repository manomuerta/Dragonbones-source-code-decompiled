package _127
{
   import _1045.Group;
   import _1404._1407;
   import _579._580;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   
   public class _162 extends Group
   {
      public var txt:_159;
      
      public var _2588:_167;
      
      private var _2596:Number = 1;
      
      private var _2598:Number = 0;
      
      private var _minValue:Number = 0;
      
      private var _2586:Number;
      
      private var _2597:Function = null;
      
      private var _2595:Boolean = false;
      
      private var _2572:Boolean = false;
      
      private var _2594:uint = 8883859;
      
      public function _162()
      {
         this.txt = new _159();
         this._2588 = new _167();
         super();
         this._2592();
      }
      
      private function _2592() : void
      {
         this.txt.maxChars = 8;
         this.txt.restrict = "0-9.\\-";
         this.addElement(this.txt);
         this.addElement(this._2588);
         this._2588.right = 0;
         this._2588.top = 2;
         this._2588.addEventListener(_168.DOWN,this._2591);
         this._2588.addEventListener(_168.UP,this._2591);
         this.txt.addEventListener(_160._2571,this._2600);
         this.txt.addEventListener(FocusEvent.FOCUS_IN,this.focusIn);
         this.txt.addEventListener(FocusEvent.FOCUS_OUT,this.focusOut);
      }
      
      private function _2591(param1:_168) : void
      {
         this._2586 = Number(this.txt.text);
         var _loc2_:Number = this._2579;
         if(this._2573)
         {
            _loc2_ = this._2579 * int(100 / this._2580) / 100;
         }
         switch(param1.type)
         {
            case _168.UP:
               if(this.maxValue != this.minValue && Number(int(this._2586 * 100 + _loc2_ * 100) / 100) > this.maxValue)
               {
                  this.txt.text = Number(int(this.maxValue * 100) / 100).toString();
               }
               else
               {
                  this.txt.text = Number(int(this._2586 * 100 + _loc2_ * 100) / 100).toString();
               }
               break;
            case _168.DOWN:
               if(this.maxValue != this.minValue && Number(int(this._2586 * 100 - _loc2_ * 100) / 100) < this.minValue)
               {
                  this.txt.text = Number(int(this.minValue * 100) / 100).toString();
               }
               else
               {
                  this.txt.text = Number(int(this._2586 * 100 - _loc2_ * 100) / 100).toString();
               }
         }
         this.txt.dispatchEvent(new FocusEvent(FocusEvent.FOCUS_OUT));
      }
      
      private function focusIn(param1:FocusEvent) : void
      {
         if(!this.txt.hasEventListener(MouseEvent.MOUSE_WHEEL))
         {
            this.txt.addEventListener(MouseEvent.MOUSE_WHEEL,this._2593);
         }
      }
      
      private function focusOut(param1:FocusEvent) : void
      {
         if(this.txt.hasEventListener(MouseEvent.MOUSE_WHEEL))
         {
            this.txt.removeEventListener(MouseEvent.MOUSE_WHEEL,this._2593);
         }
      }
      
      public function _2593(param1:MouseEvent) : void
      {
         var _loc2_:Number = this._2579;
         if(this._2573)
         {
            _loc2_ = this._2579 * int(100 / this._2580) / 100;
         }
         this._2586 = Number(this.txt.text);
         if(param1.delta > 0)
         {
            if(this.maxValue != this.minValue && Number(int(this._2586 * 100 + param1.delta * 100 * _loc2_) / 100) > this.maxValue)
            {
               this.txt.text = Number(int(this.maxValue * 100) / 100).toString();
            }
            else
            {
               this.txt.text = Number(int(this._2586 * 100 + param1.delta * 100 * _loc2_) / 100).toString();
            }
         }
         else if(this.maxValue != this.minValue && Number(int(this._2586 * 100 - _loc2_ * 100) / 100) < this.minValue)
         {
            this.txt.text = Number(int(this.minValue * 100) / 100).toString();
         }
         else
         {
            this.txt.text = Number(int(this._2586 * 100 - _loc2_ * 100) / 100).toString();
         }
         this.txt.dispatchEvent(new _160(_160._2571));
      }
      
      public function _2600(param1:_160) : void
      {
         if(this._2595)
         {
            this._2597(param1);
         }
      }
      
      public function set _2599(param1:Function) : void
      {
         if(param1 != null)
         {
            this._2597 = param1;
            this._2595 = true;
         }
         else
         {
            this._2595 = false;
         }
      }
      
      public function set value(param1:Number) : void
      {
         if(param1 > this.maxValue)
         {
            param1 = this.maxValue;
         }
         else if(param1 < this.minValue)
         {
            param1 = this.minValue;
         }
         this._2586 = param1;
         this.txt.text = this._2586.toString();
      }
      
      public function get _2573() : Boolean
      {
         return this._2572;
      }
      
      public function set _2573(param1:Boolean) : void
      {
         if(this._2572 == param1)
         {
            return;
         }
         this._2572 = param1;
         this.txt._2573 = param1;
      }
      
      public function get minValue() : Number
      {
         return this._minValue;
      }
      
      public function set minValue(param1:Number) : void
      {
         this._minValue = param1;
         this.txt.minValue = param1;
      }
      
      public function get maxValue() : Number
      {
         return this._2598;
      }
      
      public function set maxValue(param1:Number) : void
      {
         this._2598 = param1;
         this.txt.maxValue = param1;
      }
      
      public function get _2579() : Number
      {
         return this._2596;
      }
      
      public function set _2579(param1:Number) : void
      {
         this._2596 = param1;
         this.txt._2579 = param1;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         if(param1)
         {
            this.txt.textColor = 16777215;
            this.txt.text = this.txt.text;
         }
         else
         {
            this.txt.textColor = this._2594;
            this.txt.text = this.txt.text;
         }
      }
      
      protected function get _2580() : Number
      {
         return (_1407.getInstance(_580) as _580)._2212._2580;
      }
   }
}

