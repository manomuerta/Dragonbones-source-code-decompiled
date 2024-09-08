package _127
{
   import _1045.Group;
   import _1045._1082;
   import _1045._1084;
   import _1045._1086;
   import _1374.IconButton;
   import _872._11267;
   import _97._125;
   import egret.utils.tr;
   
   public class _141 extends _1084
   {
      public static const LA:uint = 24;
      
      public static const LB:uint = 60;
      
      public static const RA:uint = 40;
      
      public var _2527:Group;
      
      public var _2440:Group;
      
      public var _2526:_11267;
      
      public var _11290:_1086;
      
      public var removeBtn:IconButton;
      
      public var _11289:_1082;
      
      public function _141()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:_1086 = null;
         super._2438();
         _loc1_ = new _1086();
         _loc1_.width = 9;
         this._2526 = new _11267();
         this._2526.width = LA + LB - _loc1_.width;
         this._2526.skinName = _139;
         this._11290 = new _1086();
         this._11290.percentWidth = 100;
         this.removeBtn = new IconButton();
         this.removeBtn.icon = "/assets/button/delAnimation.png";
         this.removeBtn.toolTip = tr("ScenePanel.removeBtn.tooltip");
         this._2527 = _125._2398(0);
         this._2527.height = _125._2411;
         this._2527.percentWidth = 100;
         this._2527.addElement(_loc1_);
         this._2527.addElement(this._2526);
         this._2527.addElement(this._11290);
         this._2527.addElement(this.removeBtn);
         this._11289 = new _1082();
         this._11289.height = this._2527.height;
         this._11289.percentWidth = 100;
         this._11289.fillColor = 3884883;
         this._2440 = new Group();
         this._2440.top = this._2527.height + 0;
         this._2440.bottom = 0;
         this._2440.percentWidth = 100;
         this.addElement(this._2440);
         this.addElement(this._11289);
         this.addElement(this._2527);
      }
   }
}

