package _13212
{
   import _1045.Label;
   import _1045.SkinnableContainer;
   import _1045._1070;
   import _1045._1082;
   import _1374.IconButton;
   import _51._70;
   import _636.SheetEvent;
   import flash.events.MouseEvent;
   
   public class _13215 extends SkinnableContainer implements _1070
   {
      public static const DEFUALT_HEIGHT:int = 100;
      
      public static const MIN_HEIGHT:int = 80;
      
      public static const MAX_HEIGHT:int = 200;
      
      public static const _2422:int = 4;
      
      public static const IMAGE_GAP:int = 30;
      
      public static var _13415:int = DEFUALT_HEIGHT;
      
      public var _13425:_13211;
      
      public var _13426:Label;
      
      public var bg:_1082;
      
      public var _6194:Label;
      
      public var _4197:IconButton;
      
      private var _selected:Boolean;
      
      private var _13428:Boolean;
      
      private var _13427:Boolean;
      
      private var _2540:int;
      
      private var _2541:String;
      
      private var _data:Object;
      
      public function _13215()
      {
         super();
         this.skinName = _13216;
         this.width = DEFUALT_HEIGHT;
         this.height = DEFUALT_HEIGHT;
         addEventListener(MouseEvent.ROLL_OVER,this._4233);
         addEventListener(MouseEvent.ROLL_OUT,this._4237);
      }
      
      private function _4237(param1:MouseEvent) : void
      {
         this._13429 = false;
      }
      
      private function _4233(param1:MouseEvent) : void
      {
         this._13429 = true;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._4197.addEventListener(MouseEvent.MOUSE_DOWN,this._4179);
      }
      
      private function _13424(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      private function _4179(param1:MouseEvent) : void
      {
         dispatchEvent(new SheetEvent(SheetEvent.DELETE_FRAME,this._data,true));
         param1.stopImmediatePropagation();
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         if(this.height != _13415)
         {
            this.height = this.width = _13415;
            this.bg.width = this.bg.height = _13415;
            this._6194.width = _13415;
         }
         if(this._data is _70)
         {
            this._13425._2104 = (this._data as _70)._2104;
            this._6194.text = (this._data as _70)._13230;
         }
         this._13425.width = this.width - IMAGE_GAP;
         this._13425.height = this.height - IMAGE_GAP;
         this._13425.x = this.width / 2;
         this._13425.y = this.height / 2;
         this._13426.text = (this._2540 + 1).toString();
      }
      
      override protected function _6231() : String
      {
         if(this._13427)
         {
            return "disabled";
         }
         if(this._selected)
         {
            return "selected";
         }
         if(this._13428)
         {
            return "over";
         }
         return "normal";
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
            _2570();
         }
      }
      
      public function get itemIndex() : int
      {
         return this._2540;
      }
      
      public function set itemIndex(param1:int) : void
      {
         this._2540 = param1;
         invalidateDisplayList();
      }
      
      public function get label() : String
      {
         return this._2541;
      }
      
      public function set label(param1:String) : void
      {
         this._2541 = param1;
      }
      
      public function get _13429() : Boolean
      {
         return this._13428;
      }
      
      public function set _13429(param1:Boolean) : void
      {
         if(this._13428 != param1)
         {
            this._13428 = param1;
            _2570();
         }
      }
      
      public function get disabled() : Boolean
      {
         return this._13427;
      }
      
      public function set disabled(param1:Boolean) : void
      {
         if(this._13427 != param1)
         {
            this._13427 = param1;
            _2570();
         }
      }
   }
}

