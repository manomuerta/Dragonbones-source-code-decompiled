package _1045
{
   import _1177.UIEvent;
   import egret.core._1140;
   import egret.utils._1290;
   import flash.display.Graphics;
   import flash.events.Event;
   
   public class _1082 extends _1140
   {
      private var _8265:uint = 16777215;
      
      private var _8264:Number = 1;
      
      private var _8262:uint = 4473924;
      
      private var _8263:Number = 0;
      
      private var _8261:Number = 1;
      
      private var _6285:Number = 0;
      
      private var _8260:Number = 0;
      
      private var _8259:Number = 0;
      
      private var _8258:Number = 0;
      
      private var _8257:Number = 0;
      
      public function _1082()
      {
         super();
         mouseChildren = false;
         this.addEventListener(Event.REMOVED_FROM_STAGE,this._8064);
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         stage.removeEventListener(UIEvent.SCREEN_DPI_CHANGED,this._8056);
      }
      
      private function _8064(param1:Event) : void
      {
         stage.removeEventListener(UIEvent.SCREEN_DPI_CHANGED,this._8056);
      }
      
      private function _8056(param1:Event) : void
      {
         invalidateDisplayList();
      }
      
      public function get fillColor() : uint
      {
         return this._8265;
      }
      
      public function set fillColor(param1:uint) : void
      {
         if(this._8265 == param1)
         {
            return;
         }
         this._8265 = param1;
         invalidateDisplayList();
      }
      
      public function get _2529() : Number
      {
         return this._8264;
      }
      
      public function set _2529(param1:Number) : void
      {
         if(this._8264 == param1)
         {
            return;
         }
         this._8264 = param1;
         invalidateDisplayList();
      }
      
      public function get _2563() : uint
      {
         return this._8262;
      }
      
      public function set _2563(param1:uint) : void
      {
         if(this._8262 == param1)
         {
            return;
         }
         this._8262 = param1;
         invalidateDisplayList();
      }
      
      public function get _2564() : Number
      {
         return this._8263;
      }
      
      public function set _2564(param1:Number) : void
      {
         if(this._8263 == param1)
         {
            return;
         }
         this._8263 = param1;
         invalidateDisplayList();
      }
      
      public function get _2562() : Number
      {
         return this._8261;
      }
      
      public function set _2562(param1:Number) : void
      {
         if(this._8261 == param1)
         {
            return;
         }
         this._8261 = param1;
         invalidateDisplayList();
      }
      
      public function get radius() : Number
      {
         return this._6285;
      }
      
      public function set radius(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this._6285 == param1)
         {
            return;
         }
         this._6285 = param1;
         invalidateDisplayList();
      }
      
      public function get topLeftRadius() : Number
      {
         return this._8260;
      }
      
      public function set topLeftRadius(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this._8260 == param1)
         {
            return;
         }
         this._8260 = param1;
         invalidateDisplayList();
      }
      
      public function get topRightRadius() : Number
      {
         return this._8259;
      }
      
      public function set topRightRadius(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this._8259 == param1)
         {
            return;
         }
         this._8259 = param1;
         invalidateDisplayList();
      }
      
      public function get bottomLeftRadius() : Number
      {
         return this._8258;
      }
      
      public function set bottomLeftRadius(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this._8258 == param1)
         {
            return;
         }
         this._8258 = param1;
         invalidateDisplayList();
      }
      
      public function get bottomRightRadius() : Number
      {
         return this._8257;
      }
      
      public function set bottomRightRadius(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this._8257 == param1)
         {
            return;
         }
         this._8257 = param1;
         invalidateDisplayList();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         var _loc7_:Number = NaN;
         super._5823(param1,param1);
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         _loc3_.beginFill(this._8265,this._8264);
         var _loc4_:Number = 0;
         var _loc5_:Number = param1;
         var _loc6_:Number = param2;
         if(this._8263 > 0)
         {
            _loc3_.lineStyle(this._8261,this._8262,this._8263,true,"normal","square","miter");
            if(Boolean(stage) && stage.contentsScaleFactor != 1)
            {
               _loc4_ = this._8261 / 2;
            }
            else
            {
               _loc4_ = int(this._8261 / 2);
            }
            _loc5_ = param1 - this._8261;
            _loc6_ = param2 - this._8261;
         }
         if(this._6285 > 0)
         {
            _loc7_ = this._6285 * 2 - this._8261;
            _loc3_.drawRoundRect(_loc4_,_loc4_,_loc5_,_loc6_,_loc7_,_loc7_);
         }
         else if(this._8260 > 0 || this._8259 > 0 || this._8258 > 0 || this._8257 > 0)
         {
            _1290.drawRoundRectComplex(_loc3_,_loc4_,_loc4_,_loc5_,_loc6_,this._8260 - _loc4_,this._8259 - _loc4_,this._8258 - _loc4_,this._8257 - _loc4_);
         }
         else
         {
            _loc3_.drawRect(_loc4_,_loc4_,_loc5_,_loc6_);
         }
         _loc3_.endFill();
      }
   }
}

