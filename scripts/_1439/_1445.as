package _1439
{
   import _1045._1084;
   import _1045._1105;
   import egret.core._1110;
   
   public class _1445 extends _1084
   {
      private var _6466:Class;
      
      private var _10026:Class;
      
      private var _10025:_1110;
      
      private var _6469:Class;
      
      private var _10030:Class;
      
      private var _10029:_1110;
      
      private var _6467:Class;
      
      private var _10028:Class;
      
      private var _10027:_1110;
      
      private var icon:_1105;
      
      public function _1445()
      {
         this._6466 = _1445__6466;
         this._10026 = _1445__10026;
         this._10025 = new _1110(this._6466,this._10026);
         this._6469 = _1445__6469;
         this._10030 = _1445__10030;
         this._10029 = new _1110(this._6469,this._10030);
         this._6467 = _1445__6467;
         this._10028 = _1445__10028;
         this._10027 = new _1110(this._6467,this._10028);
         super();
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.icon = new _1105();
         this.icon.x = 4;
         this.icon.y = 2;
         this.addElement(this.icon);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "up" || _2080 == "disabled")
         {
            this.icon.source = this._10025;
         }
         else if(_2080 == "over")
         {
            this.icon.source = this._10027;
         }
         else if(_2080 == "down")
         {
            this.icon.source = this._10029;
         }
      }
   }
}

