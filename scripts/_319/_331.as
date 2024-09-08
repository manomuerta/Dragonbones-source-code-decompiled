package _319
{
   import _658._660;
   
   public class _331 extends _328
   {
      public function _331()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override protected function _2211() : *
      {
         super._2211();
         _2223.meshRig = mesh.meshRig;
         return mesh._3197();
      }
      
      override public function execute() : void
      {
         mesh.empty();
         _3172._3024();
         this._2894();
      }
      
      override public function revert() : void
      {
         _3172._3187();
         _11553._3187();
         mesh._1796(_2208);
         if(_2223.meshRig)
         {
            mesh.meshRig = _2223.meshRig as _660;
         }
         this._2894();
         if(_1837)
         {
            _2212._2907(_1837);
         }
      }
      
      override protected function _2894() : void
      {
         _3172._3173();
         _2853.refresh();
      }
   }
}

