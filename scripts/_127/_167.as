package _127
{
   import _1045.Group;
   import _1185._1197;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class _167 extends Group
   {
      private var up:_169;
      
      private var down:_169;
      
      private var timer:Timer;
      
      private var _2620:int;
      
      private var _2622:Boolean = false;
      
      private var _2623:Boolean = true;
      
      public function _167()
      {
         super();
         this.width = 11;
         this.height = 20;
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 1;
         this.layout = _loc1_;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.up = new _169();
         this.up._2550 = "assets/button/Arrowup_normal.png";
         this.up._2553 = "assets/button/Arrowup_down.png";
         this.up._2552 = "assets/button/Arrowup_over.png";
         this.up.height = 9;
         this.addElement(this.up);
         this.up.addEventListener(MouseEvent.MOUSE_DOWN,this.itemClick);
         this.up.addEventListener(MouseEvent.ROLL_OUT,this._2621);
         this.up.addEventListener(MouseEvent.MOUSE_UP,this._2621);
         this.down = new _169();
         this.down._2550 = "assets/button/Arrowdown_normal.png";
         this.down._2553 = "assets/button/Arrowdown_down.png";
         this.down._2552 = "assets/button/Arrowdown_over.png";
         this.down.height = 9;
         this.addElement(this.down);
         this.down.addEventListener(MouseEvent.MOUSE_DOWN,this.itemClick);
         this.down.addEventListener(MouseEvent.ROLL_OUT,this._2621);
         this.down.addEventListener(MouseEvent.MOUSE_UP,this._2621);
      }
      
      private function itemClick(param1:MouseEvent) : void
      {
         this._2620 = 0;
         this._2622 = false;
         this.timer = new Timer(100);
         this.timer.addEventListener(TimerEvent.TIMER,this._2619);
         this.timer.start();
         switch(param1.currentTarget)
         {
            case this.up:
               this._2623 = true;
               this.dispatchEvent(new _168(_168.UP));
               break;
            case this.down:
               this._2623 = false;
               this.dispatchEvent(new _168(_168.DOWN));
         }
      }
      
      private function _2621(param1:MouseEvent) : void
      {
         if(this.timer)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this._2619);
            this.timer = null;
         }
      }
      
      private function _2619(param1:TimerEvent) : void
      {
         ++this._2620;
         if(this._2620 == 3)
         {
            this._2622 = true;
         }
         if(this._2622)
         {
            if(this._2623)
            {
               this.dispatchEvent(new _168(_168.UP));
            }
            else
            {
               this.dispatchEvent(new _168(_168.DOWN));
            }
         }
      }
   }
}

