package _924
{
   import _1045.Group;
   import _1045._1082;
   import _1045._1084;
   import _1045._1086;
   import _1374.IconButton;
   import _872._11267;
   import _97._125;
   import egret.utils.tr;
   
   public class _12482 extends _1084
   {
      public var _2527:Group;
      
      public var _2440:Group;
      
      public var _2526:_11267;
      
      public var _11290:_1086;
      
      public var removeBtn:IconButton;
      
      public var _11289:_1082;
      
      public function _12482()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2526 = new _11267();
         this._2526.percentWidth = 100;
         this._2526.skinName = _12481;
         this._11290 = new _1086();
         this._11290.percentWidth = 100;
         this.removeBtn = new IconButton();
         this.removeBtn.icon = "/assets/button/delAnimation.png";
         this.removeBtn.toolTip = tr("ScenePanel.removeBtn.tooltip");
         this._2527 = _125._2398(0);
         this._2527.height = _125._2411;
         this._2527.percentWidth = 100;
         this._2527.addElement(this._2526);
         this._11289 = new _1082();
         this._2440 = new Group();
         this._2440.top = this._2527.height + 0;
         this._2440.bottom = 0;
         this._2440.percentWidth = 100;
         this.addElement(this._2440);
         this.addElement(this._2527);
      }
   }
}

