package _13212
{
   import _1033._13223;
   import _1045.Group;
   import _1045.Label;
   import _1177.UIEvent;
   import _1185._1189;
   import _127._128;
   import _127._156;
   import _1374.IconButton;
   import _1374.TextInput;
   import _24._26;
   import _639.HotkeysModel;
   import _822._829;
   import _834._838;
   import _97._125;
   import egret.utils.tr;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.text.TextFormatAlign;
   
   public class SheetPanel extends _156
   {
      private var _13430:Group;
      
      public var _4758:_829;
      
      public var _4722:IconButton;
      
      public var _4721:IconButton;
      
      public var _4719:IconButton;
      
      public var _4727:IconButton;
      
      public var _13318:IconButton;
      
      public var _13302:IconButton;
      
      public var _13300:_829;
      
      public var _13293:_829;
      
      public var _4197:IconButton;
      
      public var _6990:Label;
      
      public var _4730:Label;
      
      public var _13434:Label;
      
      public var _6502:TextInput;
      
      public var _13431:Label;
      
      public var _13317:TextInput;
      
      public var _13323:_128;
      
      public var _13289:_128;
      
      public var _13435:Label;
      
      public var _13324:_13213;
      
      public function SheetPanel()
      {
         this._4758 = new _829();
         this._4722 = new IconButton();
         this._4721 = new IconButton();
         this._4719 = new IconButton();
         this._4727 = new IconButton();
         this._13318 = new IconButton();
         this._13302 = new IconButton();
         this._13300 = new _829();
         this._13293 = new _829();
         this._4197 = new IconButton();
         this._13317 = new TextInput();
         super();
         this.title = tr("Sheet.panel.title");
         this.icon = "/assets/panel/timeline.png";
      }
      
      override protected function _2438() : void
      {
         var _loc1_:HotkeysModel = null;
         var _loc2_:Group = null;
         super._2438();
         _loc1_ = HotkeysModel.getInstance();
         this._13318.icon = "/assets/frames/sortUp.png";
         this._13302.icon = "/assets/frames/sortDown.png";
         _loc2_ = _125._2414(2);
         _loc2_.addElement(this._13318);
         _loc2_.addElement(this._13302);
         this._13300.skinName = _838;
         this._13300.toolTip = tr("Sheet.onion.prev");
         this._13293.toolTip = tr("Sheet.onion.next");
         this._13300.data = {"icon":"/assets/frames/onionPrev"};
         this._13293.skinName = _838;
         this._13293.data = {"icon":"/assets/frames/onionNext"};
         this._4197 = new IconButton();
         this._4197.icon = "/assets/button/delAnimation.png";
         this._4197.toolTip = tr("ScenePanel.removeBtn.tooltip");
         var _loc3_:Group = _125._2414(2);
         _loc3_.addElement(this._13300);
         _loc3_.addElement(this._13293);
         _loc3_.addElement(this._4197);
         this._4758.skinName = _838;
         this._4758.data = {"icon":"/assets/timeline/timeline_play"};
         this._4758.toolTip = tr("Timeline.play.tooltip",_loc1_._11726(_26.PLAY));
         this._4722.icon = "/assets/timeline/timeline_nextFrame.png";
         this._4722.toolTip = tr("Timeline.nextFrame.tooltip",_loc1_._11726(_26.NEXT_FRAME));
         this._4721.icon = "/assets/timeline/timeline_prevFrame.png";
         this._4721.toolTip = tr("Timeline.prevFrame.tooltip",_loc1_._11726(_26.PREV_FRAME));
         this._4719.icon = "/assets/timeline/timeline_1stFrame.png";
         this._4719.toolTip = tr("Timeline.1stFrame.tooltip");
         this._4727.icon = "/assets/timeline/timeline_lastFrame.png";
         this._4727.toolTip = tr("Timeline.lastFrame.tooltip");
         var _loc4_:Group;
         (_loc4_ = _125._2414(2)).percentHeight = 100;
         _loc4_.addElement(this._4719);
         _loc4_.addElement(this._4721);
         _loc4_.addElement(this._4758);
         _loc4_.addElement(this._4722);
         _loc4_.addElement(this._4727);
         this._13430 = new Group();
         this._13430.percentHeight = 100;
         var _loc5_:_1189;
         (_loc5_ = new _1189()).gap = 2;
         _loc5_.verticalAlign = "middle";
         this._13430.layout = _loc5_;
         this._6990 = new Label();
         this._6990.text = tr("Sheet.frame.current");
         this._4730 = new Label();
         this._4730.setStyle("textAlign",TextFormatAlign.CENTER);
         this._4730.text = tr("1000/2000");
         this._4730.width = 60;
         this._13434 = new Label();
         this._13434.text = tr("Sheet.frame.rate");
         this._6502 = new TextInput();
         this._6502.setStyle("textAlign",TextFormatAlign.CENTER);
         this._6502.text = tr("90");
         this._6502.restrict = "0-9";
         this._6502.maxChars = 2;
         this._6502.width = 50;
         this._13431 = new Label();
         this._13431.text = tr("Sheet.anim.time");
         this._13317 = new TextInput();
         this._13317.setStyle("textAlign",TextFormatAlign.CENTER);
         this._13317.text = tr("90");
         this._13317.restrict = "0-9";
         this._13317.maxChars = 2;
         this._13317.width = 50;
         this._13323 = new _128();
         this._13323.label = tr("Sheet.anim.loop");
         this._13289 = new _128();
         this._13289.label = tr("Sheet.showframe");
         this._13430.addElement(this._6990);
         this._13430.addElement(this._4730);
         this._13430.addElement(this._13434);
         this._13430.addElement(this._6502);
         this._13430.addElement(this._13431);
         this._13430.addElement(this._13317);
         this._13430.addElement(this._13323);
         this._13430.addElement(this._13289);
         var _loc6_:int = 20;
         _2527.addElement(_loc2_);
         _2527.addElement(new _13223(_loc6_));
         _2527.addElement(_loc3_);
         _2527.addElement(new _13223(_loc6_));
         _2527.addElement(_loc4_);
         _2527.addElement(new _13223(_loc6_));
         _2527.addElement(this._13430);
         _2527.addElement(new _13223(_loc6_));
         this._13324 = new _13213();
         this._13324._3854 = true;
         this._13324.itemRenderer = _13215;
         this._13324.percentHeight = 100;
         this._13324.percentWidth = 100;
         this._13324._6055 = false;
         addElement(this._13324);
         this._13435 = new Label();
         this._13435.text = tr("Sheet.first.tip");
         this._13435.alpha = 0.5;
         this._13435.size = 42;
         this._13435.x = 10;
         this._13435.y = 10;
         addElement(this._13435);
         this._13324.addEventListener(UIEvent.UPDATE_COMPLETE,this._13433);
         this._13323.addEventListener(Event.CHANGE,this._13432);
      }
      
      private function _13432(param1:Event) : void
      {
         this._13317.enabled = !this._13323.selected;
      }
      
      private function _13433(param1:UIEvent) : void
      {
         this._13435.visible = !(this._13324.dataProvider && this._13324.dataProvider.length > 0);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         if(this._13435 != null && this._13435.textWidth > 0)
         {
            this._13435.x = (param1 - this._13435.textWidth) / 2;
            this._13435.y = (param2 - this._13435.textHeight) / 2;
         }
      }
      
      override public function contains(param1:DisplayObject) : Boolean
      {
         var _loc2_:Boolean = super.contains(param1);
         if(!_loc2_)
         {
            if(this._6502.contains(param1) || this._13317.contains(param1))
            {
               return true;
            }
         }
         return _loc2_;
      }
   }
}

