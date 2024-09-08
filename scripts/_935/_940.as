package _935
{
   import _1045.Group;
   import _708._716;
   import _953._10624;
   import _953._962;
   import _97._125;
   import egret.utils.tr;
   
   public class _940 extends _938
   {
      protected static var _6690:String = "/assets/button/pivot.png";
      
      public var _10765:_10624;
      
      private var g:Group;
      
      public function _940()
      {
         super();
         _6679 = _962;
         _6685.source = [{
            "icon":_6681,
            "toolTip":tr("StagePanel.SelectTool_tooltip"),
            "data":_716.SELECT,
            "enabled":true
         },{
            "icon":_6690,
            "toolTip":tr("StagePanel.PivotTool_tooltip"),
            "data":_716.PIVOT,
            "enabled":true
         }];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._10765 = new _10624();
         this.g = _125._2397();
         this.g.bottom = 5;
         this.g.left = gap;
         this.g.percentWidth = 100;
         addElement(this.g);
         this.g.addElement(this._10765);
      }
      
      override public function _14625(param1:int) : void
      {
         super._14625(param1);
         this.g.left = param1;
      }
   }
}

