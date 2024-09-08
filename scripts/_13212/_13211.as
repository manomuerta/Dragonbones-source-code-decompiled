package _13212
{
   import _1404._1407;
   import _51._70;
   import _521._528;
   import _724._725;
   import _724._732;
   import _822._830;
   import _859._858;
   import _859._860;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _13211 extends _830 implements _860, _858
   {
      private var _6223:_70;
      
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _6355:_732;
      
      private var _6356:Boolean = true;
      
      public function _13211()
      {
         super();
      }
      
      public function get _6358() : Boolean
      {
         return this._6356;
      }
      
      public function set _6358(param1:Boolean) : void
      {
         this._6356 = param1;
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
         if(param1 is BitmapData)
         {
            super.bitmapData = param1 as BitmapData;
         }
         if(!this._5740)
         {
            dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      override protected function draw() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         graphics.clear();
         if(_bitmapData)
         {
            _3689.setTo(1,0,0,1,0,0);
            if(this._6223)
            {
               _3689.translate(this._6223.localTransform.x,this._6223.localTransform.y);
            }
            _loc1_ = this.width / _bitmapData.width;
            _loc2_ = this.height / _bitmapData.height;
            _loc3_ = Math.min(_loc1_,_loc2_);
            if(_loc3_ > 1)
            {
               _loc3_ = 1;
            }
            if(_loc3_ <= 0)
            {
               return;
            }
            _3689.scale(_loc3_,_loc3_);
            _loc4_ = _bitmapData.width * _loc3_;
            _loc5_ = _bitmapData.height * _loc3_;
            _3689.tx = -_loc4_ / 2;
            _3689.ty = -_loc5_ / 2;
            graphics.beginBitmapFill(_bitmapData,_3689,false,true);
            graphics.drawRect(-_loc4_ / 2,-_loc5_ / 2,_loc4_,_loc5_);
         }
      }
      
      public function set _2104(param1:_725) : void
      {
         if(this._6355 != param1 || this._6355 != null && this._6355._5899)
         {
            if(this._6355 != null)
            {
               this._6355._5725(this);
            }
            _bitmapData = null;
            this._6355 = param1 as _732;
            if(this._6355 != null)
            {
               this._6355._5735(this);
            }
         }
         else if(this._6355 == param1 && _bitmapData != null)
         {
            this.draw();
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
         if((this._5740 || this._5741) && this._6355 && this._6355.width > 0 && this._6355.height > 0)
         {
            _loc1_ = this._6355.width;
            _loc2_ = this._6355.height;
         }
         else if(_bitmapData)
         {
            _loc1_ = _bitmapData.width;
            _loc2_ = _bitmapData.height;
         }
         return new Rectangle(-_loc1_ / 2,-_loc2_ / 2,_loc1_,_loc2_);
      }
      
      public function get matrix() : Matrix
      {
         return transform.matrix;
      }
      
      public function _6357() : void
      {
         var _loc1_:BitmapData = bitmapData;
         bitmapData = null;
         bitmapData = _loc1_;
      }
   }
}

