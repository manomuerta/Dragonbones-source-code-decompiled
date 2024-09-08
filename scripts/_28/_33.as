package _28
{
   import _97._115;
   
   public class _33 implements _30
   {
      public var data:XML;
      
      private var _1703:*;
      
      private var _1704:String;
      
      public function _33(param1:String)
      {
         this.data = <menuitem/>;
         super();
         this.label = param1;
      }
      
      public function _1702(param1:_30) : void
      {
         this.data.appendChild((param1 as _33).data);
      }
      
      public function _1700() : void
      {
         delete this.data.menuitem;
      }
      
      public function _1699(param1:String) : *
      {
         return this.data.attribute("key");
      }
      
      public function get limited() : Boolean
      {
         return String(this.data.@limited) == "true";
      }
      
      public function set limited(param1:Boolean) : void
      {
         this.data.@limited = param1 ? "true" : "false";
      }
      
      public function get id() : Object
      {
         return String(this.data.@id);
      }
      
      public function set id(param1:Object) : void
      {
         this.data.@id = param1;
      }
      
      public function get label() : String
      {
         return this.data.@label;
      }
      
      public function set label(param1:String) : void
      {
         this.data.@label = param1;
      }
      
      public function get shortcut() : String
      {
         return this._1704;
      }
      
      public function set shortcut(param1:String) : void
      {
         this._1704 = param1;
         if(Boolean(param1) && param1 != "")
         {
            _115._1698(this);
         }
      }
      
      public function get icon() : String
      {
         return this.data.@icon;
      }
      
      public function set icon(param1:String) : void
      {
         this.data.@icon = param1;
      }
      
      public function get type() : String
      {
         return this.data.@type;
      }
      
      public function set type(param1:String) : void
      {
         this.data.@type = param1;
      }
      
      public function get _1705() : Boolean
      {
         return this.data.@_1705 == "true";
      }
      
      public function set _1705(param1:Boolean) : void
      {
         this.data.@_1705 = param1 ? "true" : "false";
      }
      
      public function get enabled() : Boolean
      {
         return this.data.@enabled != "false";
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this.data.@enabled = param1 ? "true" : "false";
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

