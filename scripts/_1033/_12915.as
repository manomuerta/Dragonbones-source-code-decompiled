package _1033
{
   import _1045._1084;
   import _1045._1105;
   
   public class _12915 extends _1084
   {
      protected var _13054:Class;
      
      public var _2448:_1105;
      
      public function _12915()
      {
         this._13054 = _12915__13054;
         super();
         this.states = ["up","over","down","disabled"];
         this.minHeight = this.minWidth = 24;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2448 = new _1105();
         this._2448.source = this._13054;
         this.addElement(this._2448);
      }
      
      override protected function _2519() : void
      {
         switch(_2080)
         {
            case "up":
               this._2448.alpha = 0.8;
               break;
            case "over":
               this._2448.alpha = 0.9;
               break;
            case "down":
               this._2448.alpha = 1;
               break;
            case "disabled":
               this._2448.alpha = 0.2;
         }
      }
   }
}

