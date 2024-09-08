package _178
{
   import flash.geom.Point;
   
   public final class _199 extends _189
   {
      public var tweenEasing:Number;
      
      public var tweenRotate:int;
      
      public var tweenScale:Boolean;
      
      public var displayIndex:int;
      
      public var visible:Boolean;
      
      public var global:_184;
      
      public var transform:_184;
      
      public var pivot:Point;
      
      public var _1787:Point;
      
      public function _199()
      {
         super();
         this.tweenEasing = 10;
         this.tweenRotate = 0;
         this.tweenScale = true;
         this.displayIndex = 0;
         this.visible = true;
         this.global = new _184();
         this.transform = new _184();
         this.pivot = new Point();
         this._1787 = new Point();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.global = null;
         this.transform = null;
         this.pivot = null;
         this._1787 = null;
      }
      
      override public function clone() : _189
      {
         var _loc1_:_199 = new _199();
         _loc1_.tweenEasing = this.tweenEasing;
         _loc1_.tweenRotate = this.tweenRotate;
         _loc1_.tweenScale = this.tweenScale;
         _loc1_.displayIndex = this.displayIndex;
         _loc1_.visible = this.visible;
         _loc1_.global = new _184();
         _loc1_.global.copy(this.global);
         _loc1_.transform = new _184();
         _loc1_.transform.copy(this.transform);
         _loc1_.pivot = this.pivot.clone();
         _loc1_._1787 = this._1787.clone();
         _loc1_.duration = this.duration;
         return _loc1_;
      }
   }
}

