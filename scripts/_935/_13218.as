package _935
{
   import _1045._1084;
   import _1045._1105;
   
   public class _13218 extends _1084
   {
      public const NOMAL_ICON:String = "/assets/button/dot_empty_normal.png";
      
      public const OVER_ICON:String = "/assets/button/dot_empty_mouseover.png";
      
      public const DOWN_ICON:String = "/assets/button/dot_full.png";
      
      private var icon:_1105;
      
      private var bg:_1105;
      
      public function _13218()
      {
         super();
         this.states = ["up","over","down","disabled","upAndSelected","overAndSelected","downAndSelected","disabledAndSelected"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.icon = new _1105();
         this.icon.verticalCenter = 0;
         this.bg = new _1105();
         this.bg.graphics.beginFill(0,0);
         this.bg.graphics.drawRect(0,0,8,8);
         addElement(this.bg);
         addElement(this.icon);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         switch(_2080)
         {
            case "up":
            case "disabled":
               this.icon.source = this.NOMAL_ICON;
               break;
            case "over":
               this.icon.source = this.OVER_ICON;
               break;
            case "down":
            case "upAndSelected":
            case "downAndSelected":
            case "overAndSelected":
            case "disabledAndSelected":
               this.icon.source = this.DOWN_ICON;
         }
         if(_2080 == "disabled" || _2080 == "disabledAndSelected")
         {
            this.icon.alpha = 0.5;
         }
         else
         {
            this.icon.alpha = 1;
         }
      }
   }
}

