package _397
{
   import _1404._1407;
   import _579._578;
   import _755._759;
   import _93._92;
   
   public class _398 extends _92
   {
      public function _398()
      {
         super();
         _2215 = false;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:_759 = this._3331._3286[this.type + "Filter"];
         _loc1_[this.target] = this.value;
         this._3331._3341();
      }
      
      protected function get target() : String
      {
         return _2223.target;
      }
      
      protected function get type() : String
      {
         return _2223.type;
      }
      
      protected function get value() : Boolean
      {
         return _2223.value;
      }
      
      protected function get _3331() : _578
      {
         return _1407.getInstance(_578) as _578;
      }
   }
}

