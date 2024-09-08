package _226
{
   import _1404._1407;
   import _51._77;
   import _555._570;
   import _93._92;
   
   public class _253 extends _92
   {
      public function _253()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893();
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2942.name = this._2952;
         this._2894();
      }
      
      override protected function _2211() : *
      {
         return this._2942.name;
      }
      
      public function _2893() : void
      {
         this._2942.name = this.newName;
      }
      
      public function _2894() : void
      {
         _570(_1407.getInstance(_570)).refresh();
      }
      
      public function get _2942() : _77
      {
         return _2223._1897;
      }
      
      public function get newName() : String
      {
         return _2223.name;
      }
      
      protected function get _2952() : String
      {
         return _2208;
      }
   }
}

