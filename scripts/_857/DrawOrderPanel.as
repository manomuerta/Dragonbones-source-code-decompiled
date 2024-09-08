package _857
{
   import _1038._1039;
   import _1045.Group;
   import _1185._1189;
   import _127._10546;
   import _127._14049;
   import _127._156;
   import _127._163;
   import _1374.IconButton;
   import _24._26;
   import _639.HotkeysModel;
   import _668._669;
   import _676._700;
   import _978.TimelinePanel;
   import egret.utils.tr;
   
   public class DrawOrderPanel extends _156
   {
      public static const UP_ICON:String = "/assets/button/arrow_up.png";
      
      public static const DOWN_ICON:String = "/assets/button/arrow_down.png";
      
      public static const NORMAL_ICON:String = "/assets/button/empty.png";
      
      public var tree:_163;
      
      public var upBtn:IconButton;
      
      public var downBtn:IconButton;
      
      public var _4667:IconButton;
      
      private var _4120:_669;
      
      public var _10589:_10546;
      
      public function DrawOrderPanel()
      {
         this.tree = new _163();
         this.upBtn = new IconButton();
         this.downBtn = new IconButton();
         this._4667 = new IconButton();
         this._10589 = new _10546();
         super();
         this.title = tr("DrawOrderPanel.Title");
         this.icon = "/assets/panel/layer.png";
         this.tree._2606 = this._10589;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:HotkeysModel = null;
         super._2438();
         _loc1_ = HotkeysModel.getInstance();
         this.tree.itemRenderer = _14049;
         this.tree._3854 = true;
         this.tree.percentWidth = 100;
         this.tree.percentHeight = 100;
         this.tree.doubleClickEnabled = true;
         this.tree._5987 = "name";
         this.tree.iconFunction = this.iconFunction;
         this.tree._6033 = true;
         this.tree._6031 = true;
         this.tree._4500 = this._4500;
         this.tree._3576 = this._3576;
         addElement(this.tree);
         this._5572();
         var _loc2_:Group = new Group();
         _loc2_.layout = new _1189();
         this._4667.icon = TimelinePanel.ADD_KEY_WHITE;
         this._4667.toolTip = tr("Timeline.addZOrderKey.tooltip");
         this._4667.enabled = false;
         this.upBtn.icon = "/assets/button/bringForward.png";
         this.downBtn.icon = "/assets/button/sendBackward.png";
         this.upBtn.toolTip = tr("DrawOrderPanel.upBtn.tooltip",_loc1_._11726(_26.BRING_FORWARD));
         this.downBtn.toolTip = tr("DrawOrderPanel.downBtn.tooltip",_loc1_._11726(_26.SEND_BACKWARD));
         _loc2_.addElement(this._4667);
         _loc2_.addElement(this.upBtn);
         _loc2_.addElement(this.downBtn);
         _2527.addElement(_loc2_);
      }
      
      private function iconFunction(param1:Object) : String
      {
         var _loc2_:int = 0;
         if(this._4120)
         {
            _loc2_ = this._4120._1987(param1 as _700);
            switch(_loc2_)
            {
               case 0:
                  return NORMAL_ICON;
               case 1:
                  return DOWN_ICON;
               case -1:
                  return UP_ICON;
            }
         }
         return NORMAL_ICON;
      }
      
      private function _4500(param1:Array) : Boolean
      {
         return true;
      }
      
      private function _3576(param1:Object, param2:Array) : Boolean
      {
         return false;
      }
      
      private function _5572() : void
      {
         if(this.tree)
         {
            this.tree.dataProvider = !!this._4120 ? this._4120._3997 : null;
         }
      }
      
      public function _4127(param1:Vector.<Object>) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in param1)
         {
            this.tree._4550(_loc2_);
         }
         this.tree._2889 = param1;
      }
      
      public function set _4122(param1:_669) : void
      {
         this._4120 = param1;
         this._5572();
      }
   }
}

