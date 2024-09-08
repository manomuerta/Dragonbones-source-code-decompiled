package _978
{
   import _1045.Group;
   import _1045._1069;
   import _1045._1072;
   import _1045._1082;
   import _13505._13510;
   import _13545._13548;
   import _97._100;
   
   public class _984 extends Group implements _1072, _1069
   {
      private var _6951:int;
      
      private var _6950:int = 23;
      
      private var _6953:int = 30;
      
      private var _6954:int;
      
      private var _6895:int = 1;
      
      private var _2558:_1082;
      
      private var _6952:_1082;
      
      private var _6931:Object;
      
      private var _6942:int;
      
      private var _6932:Boolean;
      
      private var _6620:Boolean;
      
      private var _selected:Boolean;
      
      private var _2540:int;
      
      private var _2541:String;
      
      private var _data:Object;
      
      private var _6938:_1082;
      
      public function _984()
      {
         super();
         this.mouseChildren = false;
         this.mouseEnabled = false;
         this.height = Timeline.FRAME_HEIGHT;
         this._6950 = Timeline.FRAME_HEIGHT;
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
         this._selected = param1;
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
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function refresh() : void
      {
         this.data = this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         var _loc2_:_13548 = this._data as _13548;
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
            case _13510.FLAG_IK:
               this._2558.fillColor = _100.IK_TIMELINE_BG_COLOR;
               break;
            case _13510.FLAG_ZORDER:
               this._2558.fillColor = _100.ZORDER_TIMELINE_BG_COLOR;
         }
         this._6938.visible = _loc2_.selectable && _loc2_.selected;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6938 = new _1082();
         this._6938.fillColor = _100.HIGH_LIGHT_BG_COLOR;
         this._6938.height = this._6950;
         this._6938.left = 0;
         this._6938.right = 0;
         this._6938.visible = false;
         this._2558 = new _1082();
         this._2558.fillColor = _100.LINE_BG_COLOR;
         this._2558.height = this._6950;
         this._2558.right = 0;
         this._2558.left = 0;
         this._6952 = new _1082();
         this._6952.fillColor = _100.LINE_BG_COLOR;
         this._6952.height = 1;
         this._6952.y = this._6950 - 1;
         this._6952.right = 0;
         this._6952.left = 0;
         addElement(this._2558);
         addElement(this._6938);
         addElement(this._6952);
      }
   }
}

