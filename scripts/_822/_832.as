package _822
{
   import _97._100;
   import egret.core._1140;
   import flash.display.Graphics;
   import flash.geom.Rectangle;
   
   public class _832 extends _1140
   {
      private var _6241:Number = 0;
      
      private var _6240:Number = 0;
      
      private var _6238:Number = 0;
      
      private var _6235:Number = 0;
      
      private var _6237:Boolean = false;
      
      private var _6236:Boolean = false;
      
      private var _zoom:Number = 1;
      
      public var rect:Rectangle;
      
      public function _832()
      {
         this.rect = new Rectangle();
         super();
         x = 0;
         y = 0;
         width = 0;
         height = 0;
         mouseEnabled = false;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         var _loc3_:Graphics = this.graphics;
         _loc3_.clear();
         _loc3_.beginFill(_100._2255,0.1);
         _loc3_.lineStyle(0,_100._2253,0.6);
         this._6239();
         _loc3_.drawRect(this.rect.x * this._zoom,this.rect.y * this._zoom,this._6238 * this._zoom,this._6235 * this._zoom);
         _loc3_.endFill();
      }
      
      public function _5371() : void
      {
         this.rect.width = 0;
         this.rect.height = 0;
      }
      
      public function _6239() : void
      {
         this.rect.x = this._6237 ? this._6241 - this._6238 : this._6241;
         this.rect.y = this._6236 ? this._6240 - this._6235 : this._6240;
         this.rect.width = this._6238;
         this.rect.height = this._6235;
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
         invalidateDisplayList();
      }
      
      public function set frameHeight(param1:Number) : void
      {
         if(this._6235 == param1)
         {
            return;
         }
         this._6235 = param1;
         invalidateDisplayList();
      }
      
      public function set _5368(param1:Boolean) : void
      {
         if(this._6237 == param1)
         {
            return;
         }
         this._6237 = param1;
         invalidateDisplayList();
      }
      
      public function set _5369(param1:Boolean) : void
      {
         if(this._6236 == param1)
         {
            return;
         }
         this._6236 = param1;
         invalidateDisplayList();
      }
      
      public function set zoom(param1:Number) : void
      {
         if(this._zoom == param1)
         {
            return;
         }
         this._zoom = param1;
         invalidateDisplayList();
      }
   }
}

