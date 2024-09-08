package _279
{
   import _1404._1407;
   import _472._473;
   
   public class _280 extends _278
   {
      public function _280()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3095();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._3095();
      }
      
      protected function _3095() : void
      {
         this._3055._3063(_2071.parent.parent.parent);
      }
      
      public function get _3055() : _473
      {
         return _1407.getInstance(_473) as _473;
      }
   }
}

