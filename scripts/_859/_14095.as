package _859
{
   import _1404._1407;
   import _14193._14197;
   import _51._70;
   import _521._528;
   import _724._14085;
   import _724._725;
   import egret.core._1140;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _14095 extends _1140 implements _860, _858
   {
      protected var _14340:_14197;
      
      private var _6223:_70;
      
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _14762:_14085;
      
      public function _14095()
      {
         super();
      }
      
      public function get element() : _14197
      {
         return this._14340;
      }
      
      public function set element(param1:_14197) : void
      {
         if(this._14340 == param1)
         {
            return;
         }
         this._14340 = param1;
         _2466();
      }
      
      public function dispose() : void
      {
      }
      
      public function get _5744() : Boolean
      {
         return this._5740;
      }
      
      public function set _5747(param1:Boolean) : void
      {
         this._5741 = param1;
      }
      
      public function set _5744(param1:Boolean) : void
      {
         this._5740 = param1;
      }
      
      private function get _6211() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
      
      public function set _5724(param1:Object) : void
      {
         graphics.clear();
         removeChildren();
         if(param1 is _14197)
         {
            this.element = param1 as _14197;
            this.element.x = -this.element._14651 / 2 - this.element.offsetX;
            this.element.y = -this.element._14650 / 2 - this.element.offsetY;
            (this as Sprite).addChild(this.element);
         }
         if(!this._5740)
         {
            dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      public function set _2104(param1:_725) : void
      {
         if(this._14762 != param1 || this._14762 != null && this._14762._5899)
         {
            if(this._14762 != null)
            {
               this._14762._5725(this);
            }
            this._14340 = null;
            this._14762 = param1 as _14085;
            if(this._14762 != null)
            {
               this._14762._5735(this);
            }
         }
      }
      
      public function get _5747() : Boolean
      {
         return this._5741;
      }
      
      public function get AABB() : Rectangle
      {
         var _loc1_:Number = 1;
         var _loc2_:Number = 1;
         if((this._5740 || this._5741) && this._14762 && this._14762.width > 0 && this._14762.height > 0)
         {
            _loc1_ = this._14762.width;
            _loc2_ = this._14762.height;
         }
         else if(this._14340)
         {
            _loc1_ = this._14340._14651;
            _loc2_ = this._14340._14650;
         }
         return new Rectangle(-_loc1_ / 2,-_loc2_ / 2,_loc1_,_loc2_);
      }
      
      public function get matrix() : Matrix
      {
         return transform.matrix;
      }
      
      public function _6357() : void
      {
         var _loc1_:_14197 = this.element.clone();
         this.element = null;
         this.element = _loc1_;
      }
   }
}

