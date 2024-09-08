package _870
{
   import _1045.Group;
   import _127._166;
   import _1374.IconButton;
   import _741._750;
   import _97._125;
   import egret.utils.tr;
   
   public class _869 extends _166
   {
      public var _6364:IconButton;
      
      public var _6366:IconButton;
      
      public var _4203:IconButton;
      
      public var _2513:Group;
      
      public function _869()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6364 = new IconButton();
         this._6364.width = 22;
         this._6364.height = 22;
         this._6364.icon = "/assets/button/library_change.png";
         this._6364.toolTip = tr("LibraryPanel.changePath.tip");
         this._6366 = new IconButton();
         this._6366.width = 22;
         this._6366.height = 22;
         this._6366.icon = "assets/button/importImage.png";
         this._6366.toolTip = tr("LibraryPanel.import.tip");
         this._4203 = new IconButton();
         this._4203.width = 22;
         this._4203.height = 22;
         this._4203.icon = "/assets/button/folderOpen.png";
         this._4203.toolTip = tr("LibraryPanel.open.tip");
         this._2513 = _125._2414(2);
         this._2513.addElement(this._6366);
         this._2513.addElement(this._4203);
         this._2513.addElement(this._6364);
         if(_750._14739)
         {
            this._6366.enabled = false;
            this._4203.enabled = false;
            this._6364.enabled = false;
         }
         this._2513.right = 2;
         this.addElement(this._2513);
      }
   }
}

