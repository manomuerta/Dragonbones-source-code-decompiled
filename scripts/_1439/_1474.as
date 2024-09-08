package _1439
{
   import _1045.Group;
   import _1045._1084;
   import _1045._1105;
   import egret.core._1110;
   
   public class _1474 extends _1084
   {
      private var _6466:Class;
      
      private var _6467:Class;
      
      private var _6469:Class;
      
      private var _10053:Class;
      
      private var _10052:Class;
      
      private var group:Group;
      
      private var _5251:_1105;
      
      private var icon:_1105;
      
      public function _1474()
      {
         this._6466 = _1474__6466;
         this._6467 = _1474__6467;
         this._6469 = _1474__6469;
         this._10053 = _1474__10053;
         this._10052 = _1474__10052;
         super();
         this.states = ["up","over","down","disabled"];
         this.minHeight = 17;
         this.minWidth = 17;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.group = new Group();
         this.group.percentHeight = 100;
         this.group.percentWidth = 100;
         this.group.alpha = 1;
         this.addElement(this.group);
         this._5251 = new _1105();
         this._5251.top = this._5251.left = this._5251.right = this._5251.bottom = 0;
         this._5251.source = this._6466;
         this.group.addElement(this._5251);
         this.icon = new _1105();
         this.icon.verticalCenter = 0;
         this.icon.horizontalCenter = 0;
         this.icon.source = new _1110(this._10053,this._10052);
         this.group.addElement(this.icon);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "disabled")
         {
            this.group.alpha = 0.5;
         }
         else
         {
            this.group.alpha = 1;
         }
         if(_2080 == "disabled" || _2080 == "up")
         {
            this._5251.source = this._6466;
         }
         else if(_2080 == "over")
         {
            this._5251.source = this._6467;
         }
         else if(_2080 == "down")
         {
            this._5251.source = this._6469;
         }
      }
   }
}

