package _413
{
   import _676._675;
   import _93._92;
   
   public class _412 extends _92
   {
      public function _412()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         _675.addFrame(this.data._1945,this.data._1946);
      }
      
      override public function revert() : void
      {
         _675.delFrame(this.data._1945,this.data._1946);
      }
      
      private function get data() : _452
      {
         return _2223 as _452;
      }
      
      override protected function _2211() : *
      {
         return _2208;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         _2208 = param1;
      }
   }
}

