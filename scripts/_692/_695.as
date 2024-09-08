package _692
{
   import _724._733;
   
   public class _695 extends _693
   {
      private var _name:String;
      
      public function _695(param1:_733)
      {
         super(param1);
      }
      
      override public function _4188() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this.libraryVO)
         {
            _loc1_ = this.libraryVO._4188();
         }
         return super._4188() || _loc1_;
      }
      
      public function _4160() : String
      {
         if(this.libraryVO == null)
         {
            return null;
         }
         return this.libraryVO._4160();
      }
      
      public function get libraryVO() : _733
      {
         return this._3670 as _733;
      }
      
      public function get libraryPath() : String
      {
         if(this.libraryVO == null || this.libraryVO._5840 == null)
         {
            return "";
         }
         return this.libraryVO._5840.path;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      override public function get name() : String
      {
         return this._name;
      }
      
      public function clear() : void
      {
         _5822.length = 0;
      }
   }
}

