package _929
{
   import _1075._1078;
   import _1374.IconButton;
   
   public class _11266 extends IconButton implements _1078
   {
      private var _selected:Boolean;
      
      private var _2540:int;
      
      private var _data:Object;
      
      private var _6931:Object;
      
      private var _type:String;
      
      private var _6932:Boolean;
      
      private var _8149:Boolean;
      
      private var _8148:Boolean;
      
      private var _14267:String;
      
      public function _11266()
      {
         super();
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         if(this._data)
         {
            this.icon = this._data.icon;
            this.toolTip = this._data.toolTip;
            this.enabled = this._data.enabled;
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
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function get _4521() : Boolean
      {
         return this._6932;
      }
      
      public function set _4521(param1:Boolean) : void
      {
         this._6932 = param1;
      }
      
      public function get _8127() : Boolean
      {
         return this._8149;
      }
      
      public function set _8127(param1:Boolean) : void
      {
         this._8149 = param1;
      }
      
      public function get _8126() : Boolean
      {
         return this._8148;
      }
      
      public function set _8126(param1:Boolean) : void
      {
         this._8148 = param1;
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
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function get shortcutKey() : String
      {
         return this._14267;
      }
      
      public function set shortcutKey(param1:String) : void
      {
         if(this._14267 == param1)
         {
            return;
         }
         this._14267 = param1;
      }
   }
}

