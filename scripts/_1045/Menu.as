package _1045
{
   import _1038._1039;
   import _1075.MenuItemRenderer;
   import _1075._1074;
   import _1075._1077;
   import _1075._1078;
   import _1177.MenuEvent;
   import _1177.RendererExistenceEvent;
   import egret.core._1133;
   import egret.core.ns_egret;
   import egret.managers._1217;
   import egret.utils._99;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class Menu extends List
   {
      private var _8112:_1077;
      
      private var _8120:Menu;
      
      private var _8106:Boolean = false;
      
      private var _8125:String;
      
      private var _8117:Function;
      
      private var subMenu:Menu;
      
      private var _8128:Boolean;
      
      private var _8110:DisplayObject;
      
      public function Menu()
      {
         this._8112 = new _1074();
         super();
         this._6056 = false;
      }
      
      public static function _6375(param1:DisplayObjectContainer, param2:_1039) : Menu
      {
         var _loc3_:Menu = new Menu();
         _loc3_.tabEnabled = false;
         _6319(_loc3_,param1,param2);
         return _loc3_;
      }
      
      public static function _6319(param1:Menu, param2:DisplayObjectContainer, param3:_1039) : void
      {
         param1._8110 = !!param2 ? param2 : DisplayObject(param1._1558);
         param1.dataProvider = param3;
      }
      
      override protected function _2438() : void
      {
         if(!itemRenderer)
         {
            itemRenderer = MenuItemRenderer;
         }
         super._2438();
      }
      
      public function get _8116() : _1077
      {
         return _1077(this._8112);
      }
      
      public function set _8116(param1:_1077) : void
      {
         this._8112 = param1;
      }
      
      public function get parentMenu() : Menu
      {
         return this._8120;
      }
      
      public function set parentMenu(param1:Menu) : void
      {
         this._8120 = param1;
      }
      
      public function get _6377() : String
      {
         return this._8125;
      }
      
      public function set _6377(param1:String) : void
      {
         if(this._8125 == param1)
         {
            return;
         }
         this._8125 = param1;
         this._8106 = true;
         _2466();
      }
      
      public function get iconFunction() : Function
      {
         return this._8117;
      }
      
      public function set iconFunction(param1:Function) : void
      {
         if(this._8117 == param1)
         {
            return;
         }
         this._8117 = param1;
         this._8106 = true;
         _2466();
      }
      
      override public function _2481(param1:_1070, param2:int, param3:Object) : _1070
      {
         var _loc4_:_1078 = null;
         if(param1 is _1078)
         {
            (_loc4_ = param1 as _1078)._4521 = this._8112._4521(param3);
            _loc4_.type = this._8112.getType(param3);
            _loc4_._8127 = this._8112._8127(param3);
            _loc4_._8126 = this._8112._8126(param3);
            _loc4_._5988 = this._8124(param3);
            _loc4_.shortcutKey = this._8112._14264(param3);
         }
         return super._2481(param1,param2,param3);
      }
      
      public function _8124(param1:Object) : Object
      {
         var _loc2_:Object = null;
         if(!param1)
         {
            return null;
         }
         if(this._8117 != null)
         {
            return this._8117(param1);
         }
         if(param1 is XML)
         {
            try
            {
               if(param1[this._6377].length() != 0)
               {
                  _loc2_ = String(param1[this._6377]);
               }
            }
            catch(e:Error)
            {
            }
         }
         else if(param1 is Object)
         {
            try
            {
               if(param1[this._6377])
               {
                  _loc2_ = param1[this._6377];
               }
            }
            catch(e:Error)
            {
            }
         }
         return _loc2_;
      }
      
      private function _8121(param1:_1078) : void
      {
         if(!param1._4521)
         {
            this.selectedIndex = -1;
            if(this.subMenu)
            {
               this.subMenu.hide();
            }
            return;
         }
         this.selectedIndex = param1.itemIndex;
         var _loc2_:Menu = this._8122();
         var _loc3_:_1039 = this._8112.getChildren(param1.data);
         if(!this.subMenu)
         {
            this.subMenu = new Menu();
            this.subMenu.skinName = this.skinName;
            this.subMenu.parentMenu = this;
            this.subMenu._5987 = _loc2_._5987;
            this.subMenu._6146 = _loc2_._6146;
            this.subMenu._6377 = _loc2_._6377;
            this.subMenu.iconFunction = _loc2_.iconFunction;
            this.subMenu.itemRenderer = _loc2_.itemRenderer;
            this.subMenu._2514 = _loc2_._2514;
            this.subMenu.scaleY = _loc2_.scaleY;
            this.subMenu.scaleX = _loc2_.scaleX;
         }
         else
         {
            this.subMenu.hide();
         }
         Menu._6319(this.subMenu,this,_loc3_);
         var _loc4_:Point = this._8114(param1);
         this.subMenu.show(_loc4_.x,_loc4_.y);
      }
      
      protected function _8114(param1:_1078) : Point
      {
         var _loc2_:Point = new Point(param1.layoutBoundsX + param1.layoutBoundsWidth,param1.layoutBoundsY);
         if(this.localToGlobal(_loc2_).y + this.subMenu.layoutBoundsHeight > _1558.stage.stageHeight)
         {
            _loc2_.y = _1558.stage.stageHeight - this.subMenu.layoutBoundsHeight;
            _loc2_ = this.globalToLocal(_loc2_);
            _loc2_.x = param1.layoutBoundsX + param1.layoutBoundsWidth;
         }
         if(this.localToGlobal(_loc2_).x + this.subMenu.layoutBoundsWidth > _1558.stage.stageWidth || this._8128)
         {
            _loc2_.x = param1.layoutBoundsX - this.subMenu.layoutBoundsWidth;
            this.subMenu._8128 = true;
         }
         return _loc2_;
      }
      
      private function _8122() : Menu
      {
         var _loc1_:Menu = this;
         while(_loc1_.parentMenu)
         {
            _loc1_ = _loc1_.parentMenu;
         }
         return _loc1_;
      }
      
      public function hide() : void
      {
         var _loc2_:MenuEvent = null;
         var _loc1_:Menu = this._8122();
         if(_loc1_ == null || _loc1_._1558 == null)
         {
            return;
         }
         if(visible && Boolean(_loc1_._1558.stage))
         {
            this.visible = false;
            if(this.subMenu)
            {
               this.subMenu.hide();
            }
            if(_loc1_ == this)
            {
               _loc1_._1558.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this._8108);
            }
            _loc2_ = new MenuEvent(MenuEvent.MENU_HIDE);
            _loc2_.menu = this;
            this.dispatchEvent(_loc2_);
         }
      }
      
      public function show(param1:Number = 0, param2:Number = 0) : void
      {
         var rootMenu:Menu;
         var menuEvent:MenuEvent;
         var sbRoot:Stage;
         var pt:Point;
         var xShow:Number = param1;
         var yShow:Number = param2;
         if(!dataProvider || dataProvider.length == 0)
         {
            return;
         }
         if(Boolean(this.parentMenu) && !this.parentMenu.visible)
         {
            return;
         }
         if(visible && Boolean(stage))
         {
            return;
         }
         if(!this._8110)
         {
            this._8110 = DisplayObject(this._1558);
         }
         rootMenu = this._8122();
         if(!parent || !parent.contains(this._8110))
         {
            _1217.addPopUp(this,false,false);
            if(rootMenu != this)
            {
               this.visible = false;
               _99(function():void
               {
                  visible = true;
               },null,4);
            }
            else
            {
               this.visible = true;
            }
            addEventListener(MenuEvent.MENU_HIDE,this._8115,false,-50);
         }
         menuEvent = new MenuEvent(MenuEvent.MENU_SHOW);
         menuEvent.menu = this;
         rootMenu.dispatchEvent(menuEvent);
         sbRoot = rootMenu._1558.stage;
         pt = new Point(xShow,yShow);
         pt = this._8110.localToGlobal(pt);
         pt = DisplayObject(rootMenu._1558).globalToLocal(pt);
         this.x = pt.x;
         this.y = pt.y;
         this.selectedIndex = -1;
         _2581();
         if(rootMenu == this)
         {
            sbRoot.addEventListener(MouseEvent.MOUSE_DOWN,this._8108,false,0,true);
         }
      }
      
      protected function _8111(param1:_1078, param2:Boolean) : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:_1078 = null;
         var _loc6_:int = 0;
         if(this._8112.getType(param1.data) == "radio")
         {
            _loc3_ = this._8112._8119(param1.data);
            _loc4_ = _2490._2249;
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc5_ = _2490.getElementAt(_loc6_) as _1078;
               if(this._8112.getType(_loc5_.data) == "radio" && this._8112._8119(_loc5_.data) == _loc3_)
               {
                  this._8112._8123(_loc5_.data,_loc5_ == param1);
                  _loc5_._8126 = this._8112._8126(param1.data);
               }
               _loc6_++;
            }
         }
         if(param2 != this._8112._8126(param1.data))
         {
            this._8112._8123(param1.data,param2);
            param1._8126 = param2;
         }
      }
      
      override ns_egret function _2473(param1:MouseEvent, param2:String, param3:_1070) : void
      {
         var _loc4_:int = -1;
         if(param3)
         {
            _loc4_ = param3.itemIndex;
         }
         else
         {
            _loc4_ = _2490.getElementIndex(param1.currentTarget as _1133);
         }
         var _loc5_:MenuEvent = new MenuEvent(param2,false,false,this,param3.data,_loc4_,_1078(param3));
         this._8122().dispatchEvent(_loc5_);
      }
      
      override protected function _2603(param1:RendererExistenceEvent) : void
      {
         super._2603(param1);
         var _loc2_:DisplayObject = param1._2487 as DisplayObject;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.addEventListener(MouseEvent.ROLL_OVER,this._8109);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this._8107,false,1);
      }
      
      override protected function _2601(param1:RendererExistenceEvent) : void
      {
         super._2601(param1);
         var _loc2_:DisplayObject = param1._2487 as DisplayObject;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.removeEventListener(MouseEvent.ROLL_OVER,this._8109);
         _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this._8107);
      }
      
      override protected function _8095(param1:MouseEvent) : void
      {
         var _loc2_:_1078 = param1.currentTarget as _1078;
         if(_loc2_._4521 || !_loc2_._8127)
         {
            return;
         }
         super._8095(param1);
      }
      
      private function _8107(param1:MouseEvent) : void
      {
         var _loc4_:Boolean = false;
         var _loc2_:_1078 = param1.currentTarget as _1078;
         if(_loc2_._4521 || !_loc2_._8127)
         {
            return;
         }
         var _loc3_:String = this._8112.getType(_loc2_.data);
         if(_loc3_)
         {
            _loc4_ = this._8112.getType(_loc2_.data) != "radio" || !this._8112._8126(_loc2_.data);
            if(_loc4_)
            {
               this._8111(_loc2_,!this._8112._8126(_loc2_.data));
               this.ns_egret::_2473(param1,MenuEvent.MENU_CHANGE,_loc2_);
            }
         }
         _99(this._8118);
      }
      
      private function _8109(param1:MouseEvent) : void
      {
         var _loc2_:_1078 = param1.currentTarget as _1078;
         this._8121(_loc2_);
      }
      
      protected function _8115(param1:MenuEvent) : void
      {
         var _loc2_:Menu = Menu(param1.target);
         if(!param1.isDefaultPrevented() && _loc2_ == param1.menu)
         {
            _1217.removePopUp(param1.menu);
            _loc2_.removeEventListener(MenuEvent.MENU_HIDE,this._8115);
         }
      }
      
      protected function _8108(param1:MouseEvent) : void
      {
         if(!this._8113(param1))
         {
            this._8118();
         }
      }
      
      private function _8113(param1:MouseEvent) : Boolean
      {
         var _loc2_:DisplayObject = DisplayObject(param1.target);
         while(_loc2_)
         {
            if(_loc2_ is Menu)
            {
               return true;
            }
            _loc2_ = _loc2_.parent;
         }
         return false;
      }
      
      private function _8118() : void
      {
         this._8122().hide();
      }
   }
}

