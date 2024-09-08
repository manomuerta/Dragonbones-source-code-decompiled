package _844
{
   import _1045.Group;
   import _97._100;
   import flash.events.MouseEvent;
   
   public class _851 extends Group
   {
      public var length:Number = 20;
      
      public var _6296:Number = 5;
      
      private var _6307:Number = 5;
      
      private var _6295:_846;
      
      private var _6294:_846;
      
      private var _6293:_846;
      
      private var _10814:Group;
      
      private var _6216:Number = 1;
      
      private var _6217:Number = 1;
      
      private var _4367:Boolean = false;
      
      private var _4366:Boolean = false;
      
      private var _6278:Boolean = true;
      
      private var _10815:Boolean;
      
      public function _851()
      {
         this._6295 = new _846();
         this._6294 = new _846();
         this._6293 = new _846();
         super();
         width = 0;
         height = 0;
      }
      
      public function _4365(param1:Boolean, param2:Boolean) : void
      {
         this._6278 = false;
         this._4367 = param1;
         this._4366 = param2;
         this.update();
      }
      
      public function _4337() : void
      {
         this._6278 = true;
         this.update();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6292(this._6295,this._6291,this._6296,0,0,_100._2264,false);
         this._6292(this._6294,this._6290,0,this._6296,90,_100._2265,false);
         this._6292(this._6293,this._6289,-0.72 * this._6296,-0.72 * this._6296,-135,_100._2260);
         this._10814 = new Group();
         this._10814.graphics.lineStyle(1,6710886,0.5,true,"none");
         this._10814.graphics.drawCircle(0,0,this._6307);
         this._10814.mouseChildren = this._10814.mouseEnabled = false;
         addElement(this._10814);
         this._10814.visible = false;
      }
      
      private function _6292(param1:_846, param2:Number, param3:Number, param4:Number, param5:Number, param6:uint, param7:Boolean = true) : void
      {
         param1.width = param2;
         param1.x = param3;
         param1.y = param4;
         param1.rotation = param5;
         param1.color = param6;
         param1.visible = param7;
         param1.addEventListener(MouseEvent.ROLL_OVER,this._6286);
         param1.addEventListener(MouseEvent.ROLL_OUT,this._6287);
         addElement(param1);
      }
      
      private function _6286(param1:MouseEvent) : void
      {
         (param1.currentTarget as _846)._6272 = true;
         this.update();
      }
      
      private function _6287(param1:MouseEvent) : void
      {
         (param1.currentTarget as _846)._6272 = false;
         this.update();
      }
      
      private function update() : void
      {
         if(this._6278)
         {
            this._6295._6207 = this._6295._6272;
            this._6294._6207 = this._6294._6272;
            this._6293._6207 = this._6293._6272;
            this._4367 = this._6295._6272 || this._6293._6272;
            this._4366 = this._6294._6272 || this._6293._6272;
         }
         else
         {
            this._6295._6207 = this._4367 != this._4366 ? this._4367 : false;
            this._6294._6207 = this._4367 != this._4366 ? this._4366 : false;
            this._6293._6207 = this._4367 && this._4366;
         }
      }
      
      private function _6288() : void
      {
         this._6295.width = this._6291;
         this._6294.width = this._6290;
         this._6293.width = this._6289;
      }
      
      public function set _6220(param1:Number) : void
      {
         if(this._6216 == param1)
         {
            return;
         }
         this._6216 = param1;
         this._6288();
      }
      
      public function set _6219(param1:Number) : void
      {
         if(this._6217 == param1)
         {
            return;
         }
         this._6217 = param1;
         this._6288();
      }
      
      public function get _4368() : Boolean
      {
         return this._4367;
      }
      
      public function get _4369() : Boolean
      {
         return this._4366;
      }
      
      public function get _5122() : Boolean
      {
         return this._6278;
      }
      
      private function get _6291() : Number
      {
         var _loc1_:Number = (this.length + this._6296) * this._6216 - this._6296;
         return _loc1_ > 0 ? _loc1_ : -_loc1_;
      }
      
      private function get _6290() : Number
      {
         var _loc1_:Number = (this.length + this._6296) * this._6217 - this._6296;
         return _loc1_ > 0 ? _loc1_ : -_loc1_;
      }
      
      private function get _6289() : Number
      {
         var _loc1_:Number = (this.length + this._6296) * (this._6216 + this._6217) / 2 - this._6296;
         return _loc1_ > 0 ? _loc1_ : 0;
      }
      
      public function get separate() : Boolean
      {
         return this._10815;
      }
      
      public function set separate(param1:Boolean) : void
      {
         this._10815 = param1;
         this._6295.visible = this._10815;
         this._6294.visible = this._10815;
         this._10814.visible = this._10815;
         this._6293.visible = !this._10815;
      }
   }
}

