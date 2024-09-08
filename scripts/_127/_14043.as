package _127
{
   import _1045.Group;
   import _1045._1105;
   import flash.events.Event;
   
   public class _14043 extends Group
   {
      private var posX:Number = 0;
      
      private var posY:Number = 0;
      
      private var radius:Number = 50;
      
      private var _14363:Number = 10;
      
      private var alp:Number = 0;
      
      private var angle:Number = 0;
      
      private var color:uint = 16777215;
      
      private var count:int = 12;
      
      private var _14364:Boolean = false;
      
      private var mc:Group;
      
      public function _14043(param1:Number = 50, param2:Number = 10)
      {
         super();
         this.radius = param1;
         this._14363 = param2;
      }
      
      override protected function _2438() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:_1105 = null;
         super._2438();
         this.mc = new Group();
         var _loc1_:Number = 1 / 12;
         var _loc2_:Number = 0;
         while(_loc2_ < 12)
         {
            _loc3_ = this.angle * Math.PI / 180;
            _loc4_ = new _1105();
            _loc4_.graphics.beginFill(this.color);
            _loc4_.graphics.drawCircle(this.posX + this.radius * Math.cos(_loc3_),this.posY + this.radius * Math.sin(_loc3_),this._14363);
            _loc4_.alpha = this.alp;
            this.alp += _loc1_;
            this.angle += 30;
            this.color += 0;
            this.mc.addElement(_loc4_);
            _loc2_++;
         }
         this.addElement(this.mc);
      }
      
      public function start() : void
      {
         if(this._14364)
         {
            return;
         }
         this._14364 = true;
         this.mc.addEventListener(Event.ENTER_FRAME,this._14362);
      }
      
      public function stop() : void
      {
         if(!this._14364)
         {
            return;
         }
         this._14364 = false;
         this.mc.removeEventListener(Event.ENTER_FRAME,this._14362);
      }
      
      private function _14362(param1:Event) : void
      {
         this.mc.rotation += 30;
      }
   }
}

