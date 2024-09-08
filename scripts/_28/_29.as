package _28
{
   import _97._115;
   
   public class _29 implements _30
   {
      public var data:XML;
      
      public var _1701:Array;
      
      private var _parent:_30;
      
      private var _id:Object;
      
      private var _1704:String;
      
      private var _1703:*;
      
      private var _12942:Boolean;
      
      private var _14267:String;
      
      public function _29(param1:String)
      {
         this.data = <menuitem/>;
         this._1701 = [];
         super();
         this.label = param1;
      }
      
      public function _1702(param1:_30) : void
      {
         this._1701.push(param1);
         param1.parent = this;
         this.data.appendChild((param1 as _29).data);
      }
      
      public function _1700() : void
      {
         this._1701 = [];
         delete this.data.menuitem;
      }
      
      public function _1699(param1:String) : *
      {
         return this.data.attribute("key");
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
         return this._id;
      }
      
      public function set id(param1:Object) : void
      {
         this._id = param1;
         if(param1)
         {
            this.data.@id = this._id.toString();
         }
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
      
      public function get shortcutKey() : String
      {
         return this._14267;
      }
      
      public function set _14265(param1:String) : void
      {
         this._14267 = param1;
         if(param1)
         {
            this.data.@shortcutKey = param1;
         }
      }
      
      public function get icon() : String
      {
         return this.data.@icon;
      }
      
      public function set icon(param1:String) : void
      {
         if(param1)
         {
            this.data.@icon = param1;
         }
      }
      
      public function get type() : String
      {
         return this.data.@type;
      }
      
      public function set type(param1:String) : void
      {
         if(param1)
         {
            this.data.@type = param1;
         }
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
         if(!param1)
         {
            this._1700();
         }
         this.data.@enabled = param1 ? "true" : "false";
      }
      
      public function get userData() : *
      {
         return this._1703;
      }
      
      public function set userData(param1:*) : void
      {
         if(param1 == undefined)
         {
            param1 = null;
         }
         this._1703 = param1;
      }
      
      public function get parent() : _30
      {
         return this._parent;
      }
      
      public function set parent(param1:_30) : void
      {
         this._parent = param1;
      }
   }
}

