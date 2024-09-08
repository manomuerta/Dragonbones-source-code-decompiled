package _724
{
   import _755._757;
   import _81._90;
   
   public class _13550 implements _90
   {
      public static const LIBRARYPROJECTDATA:int = 1;
      
      public static const LIBRARYVITUALFOLDERVO:int = 2;
      
      private var _name:String;
      
      private var _13943:String;
      
      private var _13944:Object;
      
      private var _13945:int;
      
      public var treeDepth:int;
      
      public function _13550(param1:String)
      {
         super();
         this.name = param1;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function _13946(param1:String) : void
      {
         this.name = param1;
      }
      
      public function get _13695() : Object
      {
         return this._13944;
      }
      
      public function set _13695(param1:Object) : void
      {
         if(!(param1 is _13550) && !(param1 is _757))
         {
            return;
         }
         this._13944 = param1;
         this._13751 = param1 is _13550 ? LIBRARYVITUALFOLDERVO : LIBRARYPROJECTDATA;
      }
      
      public function get _13751() : int
      {
         return this._13945;
      }
      
      public function set _13751(param1:int) : void
      {
         this._13945 = param1;
      }
      
      public function get _13939() : String
      {
         return this._13943;
      }
      
      public function set _13939(param1:String) : void
      {
         this._13943 = param1;
      }
   }
}

