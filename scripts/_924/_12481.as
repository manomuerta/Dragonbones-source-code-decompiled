package _924
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1084;
   import _1045._1105;
   import _1529._1528;
   import _1529._1530;
   import _822._828;
   import _97._125;
   
   public class _12481 extends _1084
   {
      public var labelDisplay:Label;
      
      public var image:_1105;
      
      public function _12481()
      {
         super();
         states = ["up","over","down","disabled","upAndSelected","overAndSelected","downAndSelected","disabledAndSelected"];
         this._2080 = "up";
      }
      
      override protected function _2438() : void
      {
         var _loc2_:_828 = null;
         var _loc3_:_828 = null;
         super._2438();
         this.labelDisplay = new Label();
         this.labelDisplay._6541 = true;
         this.labelDisplay.height = this.labelDisplay.size + 2;
         if(_1528.language == _1530.en_US || _1528.language == _1530.ru_RF)
         {
            this.labelDisplay.height = this.labelDisplay.size + 8;
         }
         this.image = new _1105();
         var _loc1_:Group = _125._2397();
         _loc1_.percentWidth = 100;
         _loc1_.addElement(this.image);
         _loc2_ = new _828();
         _loc2_.color = 3100242;
         _loc2_.percentWidth = 100;
         _loc1_.addElement(_loc2_);
         _loc1_.addElement(this.labelDisplay);
         _loc3_ = new _828();
         _loc3_.color = 3100242;
         _loc3_.percentWidth = 100;
         _loc1_.addElement(_loc3_);
         this.addElement(_loc1_);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         switch(_2080)
         {
            case "upAndSelected":
               this.image.source = "assets/button/folditem_white_normal_selected.png";
               break;
            case "up":
               this.image.source = "assets/button/folditem_white_normal.png";
               break;
            case "overAndSelected":
               this.image.source = "assets/button/folditem_white_over_selected.png";
               break;
            case "over":
               this.image.source = "assets/button/folditem_white_over.png";
               break;
            case "downAndSelected":
               this.image.source = "assets/button/folditem_white_normal_selected.png";
               break;
            case "down":
               this.image.source = "assets/button/folditem_white_normal.png";
               break;
            case "disabled":
            case "disabledAndSelected":
         }
      }
   }
}

