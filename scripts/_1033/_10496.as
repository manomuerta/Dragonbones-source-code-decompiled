package _1033
{
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   import flash.geom.Rectangle;
   
   public class _10496 extends _1084
   {
      private var _6466:Class;
      
      private var _6467:Class;
      
      private var _6469:Class;
      
      private var _6468:Class;
      
      private var ui:_1082;
      
      private var _2530:_1105;
      
      public var _2448:_1105;
      
      public function _10496()
      {
         this._6466 = _10496__6466;
         this._6467 = _10496__6467;
         this._6469 = _10496__6469;
         this._6468 = _10496__6468;
         super();
         this.states = ["up","over","down","disabled"];
         this.minHeight = this.minWidth = 24;
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
               this._2448.alpha = 1;
               this._2530.source = this._6466;
               break;
            case "over":
               this._2448.alpha = 1;
               this._2530.source = this._6467;
               break;
            case "down":
               this._2448.alpha = 1;
               this._2530.source = this._6469;
               break;
            case "disabled":
               this._2530.source = this._6468;
               this._2448.alpha = 0.2;
         }
      }
   }
}

