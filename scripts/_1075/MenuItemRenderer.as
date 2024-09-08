package _1075
{
   import _1045.Label;
   import _1045._1105;
   import _1088.ItemRenderer;
   
   public class MenuItemRenderer extends ItemRenderer implements _1078
   {
      public var _8145:_1105;
      
      public var _2448:_1105;
      
      public var _8146:_1105;
      
      public var _8147:_1105;
      
      public var _8144:_1105;
      
      public var _14751:Label;
      
      private var _6931:Object;
      
      private var _14267:String = "";
      
      private var _6932:Boolean;
      
      private var _type:String;
      
      private var _8149:Boolean = true;
      
      private var _8148:Boolean = true;
      
      public function MenuItemRenderer()
      {
         super();
      }
      
      public function get _5988() : Object
      {
         return this._6931;
      }
      
      public function set _5988(param1:Object) : void
      {
         if(this._6931 == param1)
         {
            return;
         }
         this._6931 = param1;
         if(this._2448)
         {
            this._2448.source = this._6931;
         }
      }
      
      public function get shortcutKey() : String
      {
         return this._14267;
      }
      
      public function set shortcutKey(param1:String) : void
      {
         this._14267 = param1;
         if(this._14751)
         {
            this._14751.text = param1;
         }
      }
      
      public function get _4521() : Boolean
      {
         return this._6932;
      }
      
      public function set _4521(param1:Boolean) : void
      {
         if(this._6932 == param1)
         {
            return;
         }
         this._6932 = param1;
         _2466();
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         if(this._type == param1)
         {
            return;
         }
         this._type = param1;
         this.mouseChildren = this.mouseEnabled = param1 != "separator";
         _2570();
         _2466();
      }
      
      public function get _8127() : Boolean
      {
         return this._8149;
      }
      
      public function set _8127(param1:Boolean) : void
      {
         if(this._8149 == param1)
         {
            return;
         }
         this._8149 = param1;
         this.enabled = param1;
      }
      
      public function get _8126() : Boolean
      {
         return this._8148;
      }
      
      public function set _8126(param1:Boolean) : void
      {
         if(this._8148 == param1)
         {
            return;
         }
         this._8148 = param1;
         _2466();
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._2448)
         {
            this._2448.source = this._5988;
         }
         if(param2 == this._14751)
         {
            this._14751.text = this.shortcutKey;
         }
      }
      
      override protected function _2476() : void
      {
         super._2476();
         this._8145.visible = false;
         labelDisplay.visible = true;
         this._2448.visible = true;
         this._8144.visible = false;
         this._8146.visible = false;
         this._8147.visible = false;
         labelDisplay.includeInLayout = this._2448.includeInLayout = this._8144.includeInLayout = this._8146.includeInLayout = this._8147.includeInLayout = true;
         if(this.type)
         {
            if(this.type == "separator")
            {
               labelDisplay.includeInLayout = this._2448.includeInLayout = this._8144.includeInLayout = this._8146.includeInLayout = this._8147.includeInLayout = false;
               this._8145.visible = true;
               labelDisplay.visible = false;
               this._2448.visible = false;
            }
            else if(this.type == "radio" && this._8126)
            {
               this._8147.visible = true;
            }
            else if(this.type == "check" && this._8126)
            {
               this._8146.visible = true;
            }
         }
         else if(this._4521)
         {
            this._8144.visible = true;
         }
      }
   }
}

