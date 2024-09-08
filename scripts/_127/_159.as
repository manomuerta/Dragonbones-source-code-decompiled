package _127
{
   import _1045.ComboBox;
   import _1374.TextInput;
   import _1404._1407;
   import _579._580;
   import egret.core._1140;
   import egret.utils._99;
   import flash.display.DisplayObject;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   
   public class _159 extends TextInput
   {
      private var _2572:Boolean = false;
      
      public var _2579:Number = 1;
      
      public var maxValue:Number = 0;
      
      public var minValue:Number = 0;
      
      public function _159()
      {
         super();
      }
      
      override protected function _2574(param1:FocusEvent) : void
      {
         if(param1.target == this)
         {
            _2581();
         }
         addEventListener(KeyboardEvent.KEY_DOWN,this._2575);
         if(_2578)
         {
            _2578.visible = false;
         }
         if(_2582)
         {
            _2582.visible = true;
         }
         _99(_2577.selectAll);
         _2570();
      }
      
      private function _2575(param1:KeyboardEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:DisplayObject = null;
         if(stage)
         {
            _loc2_ = this._2579;
            if(this._2573)
            {
               _loc2_ = this._2579 * int(100 / this._2580) / 100;
            }
            switch(param1.keyCode)
            {
               case Keyboard.ENTER:
                  _loc3_ = this;
                  while(_loc3_)
                  {
                     _loc3_ = _loc3_.parent;
                     if(_loc3_ && _loc3_ is _1140 && _1140(_loc3_)._2576 == true && !(_loc3_ is ComboBox))
                     {
                        _1140(_loc3_)._2581();
                        break;
                     }
                  }
                  break;
               case Keyboard.UP:
                  if(this.maxValue != this.minValue && Number(Number(this.text) + _loc2_) > this.maxValue)
                  {
                     this.text = Number(int(this.maxValue * 100) / 100).toString();
                  }
                  else
                  {
                     this.text = Number(Number(this.text) + _loc2_).toFixed(2);
                  }
                  this.dispatchEvent(new _160(_160._2571));
                  break;
               case Keyboard.DOWN:
                  if(this.maxValue != this.minValue && Number(Number(this.text) - _loc2_) < this.minValue)
                  {
                     this.text = Number(int(this.minValue * 100) / 100).toString();
                  }
                  else
                  {
                     this.text = Number(Number(this.text) - _loc2_).toFixed(2);
                  }
                  this.dispatchEvent(new _160(_160._2571));
            }
         }
      }
      
      public function get _2573() : Boolean
      {
         return this._2572;
      }
      
      public function set _2573(param1:Boolean) : void
      {
         this._2572 = param1;
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         removeEventListener(KeyboardEvent.KEY_DOWN,this._2575);
         if(_2578)
         {
            _2578.visible = true;
         }
         if(_2582)
         {
            _2582.visible = false;
         }
         _2570();
      }
      
      protected function get _2580() : Number
      {
         return (_1407.getInstance(_580) as _580)._2212._2580;
      }
   }
}

