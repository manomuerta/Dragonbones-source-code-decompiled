package _439
{
   import _1404._1407;
   import _40._44;
   import _555._570;
   import _93._92;
   
   public class _11235 extends _92
   {
      public function _11235()
      {
         super();
         this._2219 = true;
         this._2215 = true;
      }
      
      override protected function _2211() : *
      {
         return this._2223;
      }
      
      override public function revert() : void
      {
         var _loc1_:_44 = this._1634[0];
         var _loc2_:String = this._1634[2];
         if(_loc1_)
         {
            _loc1_.value = _loc2_;
         }
         this._11314();
      }
      
      override public function execute() : void
      {
         var _loc1_:_44 = this._2223[0];
         var _loc2_:String = this._2223[1];
         if(_loc1_)
         {
            this._1634[2] = _loc1_.value;
            _loc1_.value = _loc2_;
         }
         this._11314();
      }
      
      private function _11314() : void
      {
         var _loc1_:_570 = _1407.getInstance(_570) as _570;
         _loc1_._3396();
      }
   }
}

