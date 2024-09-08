package _978
{
   import _1045.Group;
   import _1045._1082;
   import _1045._1105;
   import _97._100;
   
   public class _991 extends Group
   {
      public var _6902:_1105;
      
      public var _6904:_1105;
      
      public var bg:_1082;
      
      private var _5247:int;
      
      private var _5248:int;
      
      private var _6980:Number;
      
      private var _6978:Number;
      
      private var _6976:Number;
      
      private var _6979:Number;
      
      private var _6977:Number;
      
      public function _991()
      {
         this._6902 = new _1105();
         this._6904 = new _1105();
         super();
      }
      
      override protected function _2438() : void
      {
         this._6902.buttonMode = true;
         this._6902.graphics.lineStyle(1,_100.ONION_LABEL_COLOR);
         this._6902.graphics.beginFill(_100.ONION_LABEL_COLOR);
         this._6902.graphics.moveTo(-1,0);
         this._6902.graphics.lineTo(-5,0);
         this._6902.graphics.lineTo(-5,24);
         this._6902.graphics.lineTo(-1,24);
         this._6902.graphics.lineTo(-5,12);
         this._6902.graphics.lineTo(-1,0);
         this._6902.graphics.beginFill(_100.ONION_BEFORE_COLOR);
         this._6902.graphics.drawCircle(-5,12,3);
         this._6902.graphics.endFill();
         this._6904.buttonMode = true;
         this._6904.graphics.lineStyle(1,_100.ONION_LABEL_COLOR);
         this._6904.graphics.beginFill(_100.ONION_LABEL_COLOR);
         this._6904.graphics.moveTo(1,0);
         this._6904.graphics.lineTo(5,0);
         this._6904.graphics.lineTo(5,24);
         this._6904.graphics.lineTo(1,24);
         this._6904.graphics.lineTo(5,12);
         this._6904.graphics.lineTo(1,0);
         this._6904.graphics.beginFill(_100.ONION_AFTER_COLOR);
         this._6904.graphics.drawCircle(5,12,3);
         this._6904.graphics.endFill();
         this.bg = new _1082();
         this.bg.mouseChildren = this.bg.mouseEnabled = false;
         this.bg.fillColor = _100.ONION_BG_COLOR;
         this.bg._2529 = 0.2;
         this.bg.height = 25;
         this.bg.y = 12;
         this._6902.y = 12;
         this._6904.y = 12;
         addElement(this.bg);
         addElement(this._6902);
         addElement(this._6904);
         this.mouseEnabled = false;
      }
      
      public function set _4744(param1:int) : void
      {
         this._5247 = param1;
      }
      
      public function set _4751(param1:int) : void
      {
         this._5248 = param1;
      }
      
      public function _4704() : void
      {
         var _loc1_:Number = Timeline._6923 / Timeline._6908;
         var _loc2_:int = Timeline._6806;
         var _loc3_:int = Timeline.curFrame;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         if(_loc3_ >= this._5247)
         {
            this._6902.x = -_loc1_ * this._5247;
         }
         else
         {
            this._6902.x = -_loc1_ * _loc3_;
         }
         this._6902.visible = this.x + this._6902.x > Timeline.FRAME_NAME_WIDTH;
         if(!this._6902.visible)
         {
            _loc4_ = Timeline.FRAME_NAME_WIDTH - (this.x + this._6902.x);
         }
         this._6904.x = _loc1_ * this._5248;
         this._6904.visible = this.x + this._6904.x > Timeline.FRAME_NAME_WIDTH;
         if(this.bg)
         {
            _loc5_ = this._6904.x - this._6902.x - _loc4_ + 10;
            if(_loc5_ < 0)
            {
               _loc5_ = 0;
            }
            this.bg.width = _loc5_;
            this.bg.x = this._6902.x + _loc4_ - 5;
         }
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = param1;
         this._4704();
      }
      
      public function get _4744() : int
      {
         return this._5247;
      }
      
      public function get _4751() : int
      {
         return this._5248;
      }
   }
}

