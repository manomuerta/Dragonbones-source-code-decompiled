package _825
{
   import _1045.Group;
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _579._580;
   import _73._74;
   import flash.geom.Matrix;
   
   public class _827 extends Group
   {
      private var _6228:Matrix;
      
      private var _6230:_826;
      
      private var _6039:_824;
      
      private var _6038:Boolean = false;
      
      private var _4213:_79;
      
      private var _color:uint;
      
      private var _6227:Boolean = true;
      
      private var _2009:Matrix;
      
      public function _827(param1:uint)
      {
         this._6228 = new Matrix();
         this._6230 = new _826();
         this._6039 = new _824();
         this._2009 = new Matrix();
         super();
         mouseEnabled = false;
         mouseChildren = false;
         alpha = 0.9;
         this._color = param1;
      }
      
      public function dispose() : void
      {
         this._1837 = null;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6230.color = this._color;
         this._6039.color = this._color;
         this.addElement(this._6230);
         this.addElement(this._6039);
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._6038)
         {
            this._6038 = false;
            this._6037();
         }
      }
      
      protected function _6037() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(Boolean(this._4213) && Boolean(this._4213._2049))
         {
            _loc1_ = this._4213.globalTransform.scaleX;
            _loc2_ = this._4213.globalTransform.scaleY;
            _loc3_ = _loc1_ * this._2580;
            _loc4_ = _loc2_ * this._2580;
            this._6039._6220 = _loc3_;
            this._6039._6219 = _loc4_;
            this._6230._6220 = _loc3_;
            this._6230._6219 = _loc4_;
            if(this._4213._2112())
            {
               this.transform.matrix = this._6228;
               return;
            }
            if(_loc1_ == 1 && _loc2_ == 1 && this._2580 == 1)
            {
               this.transform.matrix = this._4213._2009;
            }
            else
            {
               this._2009.copyFrom(this._4213._2009);
               this._2009.a /= _loc1_;
               this._2009.b /= _loc1_;
               this._2009.c /= _loc2_;
               this._2009.d /= _loc2_;
               this._2009.tx *= this._2580;
               this._2009.ty *= this._2580;
               this.transform.matrix = this._2009;
            }
         }
      }
      
      public function _1988() : void
      {
         this._6039._6218(null);
         if(Boolean(this._4213) && Boolean(this._4213._2049))
         {
            this._6038 = true;
            _2466();
            if(Boolean(this._4213._2049) && this._4213._2049.type == _74.MESH)
            {
               this._6039._6218(this._4213._2049.mesh);
            }
            else
            {
               if(Boolean(this._4213._2049) && this._4213._2049.type == _74.BOUNDINGBOX)
               {
                  this._6039._11444(this._4213._2049._11278);
                  this._6230.displayVO = this._6227 ? this._4213._2049 : null;
                  return;
               }
               if(this._4213._2049 && this._4213._2049.type == _74.ARMATURE && this._4213._2049._14296 != null)
               {
                  this._6039._14749(this._4213._2049._14296);
                  this._6230.displayVO = this._6227 ? this._4213._2049 : null;
                  return;
               }
            }
            this._6230.displayVO = this._6227 ? this._4213._2049 : null;
            this._6039._2104 = this._4213._2049._2104;
         }
         else
         {
            this._6230.displayVO = null;
            this._6039._2104 = null;
         }
      }
      
      public function get _1837() : _79
      {
         return this._4213;
      }
      
      public function set _1837(param1:_79) : void
      {
         if(this._4213 == param1)
         {
            return;
         }
         this._4213 = param1;
         this._1988();
      }
      
      public function set _6229(param1:Boolean) : void
      {
         if(this._6227 == param1)
         {
            return;
         }
         this._6227 = param1;
         if(this._4213)
         {
            this._6230.displayVO = this._6227 ? this._4213._2049 : null;
         }
      }
      
      protected function get _2580() : Number
      {
         return (_1407.getInstance(_580) as _580)._2212._2580;
      }
   }
}

