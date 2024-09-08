package _721
{
   import _204._212;
   import _51._71;
   import _609._619;
   
   public class _765
   {
      private var _3254:_71;
      
      private var _1857:Number = 1;
      
      public var hasBackground:Boolean = false;
      
      public var backgroundColor:uint = 16777215;
      
      public var projectName:String = "";
      
      public var _5420:Boolean = true;
      
      private var _2360:int = 2;
      
      private var _2359:int = 2;
      
      private var _2348:int;
      
      private var _2343:int;
      
      private var _5951:Boolean = true;
      
      public var _5416:Boolean = false;
      
      public var images:Array;
      
      public var exportType:int;
      
      public var _5412:Boolean;
      
      public var _5411:Boolean;
      
      private var _11162:int = 2;
      
      public var smooth:Boolean;
      
      private var _5948:Boolean = true;
      
      private var _5956:Boolean = true;
      
      private var _5955:int;
      
      private var _5954:int;
      
      public function _765()
      {
         super();
      }
      
      public function get dragonBonesVO() : _71
      {
         return this._3254;
      }
      
      public function set dragonBonesVO(param1:_71) : void
      {
         this._3254 = param1;
      }
      
      public function get scale() : Number
      {
         return this._1857;
      }
      
      public function set scale(param1:Number) : void
      {
         if(this._1857 != param1)
         {
            this._1857 = param1;
            this._5950();
            this._5411 = true;
            this._5412 = true;
         }
      }
      
      public function get _2832() : Boolean
      {
         return this._5951;
      }
      
      public function set _2832(param1:Boolean) : void
      {
         if(this._5951 != param1)
         {
            this._5951 = param1;
            this._5950();
            this._5412 = true;
         }
      }
      
      public function get gapX() : int
      {
         return this._2360;
      }
      
      public function set gapX(param1:int) : void
      {
         if(this._2360 != param1)
         {
            this._2360 = param1;
            this._5412 = true;
            if(!this._5956)
            {
               this._5949();
               if(this._2348 < this._5955)
               {
                  this.maxWidth = this._5955;
               }
            }
         }
      }
      
      public function get gapY() : int
      {
         return this._2359;
      }
      
      public function set gapY(param1:int) : void
      {
         if(this._2359 != param1)
         {
            this._2359 = param1;
            this._5412 = true;
            if(!this._5956)
            {
               this._5949();
               if(this._2343 < this._5954)
               {
                  this.maxHeight = this._5954;
               }
            }
         }
      }
      
      public function get maxWidth() : int
      {
         return this._2348;
      }
      
      public function set maxWidth(param1:int) : void
      {
         if(this._5951)
         {
            param1 = int(_212._1853(param1));
         }
         if(this._5955 > 0 && param1 < this._5955)
         {
            param1 = this._5955;
         }
         if(param1 > _619.MAX_BITMAP_WIDTH)
         {
            param1 = _619.MAX_BITMAP_WIDTH;
         }
         if(this._2348 != param1)
         {
            this._2348 = param1;
            this._5412 = true;
         }
      }
      
      public function get maxHeight() : int
      {
         return this._2343;
      }
      
      public function set maxHeight(param1:int) : void
      {
         if(this._5951)
         {
            param1 = int(_212._1853(param1));
         }
         if(this._5954 > 0 && param1 < this._5954)
         {
            param1 = this._5954;
         }
         if(param1 > _619.MAX_BITMAP_HEIGHT)
         {
            param1 = _619.MAX_BITMAP_HEIGHT;
         }
         if(this._2343 != param1)
         {
            this._2343 = param1;
            this._5412 = true;
         }
      }
      
      public function get autoSize() : Boolean
      {
         return this._5956;
      }
      
      public function set autoSize(param1:Boolean) : void
      {
         if(this._5956 != param1)
         {
            this._5956 = param1;
            if(this._5956)
            {
               this._5954 = 0;
               this._5955 = 0;
               this.maxHeight = 0;
               this.maxWidth = 0;
            }
            else
            {
               this._5949();
            }
         }
      }
      
      public function get _3620() : Boolean
      {
         return this._5948;
      }
      
      public function set _3620(param1:Boolean) : void
      {
         if(this._5948 != param1)
         {
            this._5948 = param1;
            if(!this._5948)
            {
               this._5420 = false;
            }
            else
            {
               this._5420 = true;
            }
         }
      }
      
      public function get heuristic() : int
      {
         return this._11162;
      }
      
      public function set heuristic(param1:int) : void
      {
         if(this._11162 != param1)
         {
            this._11162 = param1;
            this._5412 = true;
         }
      }
      
      private function _5949() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this._5954 = 0;
         this._5955 = 0;
         if(this.images)
         {
            _loc1_ = 0;
            _loc2_ = int(this.images.length);
            while(_loc1_ < _loc2_)
            {
               if(this.images[_loc1_].assetData.width > this._5955)
               {
                  this._5955 = this.images[_loc1_].assetData.width;
               }
               if(this.images[_loc1_].assetData.height > this._5954)
               {
                  this._5954 = this.images[_loc1_].assetData.height;
               }
               _loc1_++;
            }
            this._5955 *= this._1857;
            this._5954 *= this._1857;
            this._5955 += this._2360 * 2;
            this._5954 += this._2359 * 2;
            if(this._2832)
            {
               this._5955 = _212._1853(this._5955);
               this._5954 = _212._1853(this._5954);
            }
         }
      }
      
      private function _5950() : void
      {
         if(!this._5956)
         {
            this._5949();
            if(this._2348 < this._5955)
            {
               this.maxWidth = this._5955;
            }
            if(this._2343 < this._5954)
            {
               this.maxHeight = this._5954;
            }
         }
      }
      
      public function _5952() : void
      {
         this._5412 = false;
         this._5411 = false;
         this.images = null;
         this._2343 = 0;
         this._2348 = 0;
      }
      
      public function _5953() : void
      {
         this.hasBackground = false;
         this.backgroundColor = 16777215;
         this._5420 = true;
         this.gapX = 2;
         this.gapY = 2;
         this._2343 = 0;
         this._2348 = 0;
         this._5956 = true;
         this.scale = 1;
         this._2832 = true;
         this._5416 = false;
         this._11162 = 2;
      }
      
      public function copyFrom(param1:_765) : void
      {
         this.hasBackground = param1.hasBackground;
         this.backgroundColor = param1.backgroundColor;
         this._5420 = param1._5420;
         this._2360 = param1.gapX;
         this._2359 = param1.gapY;
         this._2348 = param1.maxWidth;
         this._2343 = param1.maxHeight;
         this._5956 = param1.autoSize;
         this.scale = param1.scale;
         this._2832 = param1._2832;
         this._5416 = param1._5416;
         this._11162 = param1.heuristic;
      }
   }
}

