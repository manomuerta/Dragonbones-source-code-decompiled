package _965
{
   import _1374.IconButton;
   import _978.Timeline;
   import _978._981;
   import egret.utils.tr;
   
   public class _964 extends _973
   {
      public var _6798:IconButton;
      
      public var _4590:IconButton;
      
      public function _964()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6798 = new IconButton();
         this._4590 = new IconButton();
         _4552.itemRenderer = _981;
         this._6798.icon = Timeline.ADD_LAYER_IOCN;
         this._6798.toolTip = tr("Timeline.basic.addLayer");
         this._6798.y = Timeline.LABEL_HEIGHT - 30;
         this._6798.x = 10;
         this._4590.icon = Timeline.DEL_LAYER_ICON;
         this._4590.toolTip = tr("Timeline.basic.delLayer");
         this._4590.x = 35;
         this._4590.y = Timeline.LABEL_HEIGHT - 30;
      }
   }
}

