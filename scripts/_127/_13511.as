package _127
{
   import _1045.Label;
   import _1045._1082;
   import _1045._1105;
   import _1185._1196;
   import _1439._1227;
   import flash.geom.Rectangle;
   import flash.text.TextFormatAlign;
   
   public class _13511 extends _1227
   {
      public const BACK_NORMAL_COLOR:uint = 3425870;
      
      public const BACK_SELECT_COLOR:uint = 5532791;
      
      public const BACK_OVER_COLOR:uint = 3425870;
      
      public const BACK_DISABLE_COLOR:uint = 3687762;
      
      public const TEXT_NORMAL_COLOR:uint = 16777215;
      
      public const TEXT_SELECT_COLOR:uint = 8123056;
      
      public const TEXT_OVER_COLOR:uint = 8123056;
      
      public const TEXT_DISABLE_COLOR:uint = 10790825;
      
      public var _13694:_1082;
      
      public function _13511()
      {
         super();
         this.states = ["up","over","down","disabled","upAndSelected","overAndSelected","downAndSelected","disabledAndSelected"];
         this.minHeight = 23;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         _2530 = new _1105();
         _2530.source = _6466;
         _2530.scale9Grid = new Rectangle(2,2,1,1);
         _2530.left = 0;
         _2530.right = 0;
         _2530.bottom = 0;
         _2530.top = 0;
         this._13694 = new _1082();
         this._13694.left = 1;
         this._13694.right = 1;
         this._13694.bottom = 1;
         this._13694.top = 1;
         this._13694._2564 = 0;
         this.addElement(this._13694);
         labelDisplay = new Label();
         labelDisplay.top = labelDisplay.bottom = 1;
         labelDisplay.left = labelDisplay.right = 1;
         labelDisplay.textAlign = TextFormatAlign.CENTER;
         labelDisplay.verticalAlign = _1196.MIDDLE;
         labelDisplay._6080 = 1;
         this.addElement(labelDisplay);
      }
      
      override protected function _2519() : void
      {
         labelDisplay.alpha = 1;
         switch(_2080)
         {
            case "up":
               this._13694.fillColor = this.BACK_NORMAL_COLOR;
               labelDisplay.textColor = this.TEXT_NORMAL_COLOR;
               break;
            case "over":
               this._13694.fillColor = this.BACK_OVER_COLOR;
               labelDisplay.textColor = this.TEXT_OVER_COLOR;
               break;
            case "overAndSelected":
               this._13694.fillColor = this.BACK_OVER_COLOR;
               labelDisplay.textColor = this.TEXT_OVER_COLOR;
               break;
            case "down":
               this._13694.fillColor = this.BACK_SELECT_COLOR;
               labelDisplay.textColor = this.TEXT_SELECT_COLOR;
               break;
            case "downAndSelected":
            case "upAndSelected":
               this._13694.fillColor = this.BACK_SELECT_COLOR;
               labelDisplay.textColor = this.TEXT_SELECT_COLOR;
               break;
            case "disabled":
               this._13694.fillColor = this.BACK_DISABLE_COLOR;
               labelDisplay.textColor = this.TEXT_DISABLE_COLOR;
               break;
            case "disabledAndSelected":
               this._13694.fillColor = this.BACK_DISABLE_COLOR;
               labelDisplay.textColor = this.TEXT_DISABLE_COLOR;
         }
      }
   }
}

