package _1439
{
   import _1045._1084;
   import _1045._1105;
   import egret.core._1110;
   
   public class _1453 extends _1084
   {
      private var _10034:Class;
      
      private var _10033:Class;
      
      private var _7008:_1105;
      
      public function _1453()
      {
         this._10034 = _1453__10034;
         this._10033 = _1453__10033;
         super();
         this.width = 37;
         this.height = 1;
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._7008 = new _1105();
         this._7008.source = new _1110(this._10034,this._10033);
         this._7008.y = -6;
         this.addElement(this._7008);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         switch(_2080)
         {
            case "up":
               this._7008.alpha = 1;
               break;
            case "over":
               this._7008.alpha = 1;
               break;
            case "down":
               this._7008.alpha = 1;
               break;
            case "disabled":
               this._7008.alpha = 0.5;
         }
      }
   }
}

