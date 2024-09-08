package _127
{
   import _1045._1105;
   import _1088.TreeItemRenderer;
   import _1404._1407;
   import _555._558;
   import _703._702;
   
   public class _14049 extends TreeItemRenderer
   {
      public var _4538:_1105;
      
      public function _14049()
      {
         super();
         skinName = _14050;
      }
      
      override protected function _6699() : void
      {
         this._4538.source = this._14372._4538(this.data as _702);
      }
      
      private function get _14372() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
   }
}

