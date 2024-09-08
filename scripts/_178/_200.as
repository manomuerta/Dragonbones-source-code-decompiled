package _178
{
   import flash.geom.Point;
   
   public final class _200 extends _198
   {
      public var name:String;
      
      public var _2773:Boolean;
      
      public var _1904:_184;
      
      public var _1797:Point;
      
      public function _200()
      {
         super();
         this._1904 = new _184();
         this._1904.scaleX = 1;
         this._1904.scaleY = 1;
         this._1797 = new Point();
         offset = 0;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this._1904 = null;
         this._1797 = null;
      }
      
      override protected function _2771(param1:_189, param2:_189, param3:int) : _189
      {
         var _loc7_:_199 = null;
         var _loc4_:_199 = param1 as _199;
         var _loc5_:_199 = param2 as _199;
         var _loc6_:Number = param3 / param1.duration;
         (_loc7_ = _loc4_.clone() as _199).transform = this._2776(_loc4_.transform,_loc5_.transform,_loc6_);
         return _loc7_;
      }
      
      private function _2776(param1:_184, param2:_184, param3:Number) : _184
      {
         var _loc4_:_184 = null;
         (_loc4_ = new _184()).x = param1.x + (param2.x - param1.x) * param3;
         _loc4_.y = param1.y + (param2.y - param1.y) * param3;
         _loc4_.scaleX = param1.scaleX + (param2.scaleX - param1.scaleX) * param3;
         _loc4_.scaleY = param1.scaleY + (param2.scaleY - param1.scaleY) * param3;
         _loc4_.skewX = param1.skewX + (param2.skewX - param1.skewX) * param3;
         _loc4_.skewY = param1.skewY + (param2.skewY - param1.skewY) * param3;
         return _loc4_;
      }
   }
}

