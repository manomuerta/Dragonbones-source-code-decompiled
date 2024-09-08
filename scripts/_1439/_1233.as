package _1439
{
   import _1045._1084;
   import _1045._1105;
   import egret.core._1110;
   import flash.geom.Rectangle;
   
   public class _1233 extends _1084
   {
      private var _10021:Class;
      
      private var _10020:Class;
      
      private var _10005:Class;
      
      private var _10006:Class;
      
      private var _10003:Class;
      
      private var _2530:_1105;
      
      private var _10032:_1105;
      
      public function _1233()
      {
         this._10021 = _1233__10021;
         this._10020 = _1233__10020;
         this._10005 = _1233__10005;
         this._10006 = _1233__10006;
         this._10003 = _1233__10003;
         super();
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2530 = new _1105();
         this._2530.top = this._2530.bottom = this._2530.left = this._2530.right = 0;
         this._2530.source = this._10003;
         this._2530.scale9Grid = new Rectangle(2,2,1,1);
         this.addElement(this._2530);
         this._10032 = new _1105();
         this._10032.right = 6;
         this._10032.verticalCenter = 0;
         this._10032.source = new _1110(this._10021,this._10020);
         this.addElement(this._10032);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         switch(_2080)
         {
            case "up":
               this._2530.source = this._10003;
               break;
            case "over":
               this._2530.source = this._10005;
               break;
            case "down":
               this._2530.source = this._10006;
               break;
            case "disabled":
               this._2530.source = this._10003;
         }
      }
   }
}

