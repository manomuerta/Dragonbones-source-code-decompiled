package _1439
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1084;
   import _1045._1105;
   import _1185._1196;
   import flash.text.TextFormatAlign;
   
   public class _1444 extends _1084
   {
      private var _2618:Class;
      
      private var _2617:Class;
      
      private var _2616:Class;
      
      protected var group:Group;
      
      public var labelDisplay:Label;
      
      protected var _2530:_1105;
      
      public function _1444()
      {
         this._2618 = _1444__2618;
         this._2617 = _1444__2617;
         this._2616 = _1444__2616;
         super();
         states = ["up","over","down","disabled"];
         this.height = 23;
         this.minHeight = 23;
         this.minWidth = 23;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.group = new Group();
         this.group.left = this.group.right = this.group.bottom = this.group.top = 0;
         this.addElement(this.group);
         this._2530 = new _1105();
         this._2530.left = this._2530.right = this._2530.top = this._2530.bottom = 0;
         this._2530.source = this._2618;
         this.group.addElement(this._2530);
         this.labelDisplay = new Label();
         this.labelDisplay.textAlign = TextFormatAlign.LEFT;
         this.labelDisplay.verticalAlign = _1196.MIDDLE;
         this.labelDisplay._6080 = 1;
         this.labelDisplay.left = 5;
         this.labelDisplay.right = 5;
         this.labelDisplay.verticalCenter = 0;
         this.group.addElement(this.labelDisplay);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         this.group.alpha = 1;
         switch(_2080)
         {
            case "up":
               this._2530.source = this._2618;
               break;
            case "over":
               this._2530.source = this._2617;
               break;
            case "down":
               this._2530.source = this._2616;
               break;
            case "disabled":
               this._2530.source = this._2618;
               this.group.alpha = 0.5;
         }
      }
   }
}

