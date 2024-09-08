package _978
{
   import _1045._1069;
   import _1045._1070;
   import _1045._1082;
   import _1045._1105;
   import _127._146;
   import _13545._13547;
   import _97._100;
   
   public class _986 extends _146 implements _1070, _1069
   {
      public const FRAME_WIDTH:int = 6;
      
      public const HALF_FRAME_WIDTH:int = 3;
      
      public const HOT_FRAME_WIDTH:int = 4;
      
      public const HALF_HOT_FRAME_WIDTH:int = 7;
      
      private var _6950:int = 23;
      
      public var keyFrame:_1082;
      
      private var _6961:_1105;
      
      private var _11188:_1082;
      
      private var _6953:int = 30;
      
      private var _6954:int = -1;
      
      private var _6895:int = 1;
      
      private var _6894:int = 1;
      
      private var _6741:Boolean = false;
      
      private var _6203:String = "up";
      
      private var _6208:Boolean = false;
      
      private var _y:int;
      
      private var _14004:_13547;
      
      public function _986()
      {
         super();
         this._6950 = Timeline.KEY_FRAME_HEIGHT;
         this._y = (Timeline.FRAME_HEIGHT - Timeline.KEY_FRAME_HEIGHT) * 0.5;
      }
      
      public function set _4901(param1:Boolean) : void
      {
         this._6741 = param1;
         this._6743();
      }
      
      override public function set selected(param1:Boolean) : void
      {
         _selected = param1;
         this._6743();
      }
      
      private function _6743() : void
      {
         if(selected)
         {
            this._2080 = "down";
         }
         else if(this._6741)
         {
            this._2080 = "over";
         }
         else
         {
            this._2080 = "up";
         }
      }
      
      public function get _2080() : String
      {
         return this._6203;
      }
      
      public function set _2080(param1:String) : void
      {
         if(this._6203 == param1)
         {
            return;
         }
         this._6203 = param1;
         this._6208 = true;
         _2466();
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._6208)
         {
            this._6208 = false;
            this.draw();
         }
      }
      
      private function draw() : void
      {
         var _loc1_:uint = this._6959();
         if(this._6203 == "up")
         {
            this.keyFrame._2563 = _loc1_;
            this.keyFrame._2564 = 1;
            if(Boolean(this._14004) && Boolean(this._14004.frames))
            {
               if(this._14004._1707)
               {
                  this._6960(this._6957(),_loc1_,this._6203);
               }
               else if(this._14004._3409)
               {
                  this._6958(this._6957(),_loc1_,this._6203);
               }
            }
         }
         else
         {
            this.keyFrame._2563 = _loc1_;
            this.keyFrame._2564 = 1;
            if(Boolean(this._14004) && Boolean(this._14004.frames))
            {
               if(this._14004._1707)
               {
                  this._6960(this._6957(),_loc1_,this._6203);
               }
               else if(this._14004._3409)
               {
                  this._6958(this._6957(),_loc1_,this._6203);
               }
            }
            if(this._6203 == "down")
            {
               this.parent.addChild(this);
            }
         }
      }
      
      private function _6959() : uint
      {
         if(this._6203 == "up")
         {
            return _100.STROKE_UP_COLOR;
         }
         if(this._6203 == "over")
         {
            return _100.STROKE_OVER_COLOR;
         }
         return _100.STROKE_DOWN_COLOR;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._11188 = new _1082();
         this._11188.fillColor = _100.BONE_COLOR;
         this._11188._2529 = 0;
         this._11188._2563 = _100.STROKE_UP_COLOR;
         this._11188._2564 = 0;
         this._11188._2562 = 1;
         this._11188.width = this.HOT_FRAME_WIDTH * 2 + this.FRAME_WIDTH;
         this._11188.height = this._6950;
         this._11188.y = this._y;
         this._11188.x = -this.HOT_FRAME_WIDTH - 1;
         addElement(this._11188);
         this.keyFrame = new _1082();
         this.keyFrame.fillColor = _100.BONE_COLOR;
         this.keyFrame._2563 = _100.STROKE_UP_COLOR;
         this.keyFrame._2564 = 1;
         this.keyFrame._2562 = 1;
         this.keyFrame.y = this._y;
         this.keyFrame.width = this.FRAME_WIDTH;
         this.keyFrame.height = this._6950;
         addElement(this.keyFrame);
         this._6961 = new _1105();
         this._6961.y = this._y + 2;
         addElement(this._6961);
      }
      
      override public function set data(param1:Object) : void
      {
         this._2080 = "up";
         this.selected = false;
         _data = param1;
         this._14004 = _data as _13547;
         if(this._14004)
         {
            this._6953 = Timeline._6923;
            this._6895 = Timeline._6909;
            this._6894 = Timeline._6908;
            this._6954 = Timeline.index;
            this.selected = this._14004.selected;
            if(this._6894 >= 4 || this._6894 == 2 && this._6953 <= 16)
            {
               if(this._11188.parent)
               {
                  removeElement(this._11188);
               }
            }
            else if(!this._11188.parent)
            {
               addElement(this._11188);
            }
            if(this._6954 <= this._14004.frameIndex)
            {
               this.keyFrame.visible = true;
               this._6961.visible = false;
               this.x = (this._14004.frameIndex - this._6954) / this._6894 * this._6953 - this.HALF_FRAME_WIDTH + Timeline.LABEL_GAP;
               this.keyFrame.height = this._6950;
               if(this._14004._1707)
               {
                  this._6960(this._6957(),this._6959(),this._6203);
                  this._6961.visible = true;
                  this.keyFrame.visible = false;
               }
               else if(this._14004._3409)
               {
                  this._6958(_100.BONE_COLOR,this._6959(),this._6203);
                  this._6961.visible = true;
                  this.keyFrame.visible = false;
               }
               else
               {
                  this.keyFrame.fillColor = this._14004.color;
               }
            }
            else
            {
               this.keyFrame.visible = false;
               this._6961.visible = false;
            }
         }
      }
      
      public function _6934() : void
      {
         this.data = _data;
      }
      
      private function _6957() : uint
      {
         return this._14004.color;
      }
      
      private function _6960(param1:uint, param2:uint, param3:String) : void
      {
         this._6961.graphics.clear();
         if(param3 == "up")
         {
            this._6961.graphics.lineStyle(1,param2,1);
         }
         else
         {
            this._6961.graphics.lineStyle(1,param2);
         }
         var _loc4_:int = int(this.FRAME_WIDTH * 0.9);
         this._6961.graphics.beginFill(param1);
         this._6961.graphics.moveTo(this.HALF_FRAME_WIDTH,0);
         this._6961.graphics.lineTo(this.HALF_FRAME_WIDTH + _loc4_ * 1.4,_loc4_ + 2);
         this._6961.graphics.lineTo(this.HALF_FRAME_WIDTH,_loc4_ * 2 + 4);
         this._6961.graphics.lineTo(this.HALF_FRAME_WIDTH - _loc4_ * 1.4,_loc4_ + 2);
         this._6961.graphics.lineTo(this.HALF_FRAME_WIDTH,0);
         this._6961.graphics.endFill();
      }
      
      private function _6958(param1:uint, param2:uint, param3:String) : void
      {
         this._6961.graphics.clear();
         if(param3 == "up")
         {
            this._6961.graphics.lineStyle(1,param2,1);
         }
         else
         {
            this._6961.graphics.lineStyle(1,param2);
         }
         var _loc4_:int = int(this.FRAME_WIDTH * 0.9);
         this._6961.graphics.beginFill(param1);
         this._6961.graphics.drawRect(0,-2,this.FRAME_WIDTH - 1,this._6950 - 1);
         this._6961.graphics.lineStyle(0,param2);
         this._6961.graphics.drawCircle(3,8,2);
         this._6961.graphics.endFill();
      }
   }
}

