package _834
{
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   
   public class _13169 extends _1084
   {
      private var ui:_1082;
      
      public var _2448:_1105;
      
      public function _13169()
      {
         super();
         this.states = ["up","over","down","disabled","limited_up","limited_over","limited_down","limited_disabled"];
         this.minHeight = this.minWidth = 24;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.ui = new _1082();
         this.ui.percentWidth = this.ui.percentHeight = 100;
         this.ui.fillColor = 16777215;
         this.ui._2529 = 0;
         this.addElement(this.ui);
         this._2448 = new _1105();
         this._2448.verticalCenter = 0;
         this._2448.horizontalCenter = 0;
         this.addElement(this._2448);
      }
      
      override protected function _2519() : void
      {
         switch(_2080)
         {
            case "up":
               this.ui.fillColor = 16777215;
               this.ui._2529 = 0;
               this.ui.alpha = this._2448.alpha = 1;
               break;
            case "over":
               this.ui.fillColor = 3425870;
               this.ui._2529 = 1;
               this.ui.alpha = this._2448.alpha = 1;
               break;
            case "down":
               this.ui.fillColor = 1777956;
               this.ui._2529 = 1;
               this.ui.alpha = this._2448.alpha = 1;
               break;
            case "disabled":
               this.ui.fillColor = 16777215;
               this.ui._2529 = 0;
               this.ui.alpha = this._2448.alpha = 0.5;
               break;
            case "limited_up":
               this.ui.fillColor = 16777215;
               this.ui._2529 = 0;
               this.ui.alpha = this._2448.alpha = 0.5;
               break;
            case "limited_over":
               this.ui.fillColor = 3425870;
               this.ui._2529 = 1;
               this.ui.alpha = this._2448.alpha = 0.5;
               break;
            case "limited_down":
               this.ui.fillColor = 1777956;
               this.ui._2529 = 1;
               this.ui.alpha = this._2448.alpha = 0.5;
               break;
            case "limited_disabled":
               this.ui.fillColor = 16777215;
               this.ui._2529 = 0;
               this.ui.alpha = this._2448.alpha = 0.5;
         }
      }
   }
}

