package _1033
{
   import _1045.Button;
   import _1045.Group;
   import _1045._1084;
   import _1045._1105;
   import _1529._1528;
   import _1529._1530;
   import egret.utils.SystemInfo;
   import flash.geom.Rectangle;
   
   public class _12501 extends _1084
   {
      public static var _12886:Class = _12501__12886;
      
      public static var _12885:Class = _12501__12885;
      
      protected var _12893:Class;
      
      public var background:_1105;
      
      public var closeButton:Button;
      
      public var _2440:Group;
      
      public var _2527:Group;
      
      public function _12501()
      {
         this._12893 = _12501__12893;
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.background = new _1105();
         this.background.source = this._12893;
         this.background.scale9Grid = new Rectangle(40,500,500,330);
         this.background.left = 0;
         this.background.right = 0;
         this.background.top = 0;
         this.background.bottom = 0;
         this.addElement(this.background);
         this._2527 = new Group();
         this._2527.setStyle("textColor",16777215);
         this._2527.setStyle("size",_1528.language == _1530.zh_CN ? 18 : 17);
         if(!SystemInfo.isMacOS && _1528.language == _1530.zh_CN)
         {
            this._2527.setStyle("fontFamily","微软雅黑");
         }
         this._2527.left = this._2527.right = 0;
         this.addElement(this._2527);
         this._2440 = new Group();
         this._2440.clipAndEnableScrolling = true;
         this._2440.top = 340;
         this._2440.left = 40;
         this._2440.right = 40;
         this._2440.bottom = 40;
         this.addElement(this._2440);
         this.closeButton = new Button();
         this.closeButton.skinName = _12915;
         this.closeButton.right = 0;
         this.closeButton.top = 100;
         this.addElement(this.closeButton);
      }
   }
}

