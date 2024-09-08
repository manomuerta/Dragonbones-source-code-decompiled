package _1485
{
   import _1045._1084;
   import _1045._1105;
   
   public class _1484 extends _1084
   {
      private var _6466:Class;
      
      private var _6467:Class;
      
      private var _6469:Class;
      
      protected var _7049:Object;
      
      private var back:_1105;
      
      private var icon:_1105;
      
      public function _1484()
      {
         this._6466 = _1484__6466;
         this._6467 = _1484__6467;
         this._6469 = _1484__6469;
         super();
         this.states = ["up","over","down","disabled"];
         this.minWidth = 33;
         this.minHeight = 24;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.back = new _1105();
         this.back.source = this._6466;
         this.back.left = 0;
         this.back.right = 0;
         this.back.bottom = 0;
         this.back.top = 0;
         this.addElement(this.back);
         this.icon = new _1105();
         this.icon.source = this._7049;
         this.icon.verticalCenter = 0;
         this.icon.horizontalCenter = 0;
         this.addElement(this.icon);
      }
      
      override protected function _2519() : void
      {
         this.icon.alpha = this.back.alpha = 1;
         switch(_2080)
         {
            case "up":
               this.back.source = this._6466;
               break;
            case "over":
               this.back.source = this._6467;
               break;
            case "down":
               this.back.source = this._6469;
               break;
            case "disabled":
               this.back.alpha = 0.6;
               this.icon.alpha = 0.3;
         }
      }
   }
}

