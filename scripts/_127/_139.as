package _127
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1084;
   import _1045._1105;
   import _97._125;
   
   public class _139 extends _1084
   {
      public var labelDisplay:Label;
      
      public var image:_1105;
      
      public function _139()
      {
         super();
         states = ["up","over","down","disabled","upAndSelected","overAndSelected","downAndSelected","disabledAndSelected"];
         this._2080 = "up";
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.labelDisplay = new Label();
         this.image = new _1105();
         var _loc1_:Group = _125._2414();
         _loc1_.addElement(this.image);
         _loc1_.addElement(this.labelDisplay);
         this.addElement(_loc1_);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         switch(_2080)
         {
            case "upAndSelected":
               this.image.source = "assets/button/folditem_normal_selected.png";
               break;
            case "up":
               this.image.source = "assets/button/folditem_normal.png";
               break;
            case "overAndSelected":
               this.image.source = "assets/button/folditem_over_selected.png";
               break;
            case "over":
               this.image.source = "assets/button/folditem_over.png";
               break;
            case "downAndSelected":
               this.image.source = "assets/button/folditem_down_selected.png";
               break;
            case "down":
               this.image.source = "assets/button/folditem_down.png";
               break;
            case "disabled":
            case "disabledAndSelected":
         }
      }
   }
}

