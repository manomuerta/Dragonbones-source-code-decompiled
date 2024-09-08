package _127
{
   import _1033._12502;
   import _1045.Group;
   import _1045.Label;
   import _1185._1197;
   import _1374.Window;
   import _1467._1469;
   import _97._125;
   import egret.utils.SystemInfo;
   
   public class _171 extends Window
   {
      protected var _2512:Group;
      
      protected var _2632:Group;
      
      public var _2633:Label;
      
      public function _171()
      {
         this._2512 = _125._2402(new _1197());
         this._2632 = _125._12512();
         this._2633 = _125._2409();
         super();
         this.width = 525;
         if(SystemInfo.isMacOS)
         {
            this.skinName = _1469;
         }
         else
         {
            this.skinName = _12502;
         }
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.addElement(this._2512);
         closeButton.visible = false;
         _2631.visible = false;
         _2630.visible = false;
      }
   }
}

