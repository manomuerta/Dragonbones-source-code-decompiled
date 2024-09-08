package _28
{
   import _24._25;
   import _97._115;
   import flash.display.NativeMenu;
   import flash.display.NativeMenuItem;
   import flash.ui.Keyboard;
   
   public class _31 implements _30
   {
      public var _1706:NativeMenuItem;
      
      private var subMenu:NativeMenu;
      
      private var _1704:String;
      
      private var _1703:*;
      
      private var _12942:Boolean;
      
      public function _31(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super();
         this._1706 = new NativeMenuItem(param1,param3);
         if(param2)
         {
            this.subMenu = new NativeMenu();
            this._1706.submenu = this.subMenu;
         }
      }
      
      public function _1702(param1:_30) : void
      {
         this.subMenu.addItem((param1 as _31)._1706);
      }
      
      public function _1700() : void
      {
      }
      
      public function get limited() : Boolean
      {
         return this._12942;
      }
      
      public function set limited(param1:Boolean) : void
      {
         this._12942 = param1;
      }
      
      public function get id() : Object
      {
         return this._1706.data;
      }
      
      public function set id(param1:Object) : void
      {
         this._1706.data = param1;
      }
      
      public function get label() : String
      {
         return this._1706.label;
      }
      
      public function set label(param1:String) : void
      {
         this._1706.label = param1;
      }
      
      public function get shortcut() : String
      {
         return this._1704;
      }
      
      public function set shortcut(param1:String) : void
      {
         var _loc4_:uint = 0;
         if(!param1 || param1 == "")
         {
            return;
         }
         var _loc2_:Array = _25._1691[param1];
         if(!_loc2_ || _loc2_.length == 0)
         {
            return;
         }
         this._1704 = param1;
         var _loc3_:Array = [];
         for each(_loc4_ in _loc2_)
         {
            if(_loc4_ == Keyboard.CONTROL || _loc4_ == Keyboard.COMMAND || _loc4_ == Keyboard.SHIFT || _loc4_ == Keyboard.ALTERNATE)
            {
               _loc3_.push(_loc4_);
            }
            else
            {
               this._1706.keyEquivalent = String.fromCharCode(_loc4_).toLowerCase();
            }
            this._1706.keyEquivalentModifiers = _loc3_;
         }
         _115._1698(this);
      }
      
      public function get icon() : String
      {
         return null;
      }
      
      public function set icon(param1:String) : void
      {
      }
      
      public function get type() : String
      {
         return null;
      }
      
      public function set type(param1:String) : void
      {
      }
      
      public function get _1705() : Boolean
      {
         return this._1706.checked;
      }
      
      public function set _1705(param1:Boolean) : void
      {
         this._1706.checked = param1;
      }
      
      public function get enabled() : Boolean
      {
         return this._1706.enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._1706.enabled = param1;
      }
      
      public function get userData() : *
      {
         return this._1703;
      }
      
      public function set userData(param1:*) : void
      {
         this._1703 = param1;
      }
      
      public function get parent() : _30
      {
         return null;
      }
      
      public function set parent(param1:_30) : void
      {
      }
   }
}

