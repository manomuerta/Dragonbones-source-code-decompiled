package _127
{
   import _1045._1084;
   import _1045._1105;
   
   public class _170 extends _1084
   {
      public var _2625:_1105;
      
      public var _2627:_1105;
      
      public var _2626:_1105;
      
      public function _170()
      {
         super();
         this.states = ["up","over","down"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2625 = new _1105();
         this._2625.left = 0;
         this._2625.right = 0;
         this._2625.bottom = 0;
         this._2625.top = 0;
         this.addElement(this._2625);
         this._2627 = new _1105();
         this._2627.left = 0;
         this._2627.right = 0;
         this._2627.bottom = 0;
         this._2627.top = 0;
         this.addElement(this._2627);
         this._2626 = new _1105();
         this._2626.left = 0;
         this._2626.right = 0;
         this._2626.bottom = 0;
         this._2626.top = 0;
         this.addElement(this._2626);
      }
      
      override protected function _2519() : void
      {
         switch(_2080)
         {
            case "up":
               this._2625.visible = true;
               this._2626.visible = this._2627.visible = false;
               break;
            case "over":
               this._2627.visible = true;
               this._2626.visible = this._2625.visible = false;
               break;
            case "down":
               this._2626.visible = true;
               this._2627.visible = this._2625.visible = false;
         }
      }
   }
}

