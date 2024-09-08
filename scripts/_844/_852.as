package _844
{
   import _1045.Group;
   import _1404._1407;
   import _51._52;
   import _51._79;
   import _579._580;
   import _586._599;
   import _708._707;
   import _708._715;
   import _81._86;
   import _81._88;
   import _81._91;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _852 extends Group
   {
      public var _5291:_849;
      
      public var _4341:_853;
      
      public var _5115:_850;
      
      public var _5120:_851;
      
      public var pivotPoint:_847;
      
      private var _6304:_91;
      
      private var _6038:Boolean = false;
      
      private var _6300:Boolean = false;
      
      private var _5641:_715;
      
      private var _5626:_707;
      
      private var _2009:Matrix;
      
      private var _6298:Point;
      
      private var _6299:Matrix;
      
      private var _6303:Boolean = false;
      
      public function _852()
      {
         this._5291 = new _849();
         this._4341 = new _853();
         this._5115 = new _850();
         this._5120 = new _851();
         this.pivotPoint = new _847();
         this._5641 = _715.ARMATURE;
         this._5626 = _707.GLOBAL;
         this._2009 = new Matrix();
         this._6298 = new Point();
         this._6299 = new Matrix();
         super();
         width = 0;
         height = 0;
         visible = false;
         mouseEnabled = false;
         alpha = 0.9;
         this._4902 = false;
         this._5291._6207 = false;
      }
      
      public function dispose() : void
      {
         this._1897 = null;
      }
      
      public function _4365(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : void
      {
         this._4341._4365(param1,param2);
         this._5120._4365(param3,param4);
         this.pivotPoint._4365(param6);
         this._5291._4365(param7);
      }
      
      public function _4337() : void
      {
         this._4341._4337();
         this._5120._4337();
         this.pivotPoint._4337();
         this._5291._4337();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         addElement(this._5291);
         addElement(this._5115);
         this._5115.visible = false;
         addElement(this._4341);
         addElement(this._5120);
         addElement(this.pivotPoint);
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(!visible)
         {
            return;
         }
         if(this._6038)
         {
            this._6038 = false;
            this._6037();
         }
         if(this._6300)
         {
            this._6300 = false;
            this._6302();
         }
      }
      
      protected function _6037() : void
      {
         var _loc4_:_91 = null;
         var _loc5_:_86 = null;
         var _loc6_:Matrix = null;
         if(this._6304 == null)
         {
            return;
         }
         var _loc1_:Number = this._6304.globalTransform.scaleX;
         var _loc2_:Number = this._6304.globalTransform.scaleY;
         var _loc3_:Matrix = this._6304._2009;
         this._5120._6220 = _loc1_;
         this._5120._6219 = _loc2_;
         if(this._5626 == _707.LOCAL)
         {
            if(_loc1_ == 1 && _loc2_ == 1 && this._2580 == 1)
            {
               this.transform.matrix = _loc3_;
               return;
            }
            this._2009.a = _loc3_.a / _loc1_;
            this._2009.b = _loc3_.b / _loc1_;
            this._2009.c = _loc3_.c / _loc2_;
            this._2009.d = _loc3_.d / _loc2_;
            this._2009.tx = _loc3_.tx * this._2580;
            this._2009.ty = _loc3_.ty * this._2580;
         }
         else if(this._5626 == _707.PARENT && Boolean(this._6304["parentBoneData"]))
         {
            _loc4_ = this._6304["parentBoneData"];
            _loc5_ = _loc4_.globalTransform;
            _loc6_ = _loc4_._2009;
            this._2009.a = _loc6_.a / _loc5_.scaleX;
            this._2009.b = _loc6_.b / _loc5_.scaleX;
            this._2009.c = _loc6_.c / _loc5_.scaleY;
            this._2009.d = _loc6_.d / _loc5_.scaleY;
            this._2009.tx = _loc3_.tx * this._2580;
            this._2009.ty = _loc3_.ty * this._2580;
         }
         else
         {
            this._2009.a = 1;
            this._2009.b = 0;
            this._2009.c = 0;
            this._2009.d = 1;
            this._2009.tx = _loc3_.tx * this._2580;
            this._2009.ty = _loc3_.ty * this._2580;
         }
         this.transform.matrix = this._2009;
         this._5115.rotation = this._6304.globalTransform.rotation * _88.RADIAN_TO_ANGLE;
         if(this._5120.separate)
         {
            this._5120.rotation = this._6304.globalTransform.rotation * _88.RADIAN_TO_ANGLE;
         }
         else
         {
            this._5120.rotation = 0;
         }
      }
      
      protected function _6302() : void
      {
         if(this._6304 is _52)
         {
            this._6299 = this._6297.clone();
            this._6299.tx = 0;
            this._6299.ty = 0;
            this._6298.x = (this._6304 as _52).length;
            this._6298.y = 0;
            _88._2135(this._6298,this._6299);
            this._5291.x = this._6298.x * this._2580;
            this._5291.y = this._6298.y * this._2580;
         }
      }
      
      public function _1751() : void
      {
         this._6038 = true;
         if(this._6304 is _52)
         {
            this._6300 = true;
         }
         _2466();
      }
      
      public function _1988() : void
      {
         if(Boolean(this._6304) && (!(this._6304 is _79) || (this._6304 as _79)._2049 && (this._5641 == _715.ARMATURE || this._5641 == _715.SHEET)))
         {
            visible = true;
            this._1751();
         }
         else
         {
            visible = false;
         }
      }
      
      public function _6301() : void
      {
         this._6300 = true;
         _2466();
      }
      
      public function get _1897() : _91
      {
         return this._6304;
      }
      
      public function set _1897(param1:_91) : void
      {
         if(this._6304 == param1)
         {
            return;
         }
         this._6304 = param1;
         this._1988();
      }
      
      public function get _5122() : Boolean
      {
         return this._4341._5122;
      }
      
      public function set _2873(param1:_715) : void
      {
         if(this._5641 == param1)
         {
            return;
         }
         this._5641 = param1;
         this._1988();
      }
      
      public function set _3326(param1:_707) : void
      {
         if(this._5626 == param1)
         {
            return;
         }
         this._5626 = param1;
         this._1751();
      }
      
      protected function get _6297() : Matrix
      {
         return this._6304._2009;
      }
      
      public function get _4902() : Boolean
      {
         return this._6303;
      }
      
      public function set _4902(param1:Boolean) : void
      {
         this._6303 = param1;
         this.pivotPoint.visible = param1;
         this._5120.visible = !param1;
      }
      
      public function set _5286(param1:Boolean) : void
      {
         this._5291.visible = param1;
      }
      
      protected function get _2580() : Number
      {
         return (_1407.getInstance(_580) as _580)._2212._2580;
      }
      
      public function _10784(param1:int) : void
      {
         switch(param1)
         {
            case _599.TRANSFORM_TRANSLATE:
               this._5115.visible = false;
               this._5120.visible = false;
               this._4341.visible = true;
               break;
            case _599.TRANSFORM_ROTATE:
               this._5115.visible = true;
               this._5120.visible = false;
               this._4341.visible = false;
               break;
            case _599.TRANSFORM_SCALE:
               this._5115.visible = false;
               this._5120.visible = true;
               this._5120.separate = true;
               this._4341.visible = false;
               break;
            case _599.TRANSFORM_FREE:
               this._5115.visible = false;
               this._5120.visible = true;
               this._5120.separate = false;
               this._4341.visible = true;
         }
         this._6037();
      }
   }
}

