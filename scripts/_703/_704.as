package _703
{
   import _81._90;
   
   public class _704 implements _702, _90
   {
      public var visible:Boolean = true;
      
      public var selectable:Boolean = true;
      
      protected var _parent:_702;
      
      protected var _5822:Array;
      
      protected var _3670:Object;
      
      public function _704()
      {
         this._5822 = [];
         super();
      }
      
      public function _5827() : void
      {
         this._5822.sort();
      }
      
      public function toString() : String
      {
         return this.name;
      }
      
      public function get children() : Array
      {
         return this._5822;
      }
      
      public function get parent() : _702
      {
         return this._parent;
      }
      
      public function set parent(param1:_702) : void
      {
         this._parent = param1;
      }
      
      public function get name() : String
      {
         if(this._3670.hasOwnProperty("name"))
         {
            return this._3670.name;
         }
         return "";
      }
      
      public function get vo() : Object
      {
         return this._3670;
      }
   }
}

