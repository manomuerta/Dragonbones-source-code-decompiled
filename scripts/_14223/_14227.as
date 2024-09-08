package _14223
{
   import _14173._14172;
   import _14173._14174;
   import _14240._14239;
   import _14240._14244;
   import flash.geom.Point;
   
   public class _14227 implements _14226
   {
      private var _15417:_14226;
      
      private var _15440:Vector.<_14172>;
      
      private var _15439:Boolean = true;
      
      public function _14227(param1:_14226)
      {
         this._15440 = new Vector.<_14172>();
         super();
         this._15417 = param1;
      }
      
      public function _15286() : Vector.<_14172>
      {
         this._15436();
         return this._15440;
      }
      
      public function _15324(param1:Number, param2:Number, param3:Number, param4:Boolean, param5:Boolean, param6:Number, param7:Number) : void
      {
         var _loc8_:Number = this._15437(param1,param2,param3,param4,param5,param6,param7,this._15425,this._15426);
         var _loc9_:Number = this._15438(param1,param2,param3,param4,param5,param6,param7,this._15425,this._15426);
         if(this._15439)
         {
            this._15439 = false;
            this._15440.push(new _14172(new Point(this._15425,this._15426),_loc8_,_14174.START));
         }
         else
         {
            this._15440[this._15440.length - 1]._15174(_loc8_);
         }
         this._15440.push(new _14172(new Point(param6,param7),_loc9_,_14174.MID));
         this._15417._15324(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function cubicCurveTo(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Number = this._15432(this._15425,this._15426,param1,param2,param3,param4,param5,param6);
         var _loc8_:Number = this._15434(this._15425,this._15426,param1,param2,param3,param4,param5,param6);
         if(this._15439)
         {
            this._15439 = false;
            this._15440.push(new _14172(new Point(this._15425,this._15426),_loc7_,_14174.START));
         }
         else
         {
            this._15440[this._15440.length - 1]._15174(_loc7_);
         }
         this._15440.push(new _14172(new Point(param5,param6),_loc8_,_14174.MID));
         this._15417.cubicCurveTo(param1,param2,param3,param4,param5,param6);
      }
      
      public function curveTo(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:Number = this._15433(this._15425,this._15426,param1,param2,param3,param4);
         var _loc6_:Number = this._15435(this._15425,this._15426,param1,param2,param3,param4);
         if(this._15439)
         {
            this._15439 = false;
            this._15440.push(new _14172(new Point(this._15425,this._15426),_loc5_,_14174.START));
         }
         else
         {
            this._15440[this._15440.length - 1]._15174(_loc5_);
         }
         this._15440.push(new _14172(new Point(param3,param4),_loc6_,_14174.MID));
         this._15417.curveTo(param1,param2,param3,param4);
      }
      
      public function lineTo(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = this._15441(this._15425,this._15426,param1,param2);
         if(this._15439)
         {
            this._15439 = false;
            this._15440.push(new _14172(new Point(this._15425,this._15426),_loc3_,_14174.START));
         }
         else
         {
            this._15440[this._15440.length - 1]._15174(_loc3_);
         }
         this._15440.push(new _14172(new Point(param1,param2),_loc3_,_14174.MID));
         this._15417.lineTo(param1,param2);
      }
      
      public function moveTo(param1:Number, param2:Number) : void
      {
         this._15436();
         this._15439 = true;
         this._15417.moveTo(param1,param2);
      }
      
      public function get _15425() : Number
      {
         return this._15417._15425;
      }
      
      public function get _15426() : Number
      {
         return this._15417._15426;
      }
      
      private function _15437(param1:Number, param2:Number, param3:Number, param4:Boolean, param5:Boolean, param6:Number, param7:Number, param8:Number, param9:Number) : Number
      {
         var _loc10_:Object = _14239._15412(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         var _loc11_:Array = _14239._15410(_loc10_.cx,_loc10_.cy,_loc10_.startAngle,_loc10_.arc,_loc10_.radius,_loc10_.yRadius,_loc10_._15176);
         var _loc12_:Object = _loc11_[0];
         return this._15433(_loc12_.s.x,_loc12_.s.y,_loc12_.c.x,_loc12_.c.y,_loc12_.p.x,_loc12_.p.y);
      }
      
      private function _15438(param1:Number, param2:Number, param3:Number, param4:Boolean, param5:Boolean, param6:Number, param7:Number, param8:Number, param9:Number) : Number
      {
         var _loc10_:Object = _14239._15412(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         var _loc11_:Array = _14239._15410(_loc10_.cx,_loc10_.cy,_loc10_.startAngle,_loc10_.arc,_loc10_.radius,_loc10_.yRadius,_loc10_._15176);
         var _loc12_:Object = _loc11_[_loc11_.length - 1];
         return this._15435(_loc12_.s.x,_loc12_.s.y,_loc12_.c.x,_loc12_.c.y,_loc12_.p.x,_loc12_.p.y);
      }
      
      private function _15432(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : Number
      {
         if(param3 == param1 && param4 == param2)
         {
            return _14244._15241(Math.atan2(param6 - param2,param5 - param1));
         }
         return _14244._15241(Math.atan2(param4 - param2,param3 - param1));
      }
      
      private function _15434(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : Number
      {
         if(param5 == param7 && param6 == param8)
         {
            return _14244._15241(Math.atan2(param8 - param4,param7 - param3));
         }
         return _14244._15241(Math.atan2(param8 - param6,param7 - param5));
      }
      
      private function _15433(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : Number
      {
         return _14244._15241(Math.atan2(param4 - param2,param3 - param1));
      }
      
      private function _15435(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : Number
      {
         return _14244._15241(Math.atan2(param6 - param4,param5 - param3));
      }
      
      private function _15441(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return _14244._15241(Math.atan2(param4 - param2,param3 - param1));
      }
      
      private function _15436() : void
      {
         if(this._15440.length > 0)
         {
            this._15440[this._15440.length - 1].type = _14174.END;
         }
      }
   }
}

