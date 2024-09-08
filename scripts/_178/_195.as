package _178
{
   import flash.geom.ColorTransform;
   
   public final class _195 extends _198
   {
      public var name:String;
      
      public var _2773:Boolean;
      
      public function _195()
      {
         super();
         offset = 0;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override protected function _2771(param1:_189, param2:_189, param3:int) : _189
      {
         var _loc7_:_194 = null;
         var _loc4_:_194 = param1 as _194;
         var _loc5_:_194 = param2 as _194;
         var _loc6_:Number = param3 / param1.duration;
         (_loc7_ = _loc4_.clone() as _194).color = this._2770(_loc4_.color,_loc5_.color,_loc6_);
         return _loc7_;
      }
      
      private function _2770(param1:ColorTransform, param2:ColorTransform, param3:Number) : ColorTransform
      {
         var _loc4_:ColorTransform = null;
         if(Boolean(param1) && Boolean(param2))
         {
            (_loc4_ = new ColorTransform()).alphaMultiplier = param1.alphaMultiplier + (param2.alphaMultiplier - param1.alphaMultiplier) * param3;
            _loc4_.redMultiplier = param1.redMultiplier + (param2.redMultiplier - param1.redMultiplier) * param3;
            _loc4_.greenMultiplier = param1.greenMultiplier + (param2.greenMultiplier - param1.greenMultiplier) * param3;
            _loc4_.blueMultiplier = param1.blueMultiplier + (param2.blueMultiplier - param1.blueMultiplier) * param3;
         }
         else if(param1)
         {
            return param1;
         }
         return _loc4_;
      }
   }
}

