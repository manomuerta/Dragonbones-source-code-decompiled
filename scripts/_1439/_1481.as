package _1439
{
   import _1045.Group;
   import _1045._1082;
   import _1045._1084;
   import _1185._1189;
   import _1185._1197;
   
   public class _1481 extends _1084
   {
      public var _2440:Group;
      
      public var _2527:Group;
      
      public var _2569:_1082;
      
      public function _1481()
      {
         super();
         this.states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc3_:Group = null;
         super._2438();
         _loc1_ = new Group();
         var _loc2_:_1197 = new _1197();
         _loc2_.gap = 0;
         _loc1_.layout = _loc2_;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         this.addElement(_loc1_);
         _loc3_ = new Group();
         _loc3_.clipAndEnableScrolling = true;
         _loc3_.percentWidth = 100;
         _loc1_.addElement(_loc3_);
         this._2527 = new Group();
         this._2527.clipAndEnableScrolling = true;
         var _loc4_:_1189;
         (_loc4_ = new _1189()).gap = 0;
         this._2527.layout = _loc4_;
         this._2527.right = 0;
         _loc3_.addElement(this._2527);
         this._2569 = new _1082();
         this._2569.visible = false;
         this._2569.fillColor = 1777701;
         this._2569.height = 1;
         this._2569.percentWidth = 100;
         _loc1_.addElement(this._2569);
         this._2440 = new Group();
         this._2440.clipAndEnableScrolling = true;
         this._2440.percentHeight = 100;
         this._2440.percentWidth = 100;
         _loc1_.addElement(this._2440);
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

