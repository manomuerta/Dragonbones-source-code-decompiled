package _14097
{
   import _127._166;
   import _1374.IconButton;
   import egret.utils.tr;
   
   public class _14099 extends _166
   {
      public var _6366:IconButton;
      
      public function _14099()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6366 = new IconButton();
         this._6366.width = 22;
         this._6366.height = 22;
         this._6366.icon = "assets/button/importImage.png";
         this._6366.toolTip = tr("LibraryPanel.import.tip");
         this._6366.left = 200;
         this.addElement(this._6366);
      }
   }
}

