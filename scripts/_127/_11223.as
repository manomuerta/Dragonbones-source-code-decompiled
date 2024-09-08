package _127
{
   import _1045.Label;
   import _1045._1105;
   import _1185._1196;
   import _1439._1227;
   import flash.geom.Rectangle;
   import flash.text.TextFormatAlign;
   
   public class _11223 extends _1227
   {
      protected var _11292:Class;
      
      protected var _11291:Class;
      
      public function _11223()
      {
         this._11292 = _11223__11292;
         this._11291 = _11223__11291;
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
         this.addElement(_2530);
         labelDisplay = new Label();
         labelDisplay.top = labelDisplay.bottom = 1;
         labelDisplay.left = labelDisplay.right = 10;
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
               _2530.source = _6466;
               break;
            case "over":
               _2530.source = _6467;
               break;
            case "overAndSelected":
               _2530.source = this._11291;
               break;
            case "down":
               _2530.source = _6469;
               break;
            case "downAndSelected":
            case "upAndSelected":
               _2530.source = this._11292;
               break;
            case "disabled":
               _2530.source = _6468;
               labelDisplay.alpha = 0.2;
               break;
            case "disabledAndSelected":
               _2530.source = _6469;
               labelDisplay.alpha = 0.2;
         }
      }
   }
}

