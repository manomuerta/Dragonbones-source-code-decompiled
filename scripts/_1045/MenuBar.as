package _1045
{
   import _1038._1039;
   import _1075._1074;
   import _1075._1076;
   import _1177.CollectionEvent;
   import _1177.MenuEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   
   public class MenuBar extends SkinnableContainer
   {
      public var _8133:Array;
      
      private var _8134:Menu;
      
      private var _6877:_1039;
      
      private var dataProviderChanged:Boolean = false;
      
      public var _8130:Class;
      
      public var menu:Class;
      
      private var _8129:_1074;
      
      public function MenuBar()
      {
         this._8133 = [];
         this._8129 = new _1074();
         super();
         this.addEventListener(Event.ADDED_TO_STAGE,this._5996);
      }
      
      protected function _5996(param1:Event) : void
      {
         this.stage.addEventListener(MouseEvent.MOUSE_DOWN,this._4090);
      }
      
      protected function _4090(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         var isItem:Boolean = false;
         var i:int = 0;
         while(i < this._8133.length)
         {
            if(this._8133[i] == event.target)
            {
               isItem = true;
               setTimeout(function(param1:_1076, param2:int):void
               {
                  if(param1._8136 == true)
                  {
                     _8138(param2);
                  }
               },1,this._8133[i],i);
               break;
            }
            i++;
         }
         if(isItem == true)
         {
            i = 0;
            while(i < this._8133.length)
            {
               DisplayObject(this._8133[i]).addEventListener(MouseEvent.ROLL_OVER,this._8132);
               _1076(this._8133[i])._8136 = true;
               i++;
            }
         }
         else if(this._8134 == null)
         {
            i = 0;
            while(i < this._8133.length)
            {
               DisplayObject(this._8133[i]).removeEventListener(MouseEvent.ROLL_OVER,this._8132);
               _1076(this._8133[i])._8136 = false;
               i++;
            }
         }
      }
      
      protected function _8135(param1:MenuEvent) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._8133.length)
         {
            DisplayObject(this._8133[_loc2_]).removeEventListener(MouseEvent.ROLL_OVER,this._8132);
            _1076(this._8133[_loc2_])._8136 = false;
            _loc2_++;
         }
      }
      
      protected function _8132(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(_1076(param1.target))
         {
            _loc2_ = 0;
            while(_loc2_ < this._8133.length)
            {
               _1076(this._8133[_loc2_])._8139();
               _loc2_++;
            }
            _1076(param1.target)._8137();
            _loc3_ = int(this._8133.indexOf(_1076(param1.target)));
            this._8138(_loc3_);
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super.enabled = param1;
         if(this._8133)
         {
            _loc2_ = int(this._8133.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               this._8133[_loc3_].enabled = param1;
               _loc3_++;
            }
         }
      }
      
      public function get dataProvider() : _1039
      {
         return this._6877;
      }
      
      public function set dataProvider(param1:_1039) : void
      {
         if(this._6877)
         {
            this._6877.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this._2457);
         }
         this.dataProviderChanged = true;
         if(param1)
         {
            param1.addEventListener(CollectionEvent.COLLECTION_CHANGE,this._2457,false,0,true);
         }
         this._6877 = param1;
         _2466();
      }
      
      private function _2457() : void
      {
         this.dataProviderChanged = true;
         _2466();
      }
      
      override protected function _2476() : void
      {
         var _loc1_:int = 0;
         var _loc2_:String = null;
         var _loc3_:_1076 = null;
         super._2476();
         if(this.dataProviderChanged == true)
         {
            while(this._8133.length > 0)
            {
               this._8133.pop();
            }
            _2440._2426();
            _loc1_ = 0;
            while(_loc1_ < this.dataProvider.length)
            {
               _loc2_ = this._7442(this.dataProvider.getItemAt(_loc1_));
               if(_loc2_ != "" && _loc2_ != null)
               {
                  _loc3_ = new this._8130();
                  _loc3_.data = this.dataProvider.getItemAt(_loc1_);
                  _loc3_.label = _loc2_;
                  _loc3_.icon = this._8124(this.dataProvider.getItemAt(_loc1_));
                  _2440.addElement(_loc3_);
                  this._8133.push(_loc3_);
               }
               _loc1_++;
            }
            this.dataProviderChanged = false;
         }
      }
      
      public function _7442(param1:Object) : String
      {
         if(param1 is String)
         {
            return String(param1);
         }
         if(param1 is XML)
         {
            return param1.@label;
         }
         if(param1 is Object)
         {
            return param1.label;
         }
         return " ";
      }
      
      public function _8124(param1:Object) : Object
      {
         if(param1 is String)
         {
            return String(param1);
         }
         if(param1 is XML)
         {
            return String(param1.@icon);
         }
         if(param1 is Object)
         {
            return param1.icon;
         }
         return null;
      }
      
      private function _8138(param1:int) : void
      {
         var itemderer:_1076 = null;
         var menuBarItemIndex:int = param1;
         itemderer = this._8133[menuBarItemIndex];
         var tmpDpSource:Object = this.dataProvider.getItemAt(menuBarItemIndex);
         var tmpDp:_1039 = this._8129.getChildren(tmpDpSource);
         if(this._8134 == null)
         {
            this._8134 = new this.menu();
            Menu._6319(this._8134,this,tmpDp);
            this._8134.addEventListener(MenuEvent.MENU_CHANGE,this._8131);
            this._8134.addEventListener(MenuEvent.ITEM_ROLL_OUT,this._8131);
            this._8134.addEventListener(MenuEvent.ITEM_ROLL_OVER,this._8131);
            this._8134.addEventListener(MenuEvent.ITEM_CLICK,this._8131);
            this._8134.addEventListener(MenuEvent.MENU_HIDE,this._8131);
            this._8134.addEventListener(MenuEvent.MENU_SHOW,this._8131);
            this._8134._5987 = "@label";
            this._8134._6377 = "@icon";
         }
         this._8134.dataProvider = tmpDp;
         setTimeout(function():void
         {
            _8134.removeEventListener(MenuEvent.MENU_HIDE,_8135);
            _8134.hide();
            _8134.addEventListener(MenuEvent.MENU_HIDE,_8135);
            _8134.show(itemderer.x,itemderer.y + itemderer.height);
         },1);
      }
      
      private function _8131(param1:MenuEvent) : void
      {
         this.dispatchEvent(param1);
      }
   }
}

