package _439
{
   import _13492._13491;
   import _1404._1407;
   import _40._44;
   import _555._570;
   import _93._92;
   
   public class _11234 extends _92
   {
      public function _11234()
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
         var _loc1_:_13491 = this._1634[0];
         var _loc2_:_44 = this._1634[1];
         var _loc3_:int = int(this._1634[2]);
         if(_loc1_ && _loc2_ && _loc1_._13637 && _loc3_ >= 0)
         {
            _loc1_._13637.splice(_loc3_,0,_loc2_);
         }
         this._11314();
      }
      
      override public function execute() : void
      {
         var _loc3_:int = 0;
         var _loc1_:_13491 = this._2223[0];
         var _loc2_:_44 = this._2223[1];
         if(_loc1_ && _loc2_ && _loc1_._13637 && _loc1_._13637.length > 0)
         {
            _loc3_ = int(_loc1_._13637.indexOf(_loc2_));
            if(_loc3_ >= 0)
            {
               this._1634[2] = _loc3_;
               _loc1_._13637.splice(_loc3_,1);
            }
         }
         this._11314();
      }
      
      private function _11314() : void
      {
         var _loc1_:_570 = _1407.getInstance(_570) as _570;
         _loc1_.refresh();
      }
   }
}

