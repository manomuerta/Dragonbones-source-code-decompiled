package _924
{
   import _1045.Scroller;
   import _1045._1046;
   import _1045._1084;
   import _1045._1105;
   import _1088.ItemRenderer;
   import _1185._1188;
   import _1185._1197;
   import _1477._1257;
   import egret.core._1139;
   
   public class _12480 extends _1084
   {
      public var _2491:Scroller;
      
      public var _2490:_1046;
      
      private var bg:_1105;
      
      public function _12480()
      {
         super();
         this.states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         this.bg = new _1105();
         addElement(this.bg);
         this._2491 = new Scroller();
         this._2491.left = this._2491.top = this._2491.bottom = 0;
         this._2491.right = 0;
         this._2491._6243 = 0;
         this._2491.skinName = _1257;
         this._2491.percentHeight = 100;
         this.addElement(this._2491);
         this._2490 = new _1046();
         this._2490.itemRenderer = ItemRenderer;
         this._2490.left = 1;
         this._2490.right = 2;
         this._2490.top = 1;
         this._2490.bottom = 1;
         this._2491.viewport = this._2490;
         this._2491._6052 = _1139.OFF;
         this.addElement(this._2491);
         var _loc1_:_1197 = new _1197();
         _loc1_._2401 = _1188.CONTENT_JUSTIFY;
         _loc1_.gap = 0;
         this._2490.layout = _loc1_;
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this.bg.graphics.clear();
         this.bg.graphics.beginFill(0,0);
         this.bg.graphics.lineStyle(0,3753298);
         this.bg.graphics.drawRect(0,0,param1 - 1,param2);
         this.bg.graphics.endFill();
      }
   }
}

