package _1439
{
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   import egret.core._1110;
   
   public class _1229 extends _1084
   {
      private var _10021:Class;
      
      private var _10020:Class;
      
      private var arrow:_1105;
      
      private var _2530:_1082;
      
      public function _1229()
      {
         this._10021 = _1229__10021;
         this._10020 = _1229__10020;
         super();
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2530 = new _1082();
         this._2530.top = this._2530.bottom = this._2530.left = this._2530.right = 0;
         this.addElement(this._2530);
         this.arrow = new _1105();
         this.arrow.horizontalCenter = this.arrow.verticalCenter = 0;
         this.arrow.source = new _1110(this._10021,this._10020);
         this.addElement(this.arrow);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         switch(_2080)
         {
            case "up":
               this._2530.fillColor = 2041131;
               break;
            case "over":
               this._2530.fillColor = 3687504;
               break;
            case "down":
               this._2530.fillColor = 1382686;
               break;
            case "disabled":
               this._2530.fillColor = 2041131;
         }
      }
   }
}

