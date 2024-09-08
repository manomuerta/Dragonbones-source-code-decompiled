package _822
{
   import _1045.Group;
   import _1045._1082;
   import _97._100;
   import _978.Timeline;
   import egret.core._1140;
   import flash.display.Graphics;
   import flash.geom.Rectangle;
   
   public class _842 extends Group
   {
      public static var _2141:Number;
      
      public static var _2139:Number;
      
      public static var _2140:Number;
      
      public static var _2142:Number;
      
      public static var num:int = 0;
      
      public static const LEFT_HANDLER:String = "leftHandler";
      
      public static const RIGHT_HANDLER:String = "rightHandler";
      
      public static var _4534:Number = 0;
      
      private const SCALE_HANDLE_WIDTH:int = 10;
      
      protected var _6241:Number = 0;
      
      protected var _6240:Number = 0;
      
      protected var _6238:Number = 0;
      
      protected var _6235:Number = 0;
      
      protected var _6237:Boolean = false;
      
      protected var _6236:Boolean = false;
      
      protected var _zoom:Number = 1;
      
      public var rect:Rectangle;
      
      public var _6264:_1082;
      
      public var _6260:_1082;
      
      public var _6261:_1140;
      
      private var _6267:Boolean;
      
      private var _6258:Boolean;
      
      private var _6265:Boolean;
      
      private var _6263:Boolean;
      
      private var _6256:Number;
      
      private var _6259:Number;
      
      private var _3932:int;
      
      private var _3933:int;
      
      public var _6254:Number;
      
      public var _6247:Number;
      
      private var _6257:int;
      
      private var _6255:int;
      
      private var _6252:int;
      
      private var _6251:int;
      
      private var _11169:Boolean;
      
      public var _6266:int;
      
      public function _842()
      {
         this.rect = new Rectangle();
         this._6264 = new _1082();
         this._6260 = new _1082();
         this._6261 = new _1140();
         super();
         x = 0;
         y = 0;
         width = 0;
         height = 0;
         mouseEnabled = false;
         mouseChildren = false;
         this._6264._2529 = 0;
         this._6260._2529 = 0;
         this._6264.width = this.SCALE_HANDLE_WIDTH;
         this._6260.width = this.SCALE_HANDLE_WIDTH;
         this._6264.name = LEFT_HANDLER;
         this._6260.name = RIGHT_HANDLER;
         addElement(this._6261);
         addElement(this._6264);
         addElement(this._6260);
         this._6266 = ++num;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         var _loc3_:Graphics = this._6261.graphics;
         _loc3_.clear();
         _loc3_.beginFill(_100.TIMELINE_SELECT_FRAME_FILL,0.1);
         this._6239();
         if(this.rect.height == 0 || this.rect.width == 0)
         {
            this._6264.visible = false;
            this._6260.visible = false;
            return;
         }
         if(!this._6258 && !this._6267 && !this._6265 && !this._6263)
         {
            _loc3_.lineStyle(1,_100.TIMELINE_SELECT_FRAME_FILL,0.6);
            _loc3_.drawRect(this.rect.x,this.rect.y,this.rect.width,this.rect.height);
            _loc3_.endFill();
         }
         else
         {
            _loc3_.lineStyle(1,_100.TIMELINE_SELECT_FRAME_FILL,0);
            _loc3_.drawRect(this.rect.x,this.rect.y,this.rect.width,this.rect.height);
            _loc3_.lineStyle(1,_100.TIMELINE_SELECT_FRAME_FILL,0.6);
            if(!this._6265)
            {
               _loc3_.moveTo(this.rect.left,this.rect.top);
               _loc3_.lineTo(this.rect.left,this.rect.bottom);
            }
            if(!this._6263)
            {
               _loc3_.moveTo(this.rect.right,this.rect.top);
               _loc3_.lineTo(this.rect.right,this.rect.bottom);
            }
            if(!this._6258)
            {
               _loc3_.moveTo(this.rect.left,this.rect.bottom);
               _loc3_.lineTo(this.rect.right,this.rect.bottom);
            }
            if(!this._6267)
            {
               _loc3_.moveTo(this.rect.left,this.rect.top);
               _loc3_.lineTo(this.rect.right,this.rect.top);
            }
            _loc3_.endFill();
         }
         this._6264.height = this.rect.height;
         this._6260.height = this.rect.height;
         this._6264.x = this.rect.left - this.SCALE_HANDLE_WIDTH / 2;
         this._6264.y = this.rect.top;
         this._6260.x = this.rect.right - this.SCALE_HANDLE_WIDTH / 2;
         this._6260.y = this.rect.top;
         this._6264.visible = !this._6265;
         this._6260.visible = !this._6263;
      }
      
      public function _6239() : void
      {
         var _loc3_:Number = NaN;
         var _loc1_:int = this._6252 > this._6251 ? this._6251 : this._6252;
         var _loc2_:int = this._6252 > this._6251 ? this._6252 : this._6251;
         this._6265 = false;
         this._6263 = false;
         if(_loc1_ < this._3933)
         {
            this._6265 = true;
            _loc1_ = this._3933;
         }
         if(_loc2_ < this._3933)
         {
            this.rect.width = 0;
            return;
         }
         this.rect.x = (_loc1_ - this._3933) * this._6254 + Timeline.FRAME_NAME_WIDTH + Timeline.LABEL_GAP;
         this.rect.width = (_loc2_ - _loc1_) * this._6254;
         if(this.rect.x + this.rect.width - Timeline.FRAME_NAME_WIDTH > _2142)
         {
            this.rect.width = _2142 - this.rect.x + Timeline.FRAME_NAME_WIDTH;
            if(this.rect.width < 0)
            {
               this.rect.width = 0;
               return;
            }
            this._6263 = true;
         }
         if(!this._11169)
         {
            this._6258 = false;
            this._6267 = false;
            _loc3_ = 0;
            this.rect.height = this._6235;
            this.rect.y = this._6240 - _4534;
            if(this.rect.y > _2139 || this.rect.y + this.rect.height < _2141)
            {
               this.rect.height = 0;
               return;
            }
            if(this.rect.y < _2141)
            {
               _loc3_ = _2141 - this.rect.y;
               this.rect.y = _2141;
               this._6267 = true;
            }
            if(this.rect.height - _loc3_ + this.rect.y > _2139)
            {
               this.rect.height = _2139 - this.rect.y;
               this._6258 = true;
            }
            else
            {
               this.rect.height -= _loc3_;
            }
         }
         else
         {
            this.rect.y = this._6240;
            this.rect.height = this._6235;
         }
         if(this.rect.height < 0)
         {
            this.rect.height = 0;
         }
      }
      
      public function get frameX() : Number
      {
         return this._6241;
      }
      
      public function set frameX(param1:Number) : void
      {
         if(this._6241 == param1)
         {
            return;
         }
         this._6241 = param1;
      }
      
      public function get frameY() : Number
      {
         return this._6240;
      }
      
      public function set frameY(param1:Number) : void
      {
         if(this._6240 == param1)
         {
            return;
         }
         this._6240 = param1;
      }
      
      public function set frameWidth(param1:Number) : void
      {
         if(this._6238 == param1)
         {
            return;
         }
         this._6238 = param1;
      }
      
      public function set frameHeight(param1:Number) : void
      {
         if(this._6235 == param1)
         {
            return;
         }
         this._6235 = param1;
      }
      
      public function set _5368(param1:Boolean) : void
      {
         if(this._6237 == param1)
         {
            return;
         }
         this._6237 = param1;
      }
      
      public function set _5369(param1:Boolean) : void
      {
         if(this._6236 == param1)
         {
            return;
         }
         this._6236 = param1;
      }
      
      public function set zoom(param1:Number) : void
      {
         if(this._zoom == param1)
         {
            return;
         }
         this._zoom = param1;
      }
      
      public function set _6262(param1:Number) : void
      {
         if(this._6259 != param1)
         {
            this._6259 = param1;
            this.draw();
         }
      }
      
      public function set _5123(param1:Number) : void
      {
         this._6256 = param1;
         this._6259 = param1;
      }
      
      public function set startIndex(param1:Number) : void
      {
         this._3932 = param1;
         this._3933 = param1;
      }
      
      public function set endIndex(param1:Number) : void
      {
         if(this._3933 != param1)
         {
            this._3933 = param1;
            this.draw();
         }
      }
      
      public function get _5701() : int
      {
         return this._6257;
      }
      
      public function set _5701(param1:int) : void
      {
         this._6257 = param1;
         this._6252 = this._6257;
      }
      
      public function get _5699() : int
      {
         return this._6255;
      }
      
      public function set _5699(param1:int) : void
      {
         this._6255 = param1;
         this._6251 = this._6255;
      }
      
      public function set _11170(param1:Boolean) : void
      {
         this._11169 = param1;
      }
      
      public function _6250(param1:int) : void
      {
         this._6257 += param1;
         this._6255 += param1;
         this._6252 += param1;
         this._6251 += param1;
         this.frameX += param1 * this._6247;
         this.draw();
      }
      
      public function _6249(param1:int) : void
      {
         this._6238 += param1 * this._6247;
         this._6251 += param1;
         this.draw();
      }
      
      public function _6253(param1:int) : void
      {
         this.frameX -= param1 * this._6247;
         this._6238 += param1 * this._6247;
         this._6252 += param1;
         this.draw();
      }
      
      public function _6248() : void
      {
         if(this._6257 != this._6252)
         {
            this._6257 = this._6252;
         }
         if(this._6255 != this._6251)
         {
            this._6255 = this._6251;
         }
      }
      
      public function draw() : void
      {
         this.visible = true;
         invalidateDisplayList();
      }
      
      public function hide() : void
      {
         this.visible = false;
         this.frameHeight = 0;
         this._6264.height = 0;
         this._6260.height = 0;
      }
   }
}

