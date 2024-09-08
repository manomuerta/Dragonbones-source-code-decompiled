package _834
{
   import _1045._1046;
   import _1045._1082;
   import _1045._1084;
   import _1185._1188;
   import _1185._1197;
   import _822._12899;
   
   public class _12903 extends _1084
   {
      public var _2490:_1046;
      
      public function _12903()
      {
         super();
         this.states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         var _loc1_:_1082 = new _1082();
         _loc1_._2563 = 4408134;
         _loc1_._2564 = 1;
         _loc1_.left = _loc1_.top = 0;
         _loc1_.right = _loc1_.bottom = 0;
         _loc1_.fillColor = 2699835;
         this.addElement(_loc1_);
         this._2490 = new _1046();
         this._2490.left = this._2490.right = 1;
         this._2490.top = this._2490.bottom = 1;
         this._2490.itemRenderer = _12899;
         this.addElement(this._2490);
         var _loc2_:_1197 = new _1197();
         _loc2_._2401 = _1188.CONTENT_JUSTIFY;
         _loc2_.gap = 0;
         this._2490.layout = _loc2_;
      }
   }
}

