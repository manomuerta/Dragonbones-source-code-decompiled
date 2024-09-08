package _14201
{
   import _14173._14172;
   import _14193._14192;
   import _14193._14194;
   import _14193._14196;
   import _14193._14197;
   import _14231._14232;
   import _14240._14246;
   import _14240._14247;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _14210 extends _14196 implements _14194, _14192
   {
      private var _15379:Boolean = true;
      
      private var _15382:_14172;
      
      public function _14210()
      {
         super("marker");
      }
      
      public function get _15385() : String
      {
         return _1699("refX") as String;
      }
      
      public function set _15385(param1:String) : void
      {
         _15253("refX",param1);
         this._15378();
      }
      
      public function get _15384() : String
      {
         return _1699("refY") as String;
      }
      
      public function set _15384(param1:String) : void
      {
         _15253("refY",param1);
         this._15378();
      }
      
      public function get _15381() : String
      {
         return _1699("markerWidth") as String;
      }
      
      public function set _15381(param1:String) : void
      {
         _15253("markerWidth",param1);
         this._15378();
      }
      
      public function get _15380() : String
      {
         return _1699("markerHeight") as String;
      }
      
      public function set _15380(param1:String) : void
      {
         _15253("markerHeight",param1);
         this._15378();
      }
      
      public function get _15383() : String
      {
         return _1699("orient") as String;
      }
      
      public function set _15383(param1:String) : void
      {
         _15253("orient",param1);
         this._15378();
      }
      
      public function get _15190() : Rectangle
      {
         return _1699("viewBox") as Rectangle;
      }
      
      public function set _15190(param1:Rectangle) : void
      {
         _15253("viewBox",param1);
         this._15378();
      }
      
      public function get _15189() : String
      {
         return _1699("preserveAspectRatio") as String;
      }
      
      public function set _15189(param1:String) : void
      {
         _15253("preserveAspectRatio",param1);
         this._15378();
      }
      
      protected function _15378() : void
      {
         if(!this._15379)
         {
            this._15379 = true;
            invalidate();
         }
      }
      
      override protected function _15207() : _14197
      {
         if(!_15247)
         {
            return null;
         }
         return _15247._15247;
      }
      
      public function get _15289() : _14172
      {
         return this._15382;
      }
      
      public function set _15289(param1:_14172) : void
      {
         this._15382 = param1;
         this._15378();
      }
      
      override public function validate() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Rectangle = null;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         super.validate();
         if(this._15379)
         {
            this._15379 = false;
            scrollRect = null;
            content.scaleX = 1;
            content.scaleY = 1;
            content.x = 0;
            content.y = 0;
            _loc1_ = 3;
            if(this._15381)
            {
               _loc1_ = _15258(this._15381,_14246.WIDTH);
            }
            _loc2_ = 3;
            if(this._15380)
            {
               _loc2_ = _15258(this._15380,_14246.HEIGHT);
            }
            if(this._15190 != null)
            {
               if(this._15189 != "none")
               {
                  _loc7_ = new Rectangle(0,0,_loc1_,_loc2_);
                  _loc8_ = _14232._15209(this._15189 || "");
                  _loc9_ = _14247._15226(_loc7_,this._15190,_loc8_.align,_loc8_.meetOrSlice);
                  if(_loc8_.meetOrSlice == "slice")
                  {
                     scrollRect = _loc7_;
                  }
                  content.scaleX = _loc9_.contentScaleX;
                  content.scaleY = _loc9_.contentScaleY;
                  content.x = _loc9_.contentX;
                  content.y = _loc9_.contentY;
               }
               else
               {
                  content.x = x;
                  content.y = y;
                  content.scaleX = _loc1_ / content.width;
                  content.scaleY = _loc2_ / content.height;
               }
            }
            _loc3_ = 0;
            if(this._15385)
            {
               _loc3_ = _15258(this._15385,_14246.WIDTH);
            }
            _loc4_ = 0;
            if(this._15384)
            {
               _loc4_ = _15258(this._15384,_14246.HEIGHT);
            }
            rotation = !this._15383 || this._15383 == "auto" ? this._15289.angle : Number(this._15383);
            scaleX = this._15289._15175;
            scaleY = this._15289._15175;
            _loc5_ = content.localToGlobal(new Point(_loc3_,_loc4_));
            _loc6_ = parent.globalToLocal(_loc5_);
            x = this._15289.position.x - _loc6_.x - x;
            y = this._15289.position.y - _loc6_.y - y;
         }
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc2_:_14210 = super.clone(param1) as _14210;
         _loc2_._15385 = this._15385;
         _loc2_._15384 = this._15384;
         _loc2_._15381 = this._15381;
         _loc2_._15380 = this._15380;
         _loc2_._15383 = this._15383;
         return _loc2_;
      }
   }
}

