package _178
{
   import flash.geom.ColorTransform;
   
   public final class _194 extends _189
   {
      public var tweenEasing:Number;
      
      public var displayIndex:int;
      
      public var visible:Boolean;
      
      public var zOrder:Number;
      
      public var color:ColorTransform;
      
      public function _194()
      {
         super();
         this.tweenEasing = 10;
         this.displayIndex = 0;
         this.visible = true;
         this.zOrder = NaN;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.color = null;
      }
      
      override public function clone() : _189
      {
         var _loc1_:_194 = new _194();
         _loc1_.tweenEasing = this.tweenEasing;
         _loc1_.displayIndex = this.displayIndex;
         _loc1_.visible = this.visible;
         _loc1_.zOrder = this.zOrder;
         _loc1_.color = this.color;
         _loc1_.duration = this.duration;
         return _loc1_;
      }
   }
}

