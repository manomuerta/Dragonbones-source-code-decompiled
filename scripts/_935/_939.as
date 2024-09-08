package _935
{
   import _1374.IconButton;
   import _953._961;
   import egret.utils.tr;
   
   public class _939 extends _938
   {
      public var _6689:IconButton;
      
      public function _939()
      {
         super();
         _6679 = _961;
         _6685.source = [];
      }
      
      override protected function _6686() : void
      {
         super._6686();
         _4883.width = 75;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6689 = new IconButton();
         this._6689.icon = "assets/button/importImage.png";
         this._6689.toolTip = tr("LibraryPanel.import.tip");
         this._6689.left = gap;
         this._6689.top = gap;
      }
      
      override public function _14625(param1:int) : void
      {
         super._14625(param1);
         this._6689.left = param1;
         this._6689.top = param1;
      }
   }
}

