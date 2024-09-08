package _1439
{
   import _1045.Label;
   import _1045._1084;
   import _1045._1105;
   import _1185._1196;
   import flash.geom.Rectangle;
   import flash.text.TextFormatAlign;
   
   public class _1227 extends _1084
   {
      protected var _6466:Class;
      
      protected var _6467:Class;
      
      protected var _6469:Class;
      
      protected var _6468:Class;
      
      protected var _2530:_1105;
      
      public var labelDisplay:Label;
      
      public function _1227()
      {
         this._6466 = _1227__6466;
         this._6467 = _1227__6467;
         this._6469 = _1227__6469;
         this._6468 = _1227__6468;
         super();
         this.states = ["up","over","down","disabled"];
         this.minHeight = 23;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2530 = new _1105();
         this._2530.source = this._6466;
         this._2530.scale9Grid = new Rectangle(2,2,1,1);
         this._2530.left = 0;
         this._2530.right = 0;
         this._2530.bottom = 0;
         this._2530.top = 0;
         this.addElement(this._2530);
         this.labelDisplay = new Label();
         this.labelDisplay.top = this.labelDisplay.bottom = 1;
         this.labelDisplay.left = this.labelDisplay.right = 10;
         this.labelDisplay.textAlign = TextFormatAlign.CENTER;
         this.labelDisplay.verticalAlign = _1196.MIDDLE;
         this.addElement(this.labelDisplay);
      }
      
      override protected function _2519() : void
      {
         this.labelDisplay.alpha = 1;
         switch(_2080)
         {
            case "up":
               this._2530.source = this._6466;
               break;
            case "over":
               this._2530.source = this._6467;
               break;
            case "down":
               this._2530.source = this._6469;
               break;
            case "disabled":
               this._2530.source = this._6468;
               this.labelDisplay.alpha = 0.2;
         }
      }
   }
}

