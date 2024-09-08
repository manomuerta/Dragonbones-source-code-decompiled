package _834
{
   import _1045.Scroller;
   import _1045._1082;
   import _1045._1084;
   import _1374._1387;
   import egret.core._1139;
   
   public class _840 extends _1084
   {
      public var _2491:Scroller;
      
      public var _2577:_1387;
      
      private var _2558:_1082;
      
      public function _840()
      {
         super();
         this.states = ["normal","disabled","normalWithPrompt","disabledWithPrompt"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2558 = new _1082();
         this._2558.fillColor = 1909801;
         this._2558.percentWidth = 100;
         this._2558.percentHeight = 100;
         addElement(this._2558);
         this._2577 = new _1387();
         this._2577._6245 = 15;
         this._2577._6244 = 10;
         this._2491 = new Scroller();
         this._2491.left = 0;
         this._2491.top = 0;
         this._2491.right = 0;
         this._2491.bottom = 0;
         this._2491._6243 = 1;
         this._2491.viewport = this._2577;
         this._2491._6052 = _1139.OFF;
         addElement(this._2491);
      }
   }
}

