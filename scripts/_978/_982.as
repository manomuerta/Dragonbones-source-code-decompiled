package _978
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1069;
   import _1045._1072;
   import _1045._1082;
   import _1088.TreeItemRenderer;
   import _1177.ListEvent;
   import _1177.TreeEvent;
   import _1177.UIEvent;
   import _1185._1186;
   import _1185._1189;
   import _13505._13504;
   import _13505._13507;
   import _13505._13508;
   import _13505._13510;
   import _13505._14035;
   import _13545._13544;
   import _13545._13548;
   import _51._50;
   import _521._532;
   import _521._535;
   import _636.TimelineEvent;
   import _676._675;
   import _822._10262;
   import _834._836;
   import _965._977;
   import _97._100;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _982 extends Group implements _1072, _1069
   {
      public static var _10545:Boolean;
      
      public static var _10543:Boolean;
      
      public static var _10542:Boolean;
      
      public const ICON_ANIMATION:String = "/assets/panelIcon/animation.png";
      
      public const _6669:String = "/assets/panelIcon/bone.png";
      
      public const ICON_SLOT:String = "/assets/panelIcon/slot.png";
      
      public const ICON_FFD:String = "/assets/panelIcon/mesh.png";
      
      public const ICON_EVENT:String = "/assets/panelIcon/event.png";
      
      public const ICON_ZORDER:String = "/assets/panelIcon/zOrder.png";
      
      public const ICON_COLOR:String = "/assets/panelIcon/color.png";
      
      public const ICON_DISPLAY:String = "/assets/panelIcon/index.png";
      
      public const _10860:String = "/assets/button/translate.png";
      
      public const ICON_ROTATE:String = "/assets/button/rotate.png";
      
      public const _10810:String = "/assets/button/scale.png";
      
      public const ICON_IK:String = "/assets/panelIcon/bone_IK.png";
      
      public var _6928:TreeItemRenderer;
      
      protected var _6943:_10262;
      
      protected var _6941:_10262;
      
      private var _6940:_985;
      
      private var _6938:_1082;
      
      private var _6939:_1082;
      
      private var _2558:_1082;
      
      private var _6931:Object;
      
      private var _6942:int;
      
      private var _6932:Boolean;
      
      private var _6620:Boolean;
      
      private var _selected:Boolean;
      
      private var _2540:int;
      
      private var _2541:String;
      
      protected var _data:Object;
      
      protected var _3670:Object;
      
      public function _982()
      {
         super();
         this.height = Timeline.FRAME_HEIGHT;
         percentWidth = 100;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         var _loc2_:_13548 = null;
         var _loc3_:_13544 = null;
         this._data = param1;
         this._6928.data = this._data;
         this._6928.opened = this._6620;
         this._6928.depth = this.depth - 1;
         this.selected = false;
         this._6943.visible = true;
         this._6941.visible = true;
         this._6943.selected = this.data.visible;
         this._6941.selected = this.data.locked;
         this._6928.enabled = true;
         _loc2_ = this._data as _13548;
         if(!(this._data is _13544))
         {
            this.selected = this._data["selected"];
            this._6938.visible = this.selected;
            this._6928._4521 = this._data.children.length > 0;
            this._6928.mouseChildren = true;
            this._6928.mouseEnabled = true;
            this._6943.data = {"icon":"/assets/panelIcon/eye"};
            this._6941.data = {"icon":"/assets/panelIcon/lock"};
         }
         if(this._data is _13544)
         {
            this.selected = false;
            this._6938.visible = this.selected;
            this._6928.label = _loc3_._1992.name;
            this._6928._5988 = this.ICON_ANIMATION;
            _loc3_ = this._data as _13544;
            _loc3_._13839();
            this._6940.dataProvider = _loc3_.frames;
            this._6928._4521 = false;
            this._6928.mouseChildren = false;
            this._6928.mouseEnabled = false;
            this._6943.data = {"icon":"/assets/panelIcon/eye2"};
            this._6941.data = {"icon":"/assets/panelIcon/lock2"};
            this._2558.fillColor = _100.ANIMATION_TIMELINE_BG_COLOR;
            this._3670 = _loc3_._1992.rootArmatureData;
            if(Boolean(this.owner) && this.owner is _979)
            {
               if(!(this.owner as _979).hasEventListener(TimelineEvent.SHOW_ALL))
               {
                  (this.owner as _979).addEventListener(TimelineEvent.SHOW_ALL,this._4535);
               }
            }
         }
         else
         {
            this.selected = false;
            if(_loc2_)
            {
               _loc2_.opened = this._6620;
               this._6928.label = this._14002(_loc2_);
               this._6928._5988 = this._14003(_loc2_._1945);
               _loc2_._13839();
               this._6940.dataProvider = _loc2_.frames;
               this._6940.visible = _loc2_.frames.length > 0;
            }
         }
         if(_loc2_)
         {
            switch(_loc2_._1945.flag)
            {
               case _13510.FLAG_ANIMATION:
                  this._2558.fillColor = _100.ANIMATION_TIMELINE_BG_COLOR;
                  break;
               case _13510.FLAG_BONE:
               case _13510.FLAG_TRANSLATE:
               case _13510.FLAG_ROTATE:
               case _13510.FLAG_SCALE:
                  this._2558.fillColor = _100.BONE_TIMELINE_BG_COLOR;
                  break;
               case _13510.FLAG_SLOT:
               case _13510.FLAG_COLOR:
               case _13510.FLAG_DISPLAY_INDEX:
               case _13510.FLAG_VISIBLE:
                  this._2558.fillColor = _100.SLOT_TIMELINE_BG_COLOR;
                  break;
               case _13510.FLAG_FFD:
                  this._2558.fillColor = _100.FFD_TIMELINE_BG_COLOR;
                  break;
               case _13510.FLAG_EVENT:
                  this._2558.fillColor = _100.EVENT_TIMELINE_BG_COLOR;
                  break;
               case _13510.FLAG_ZORDER:
                  this._2558.fillColor = _100.ZORDER_TIMELINE_BG_COLOR;
                  break;
               case _13510.FLAG_IK:
                  this._2558.fillColor = _100.IK_TIMELINE_BG_COLOR;
                  break;
               default:
                  this._2558.fillColor = _100.SLOT_TIMELINE_BG_COLOR;
            }
            if(_loc2_._1945 is _13504)
            {
               this._3670 = (_loc2_._1945 as _13504)._1823;
            }
            else if(_loc2_._1945 is _13508)
            {
               this._3670 = (_loc2_._1945 as _13508)._1824;
            }
         }
         (this._6928.labelDisplay as Label)._6929();
         this._6845();
      }
      
      private function _14002(param1:_13548) : String
      {
         var _loc2_:_13510 = param1._1945;
         switch(_loc2_.flag)
         {
            case _13510.FLAG_BONE:
               return (_loc2_ as _13504).name;
            case _13510.FLAG_SLOT:
               return (_loc2_ as _13508).name;
            case _13510.FLAG_FFD:
               return (_loc2_ as _13507).name;
            case _13510.FLAG_ZORDER:
               return tr("Timeline.zOrder.timeline");
            case _13510.FLAG_EVENT:
               return tr("Timeline.event.timeline");
            case _13510.FLAG_TRANSLATE:
               return tr("Timeline.translate.timeline");
            case _13510.FLAG_ROTATE:
               return tr("Timeline.rotate.timeline");
            case _13510.FLAG_SCALE:
               return tr("Timeline.scale.timeline");
            case _13510.FLAG_COLOR:
               return tr("Timeline.color.timeline");
            case _13510.FLAG_DISPLAY_INDEX:
               return tr("Timeline.displayIndex.timeline");
            case _13510.FLAG_VISIBLE:
               return tr("Timeline.visible.timeline");
            case _13510.FLAG_IK:
               return (_loc2_ as _14035).name;
            default:
               return tr("Timeline.null.timeline");
         }
      }
      
      private function _14003(param1:_13510) : String
      {
         var _loc2_:String = this.ICON_ANIMATION;
         switch(param1.flag)
         {
            case _13510.FLAG_BONE:
               return this._6669;
            case _13510.FLAG_SLOT:
               return this.ICON_SLOT;
            case _13510.FLAG_ZORDER:
               return this.ICON_ZORDER;
            case _13510.FLAG_FFD:
               return this.ICON_FFD;
            case _13510.FLAG_EVENT:
               return this.ICON_EVENT;
            case _13510.FLAG_TRANSLATE:
               return this._10860;
            case _13510.FLAG_ROTATE:
               return this.ICON_ROTATE;
            case _13510.FLAG_SCALE:
               return this._10810;
            case _13510.FLAG_COLOR:
               return this.ICON_COLOR;
            case _13510.FLAG_DISPLAY_INDEX:
               return this.ICON_DISPLAY;
            case _13510.FLAG_IK:
               return this.ICON_IK;
            case _13510.FLAG_VISIBLE:
         }
         return this.ICON_ANIMATION;
      }
      
      private function _14001(param1:_13548) : Boolean
      {
         var _loc2_:_13510 = null;
         if(param1)
         {
            _loc2_ = param1._1945;
            switch(_loc2_.flag)
            {
               case _13510.FLAG_BONE:
               case _13510.FLAG_SLOT:
                  return true;
               case _13510.FLAG_FFD:
               case _13510.FLAG_ZORDER:
               case _13510.FLAG_EVENT:
               case _13510.FLAG_TRANSLATE:
               case _13510.FLAG_ROTATE:
               case _13510.FLAG_SCALE:
               case _13510.FLAG_COLOR:
               case _13510.FLAG_DISPLAY_INDEX:
               case _13510.FLAG_VISIBLE:
            }
            return false;
         }
         return false;
      }
      
      protected function _4535(param1:TimelineEvent) : void
      {
         var _loc3_:Object = null;
         var _loc2_:Array = param1.data as Array;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.type == "selectable")
            {
               if(_loc3_.value == 0)
               {
                  this.data.locked = !this.data.locked;
               }
               else if(_loc3_.value == 1)
               {
                  this.data.locked = true;
               }
               else
               {
                  this.data.locked = false;
               }
            }
            else if(_loc3_.type == "visible")
            {
               if(_loc3_.value == 0)
               {
                  this.data.visible = !this._6943.selected;
               }
               else if(_loc3_.value == 1)
               {
                  this.data.visible = true;
               }
               else
               {
                  this.data.visible = false;
               }
            }
         }
         this._6845();
      }
      
      public function _6890() : void
      {
         var _loc1_:_13548 = this._data as _13548;
         _loc1_._13839();
      }
      
      public function _6845() : void
      {
         var _loc1_:_13548 = this._data as _13548;
         var _loc2_:Boolean = this._14001(_loc1_);
         if(this._3670)
         {
            if(!(this._3670 is _50))
            {
               this.data.visible = _535.instance._3371(this._3670);
               this.data.locked = _532.instance._3367(this._3670,true);
            }
            this._6943.selected = this.data.visible;
            this._6941.selected = this.data.locked;
            this._6943.visible = _loc2_;
            this._6941.visible = _loc2_;
         }
         else
         {
            this._6943.visible = false;
            this._6941.visible = false;
         }
      }
      
      public function _13835() : void
      {
         var _loc1_:_13548 = this._data as _13548;
         this._6938.visible = _loc1_.selected;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6939 = new _1082();
         this._6939.fillColor = _100.OVER_BG_COLOR;
         this._6939.height = Timeline.FRAME_HEIGHT - 1;
         this._6939.width = Timeline.FRAME_NAME_WIDTH + Timeline.LABEL_GAP - 1;
         this._6938 = new _1082();
         this._6938.mouseChildren = this._6938.mouseEnabled = false;
         this._6938.fillColor = _100.HIGH_LIGHT_BG_COLOR;
         this._6938.height = Timeline.FRAME_HEIGHT - 1;
         this._6938.width = Timeline.FRAME_NAME_WIDTH;
         this._2558 = new _1082();
         this._2558.fillColor = _100.ANIMATION_TIMELINE_BG_COLOR;
         this._2558.height = Timeline.FRAME_HEIGHT - 1;
         this._2558.width = Timeline.FRAME_NAME_WIDTH;
         addElement(this._2558);
         addElement(this._6938);
         this._6939.visible = false;
         this._6938.visible = false;
         var _loc1_:Group = new Group();
         var _loc2_:_1189 = new _1189();
         _loc2_.gap = 0;
         _loc1_.layout = _loc2_;
         addElement(_loc1_);
         var _loc3_:_1189 = new _1189();
         _loc3_.gap = 0;
         var _loc4_:Group;
         (_loc4_ = new Group()).width = Timeline.FRAME_NAME_WIDTH;
         _loc4_.layout = _loc3_;
         _loc1_.addElement(_loc4_);
         var _loc5_:Group = new Group();
         _loc1_.addElement(_loc5_);
         this._6928 = new TreeItemRenderer();
         this._6928.addEventListener(UIEvent.CREATION_COMPLETE,this._6930);
         this._6928._6070 = 14;
         this._6928.skinName = _977;
         this._6928.height = Timeline.FRAME_HEIGHT;
         this._6928.percentHeight = 100;
         this._6928.width = Timeline.FRAME_NAME_WIDTH - 80;
         this._6943 = new _10262();
         this._6943.skinName = _836;
         this._6943.data = {"icon":"/assets/panelIcon/eye"};
         this._6943.addEventListener(MouseEvent.CLICK,this._6937);
         this._6928.addEventListener(TreeEvent.ITEM_OPENING,this._6792);
         this._6928.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this.onRightMouseDown);
         this._6941 = new _10262();
         this._6941.skinName = _836;
         this._6941.data = {"icon":"/assets/panelIcon/lock"};
         this._6941.addEventListener(MouseEvent.CLICK,this._6936);
         _loc4_.addElement(this._6928);
         _loc4_.addElement(this._6943);
         _loc4_.addElement(this._6941);
         this._6940 = new _985();
         this._6940.layout = new _1186();
         this._6940.percentWidth = 100;
         this._6940.itemRenderer = _986;
         this._6940.addEventListener(ListEvent.ITEM_ROLL_OUT,this._6935);
         this._6940.addEventListener(ListEvent.ITEM_ROLL_OVER,this._6935);
         _loc5_.addElement(this._6940);
         var _loc6_:_1082;
         (_loc6_ = new _1082()).fillColor = _100.LINE_BG_COLOR;
         _loc6_.height = 1;
         _loc6_.width = Timeline.FRAME_NAME_WIDTH - 1;
         _loc6_.y = Timeline.FRAME_HEIGHT - 1;
         addElement(_loc6_);
         this.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._11187);
         this._6943.addEventListener(MouseEvent.MOUSE_DOWN,this._10540);
         this._6941.addEventListener(MouseEvent.MOUSE_DOWN,this._10539);
         this.addEventListener(MouseEvent.MOUSE_MOVE,this._10541);
         if(this.stage)
         {
            this.stage.addEventListener(MouseEvent.MOUSE_UP,this._6869);
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this._9044);
         }
         addEventListener(Event.REMOVED_FROM_STAGE,this._10544);
      }
      
      private function _10541(param1:MouseEvent) : void
      {
         if(param1.buttonDown)
         {
            if(_10543)
            {
               if(this.data.locked != _10542)
               {
                  this.data.locked = _10542;
                  if(this.owner)
                  {
                     this.owner.dispatchEvent(new TimelineEvent(TimelineEvent.LOCK_CHANGE,this.data));
                  }
               }
            }
            else if(_10545)
            {
               if(this.data.visible != _10542)
               {
                  this.data.visible = _10542;
                  if(this.owner)
                  {
                     this.owner.dispatchEvent(new TimelineEvent(TimelineEvent.VISIBLE_CHANGE,this.data));
                  }
               }
            }
         }
      }
      
      private function _6869(param1:MouseEvent) : void
      {
         _10545 = false;
         _10543 = false;
      }
      
      private function _10544(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this._10544);
         if(!this.stage)
         {
         }
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this._6869);
      }
      
      private function _9044(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this._9044);
         if(this.stage)
         {
            this.stage.addEventListener(MouseEvent.MOUSE_UP,this._6869);
         }
      }
      
      private function _10539(param1:MouseEvent) : void
      {
         _10543 = true;
         _10542 = !this.data.locked;
         param1.stopImmediatePropagation();
      }
      
      private function _10540(param1:MouseEvent) : void
      {
         _10545 = true;
         _10542 = !this.data.visible;
         param1.stopImmediatePropagation();
      }
      
      private function _11187(param1:MouseEvent) : void
      {
         if(this.owner)
         {
            this.owner.dispatchEvent(new TimelineEvent(TimelineEvent.SELECT_TIMELINE,this.data));
         }
      }
      
      private function onRightMouseDown(param1:MouseEvent) : void
      {
         if(this.owner)
         {
            this.owner.dispatchEvent(new TimelineEvent(TimelineEvent.SELECT_TIMELINE,this.data));
         }
         var _loc2_:ListEvent = new ListEvent(ListEvent.ITEM_RIGHT_MOUSE_DOWN,true,false,param1.localX,param1.localY,this,false,false,false,true,0,0,this._data,this);
         dispatchEvent(_loc2_);
      }
      
      private function _4237(param1:MouseEvent) : void
      {
         this._6939.visible = false;
      }
      
      private function _4233(param1:MouseEvent) : void
      {
         if(this._6928.enabled)
         {
            this._6939.visible = true;
         }
      }
      
      private function _6930(param1:UIEvent) : void
      {
         this._6928.removeEventListener(UIEvent.CREATION_COMPLETE,this._6930);
         (this._6928.labelDisplay as Label).width = Timeline.FRAME_NAME_WIDTH - 135;
         (this._6928.labelDisplay as Label).height = 20;
      }
      
      private function _6936(param1:MouseEvent) : void
      {
         this.data.locked = !this.data.locked;
         if(this.owner)
         {
            this.owner.dispatchEvent(new TimelineEvent(TimelineEvent.LOCK_CHANGE,this.data));
         }
      }
      
      private function _6937(param1:MouseEvent) : void
      {
         this.data.visible = !this.data.visible;
         if(this.owner)
         {
            this.owner.dispatchEvent(new TimelineEvent(TimelineEvent.VISIBLE_CHANGE,this.data));
         }
      }
      
      private function _6933(param1:MouseEvent) : void
      {
         if(this.owner)
         {
            this.owner.dispatchEvent(new TimelineEvent(TimelineEvent.SELECT_TIMELINE,this.data));
         }
      }
      
      private function _6792(param1:TreeEvent) : void
      {
         if(!(this._data is _675))
         {
            dispatchEvent(param1);
         }
      }
      
      private function _6935(param1:ListEvent) : void
      {
         if(this.owner)
         {
            this.owner.dispatchEvent(param1);
         }
      }
      
      public function get _5988() : Object
      {
         return this._6931;
      }
      
      public function set _5988(param1:Object) : void
      {
         this._6931 = param1;
      }
      
      public function get depth() : int
      {
         return this._6942;
      }
      
      public function set depth(param1:int) : void
      {
         this._6942 = param1;
      }
      
      public function get _4521() : Boolean
      {
         return this._6932;
      }
      
      public function set _4521(param1:Boolean) : void
      {
         this._6932 = param1;
      }
      
      public function get opened() : Boolean
      {
         return this._6620;
      }
      
      public function set opened(param1:Boolean) : void
      {
         this._6620 = param1;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(this._selected != param1)
         {
            this._selected = param1;
         }
      }
      
      public function get itemIndex() : int
      {
         return this._2540;
      }
      
      public function set itemIndex(param1:int) : void
      {
         this._2540 = param1;
      }
      
      public function get label() : String
      {
         return this._2541;
      }
      
      public function set label(param1:String) : void
      {
         this._2541 = param1;
      }
   }
}

