package _127
{
   import _1045.Group;
   import _1045._1105;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _14044 extends Group
   {
      private var _14370:_1105;
      
      private var dots:Array;
      
      private var _14371:int;
      
      private var _14366:int;
      
      public function _14044()
      {
         super();
         this.dots = [];
         this._14370 = new _1105();
         this._14370.graphics.beginFill(15329769);
         this._14370.graphics.drawCircle(0,0,4);
         this._14370.graphics.endFill();
         this.addElement(this._14370);
      }
      
      public function _14368(param1:int) : void
      {
         if(param1 == this._14371)
         {
            return;
         }
         this._14371 = param1;
         this._2894();
      }
      
      public function _14367(param1:int) : void
      {
         if(this.dots.length == 0)
         {
            return;
         }
         this._14366 = param1;
         this._14370.x = (this.dots[param1] as _1105).x;
         this.addElement(this._14370);
      }
      
      public function get _14317() : int
      {
         return this._14366;
      }
      
      private function _2894() : void
      {
         var _loc2_:_1105 = null;
         this._14369();
         var _loc1_:int = 0;
         while(_loc1_ < this._14371)
         {
            _loc2_ = new _1105();
            _loc2_.graphics.beginFill(8488071);
            _loc2_.graphics.drawCircle(0,0,4);
            _loc2_.graphics.endFill();
            _loc2_.x = _loc1_ * 20;
            _loc2_.buttonMode = true;
            _loc2_.addEventListener(MouseEvent.CLICK,this._14353);
            this.dots.push(_loc2_);
            this.addElement(_loc2_);
            _loc1_++;
         }
         this._14367(0);
      }
      
      private function _14369() : void
      {
         var _loc2_:_1105 = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.dots.length)
         {
            _loc2_ = this.dots[_loc1_];
            _loc2_.removeEventListener(MouseEvent.CLICK,this._14353);
            this.removeElement(_loc2_);
            _loc2_ = null;
            _loc1_++;
         }
         this.dots.length = 0;
      }
      
      private function _14353(param1:MouseEvent) : void
      {
         var _loc2_:int = int(this.dots.indexOf(param1.target));
         if(_loc2_ == -1)
         {
            return;
         }
         this._14367(_loc2_);
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
}

