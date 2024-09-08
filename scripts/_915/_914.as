package _915
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1070;
   import _1045._1082;
   import _1045._1105;
   import _1177.UIEvent;
   import _1374.IconButton;
   import _1374.TextInput;
   import _51._52;
   import _636.MeshEvent;
   import _97._125;
   import egret.utils.SystemInfo;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class _914 extends Group implements _1070
   {
      public static const DELETE_BONE_ICON:String = "/assets/button/delAnimation.png";
      
      private var _2618:Class;
      
      private var _2617:Class;
      
      private var _2616:Class;
      
      public var _4197:IconButton;
      
      private var _selected:Boolean;
      
      private var _2540:int;
      
      private var _2541:String;
      
      private var _data:Object;
      
      public var _4444:Label;
      
      public var _6594:_1082;
      
      public var _6521:TextInput;
      
      public var _6593:_918;
      
      private var _2558:_1105;
      
      private var _2361:Number = 100;
      
      private var _h:Number = 23;
      
      private var _12740:Label;
      
      private var _13031:Group;
      
      private var _13030:Group;
      
      public function _914()
      {
         this._2618 = _914__2618;
         this._2617 = _914__2617;
         this._2616 = _914__2616;
         super();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._2361 = param1;
         this._h = param2;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.percentWidth = 100;
         this.height = 24;
         this._2558 = new _1105(this._2618);
         this._2558.left = this._2558.right = this._2558.top = this._2558.bottom = 0;
         this._2558.scale9Grid = new Rectangle(1,1,1,1);
         this.addElement(this._2558);
         var _loc1_:Group = _125._2414();
         _loc1_.left = 6;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         this._4444 = new Label();
         this._4444.height = this._4444.size + 2;
         this._4444._6541 = true;
         this._4444.minWidth = 50;
         this._4444.maxWidth = 90;
         this._4444.percentWidth = 100;
         this._4444._6541 = true;
         this._6594 = new _1082();
         this._6594.width = 12;
         this._6594.height = 12;
         _loc1_.addElement(this._6594);
         _loc1_.addElement(this._4444);
         addElement(_loc1_);
         this._13030 = _125._2414(0);
         this._13030.right = 2;
         this._6521 = new TextInput();
         this._6521.maxChars = 3;
         this._6521.restrict = "0-9";
         this._6521.width = 30;
         if(SystemInfo.isMacOS)
         {
            this._6521.width = 34;
         }
         this._12740 = new Label();
         this._12740.text = "%";
         this._6593 = new _918();
         this._6593.value = 100;
         this._13030.addElement(this._6593);
         this._13030.addElement(this._6521);
         this._13030.addElement(this._12740);
         var _loc2_:Group = new Group();
         _loc2_.percentWidth = 100;
         this._13030.right = 2;
         _loc2_.addElement(this._13030);
         _loc1_.addElement(_loc2_);
         this._13031 = new Group();
         this._13031.percentWidth = 100;
         this._4197 = new IconButton();
         this._4197.icon = DELETE_BONE_ICON;
         this._4197.right = 2;
         this._13031.addElement(this._4197);
         _loc1_.addElement(this._13031);
         this._4197.visible = false;
         this._6593.addEventListener(Event.CHANGE,this._6590);
         this._6593.addEventListener(UIEvent.CHANGE_END,this._6592);
         this._6521.addEventListener(FocusEvent.FOCUS_OUT,this._6591);
         this._4197.addEventListener(MouseEvent.CLICK,this._4179);
         this._4197.addEventListener(MouseEvent.MOUSE_DOWN,this._12739);
         this.addEventListener(MouseEvent.ROLL_OVER,this._4233);
         this.addEventListener(MouseEvent.ROLL_OUT,this._4237);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this._6595);
         this._13030.visible = this._13030.includeInLayout = false;
         this.refresh();
      }
      
      private function _12739(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      private function _4179(param1:MouseEvent) : void
      {
         if(Boolean(this.data) && Boolean(this.data.bone))
         {
            this.owner.dispatchEvent(new MeshEvent(MeshEvent.DELETE_BONE,this.data.bone,true));
         }
         param1.stopImmediatePropagation();
      }
      
      private function _6595(param1:MouseEvent) : void
      {
         if(Boolean(this.data) && Boolean(this.data.bone))
         {
            this.owner.dispatchEvent(new MeshEvent(MeshEvent.SELECT_BINDING_BONE,this.data.bone));
         }
      }
      
      private function _4237(param1:MouseEvent) : void
      {
         this._2558.source = this._selected ? this._2616 : this._2618;
         if(!this.data.editEnable)
         {
            this._4197.visible = this._selected;
         }
      }
      
      private function _4233(param1:MouseEvent) : void
      {
         this._2558.source = this._2617;
         if(!this.data.editEnable)
         {
            this._4197.visible = true;
         }
      }
      
      private function refresh() : void
      {
         var _loc4_:Boolean = false;
         if(this.data == null)
         {
            return;
         }
         var _loc1_:_52 = this.data.bone;
         var _loc2_:Number = Number(this.data.weight);
         var _loc3_:uint = uint(this.data.color);
         if(_loc1_)
         {
            this._4444.text = _loc1_.name;
         }
         this._6594.fillColor = _loc3_;
         var _loc5_:int = _loc2_ * 100;
         if(_loc5_ < 0)
         {
            _loc5_ = 0;
            _loc4_ = true;
         }
         if(this._6521)
         {
            this._6521.text = _loc5_.toString();
            this._6521.enabled = _loc2_ < 1;
         }
         if(this._6593)
         {
            this._6593.value = _loc5_;
         }
         if(_loc5_ < 100 && Boolean(this._6593))
         {
            this._6593.enabled = true;
         }
         if(_loc4_ && this._6521 && Boolean(this._6593))
         {
            this._6521.enabled = false;
            this._6593.enabled = false;
         }
         this._2558.source = this._selected ? this._2616 : this._2618;
         this._4197.visible = this._selected;
         this._13030.visible = this._13030.includeInLayout = this.data.editEnable;
         this._13031.visible = this._13031.includeInLayout = !this.data.editEnable;
      }
      
      private function _6592(param1:UIEvent) : void
      {
         this._6593.enabled = this.data.weight < 1;
      }
      
      private function _6590(param1:Event) : void
      {
         var _loc2_:Number = this._6593.value * 0.01;
         this.owner.dispatchEvent(new MeshEvent(MeshEvent.MODIFY_BAR_WEIGHT,_loc2_));
      }
      
      private function _6591(param1:Event) : void
      {
         var _loc2_:Number = Number(this._6521.text);
         if(isNaN(_loc2_))
         {
            this._6521.text = int(this.data.weight * 100).toString();
            return;
         }
         if(_loc2_ == int(this.data.weight * 100))
         {
            return;
         }
         _loc2_ *= 0.01;
         if(_loc2_ > 1)
         {
            this._6521.text = "100";
            _loc2_ = 1;
         }
         this.owner.dispatchEvent(new MeshEvent(MeshEvent.MODIFY_WEIGHT,_loc2_));
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         this.refresh();
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
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         this.refresh();
      }
   }
}

