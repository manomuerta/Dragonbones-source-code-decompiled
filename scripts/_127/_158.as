package _127
{
   import _1045.Group;
   import _1045._1082;
   import _1045._1084;
   import _1185._1189;
   import _1185._1197;
   
   public class _158 extends _1084
   {
      public var _2440:Group;
      
      public var _2527:Group;
      
      public var _2569:_1082;
      
      public function _158()
      {
         super();
         this.states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         var _loc2_:_1189 = null;
         super._2438();
         this._2527 = new Group();
         this._2527.clipAndEnableScrolling = true;
         this._2527.layout = _loc2_;
         this._2527.right = 0;
         this._2569 = new _1082();
         this._2569.visible = false;
         this._2569.fillColor = 1777701;
         this._2569.height = 1;
         this._2569.percentWidth = 100;
         this._2440 = new Group();
         this._2440.clipAndEnableScrolling = true;
         this._2440.percentHeight = 100;
         this._2440.percentWidth = 100;
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 0;
         _loc2_ = new _1189();
         _loc2_.gap = 0;
         var _loc3_:Group = new Group();
         _loc3_.layout = _loc1_;
         _loc3_.left = 0;
         _loc3_.right = 0;
         _loc3_.top = 0;
         _loc3_.bottom = 0;
         var _loc4_:Group;
         (_loc4_ = new Group()).clipAndEnableScrolling = true;
         _loc4_.percentWidth = 100;
         _loc4_.addElement(this._2527);
         var _loc5_:Group;
         (_loc5_ = new Group()).percentHeight = 100;
         _loc5_.percentWidth = 100;
         var _loc6_:_1082;
         (_loc6_ = new _1082()).percentHeight = 100;
         _loc6_.percentWidth = 100;
         _loc6_.fillColor = 0;
         _loc6_._2529 = 0.2;
         _loc5_.addElement(_loc6_);
         _loc5_.addElement(this._2440);
         _loc3_.addElement(_loc4_);
         _loc3_.addElement(this._2569);
         _loc3_.addElement(_loc5_);
         this.addElement(_loc3_);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "normal")
         {
            this._2440.alpha = 1;
         }
         if(_2080 == "disabled")
         {
            this._2440.alpha = 0.5;
         }
      }
   }
}

