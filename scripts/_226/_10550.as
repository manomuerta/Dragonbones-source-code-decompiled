package _226
{
   import _1404._1407;
   import _51._79;
   import _586._598;
   import _93._92;
   import _948._951;
   
   public class _10550 extends _92
   {
      public function _10550()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         var _loc2_:_951 = null;
         super.execute();
         var _loc1_:int = 0;
         while(_loc1_ < this._2909._5273._2490.numChildren)
         {
            _loc2_ = this._2909._5273._2490.getElementAt(_loc1_) as _951;
            if(!_loc2_)
            {
               break;
            }
            if(_loc2_.data == this._1837)
            {
               _loc2_.blendMode = this._10564;
               this._1837.blendMode = this._10564;
            }
            _loc1_++;
         }
         this._2909.refresh();
      }
      
      override public function revert() : void
      {
         var _loc2_:_951 = null;
         super.revert();
         var _loc1_:int = 0;
         while(_loc1_ < this._2909._5273._2490.numChildren)
         {
            _loc2_ = this._2909._5273._2490.getElementAt(_loc1_) as _951;
            if(!_loc2_)
            {
               break;
            }
            if(_loc2_.data == this._1837)
            {
               _loc2_.blendMode = this._10563;
               this._1837.blendMode = this._10563;
            }
            _loc1_++;
         }
         this._2909.refresh();
      }
      
      override protected function _2211() : *
      {
         return this._1837.blendMode;
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837;
      }
      
      protected function get _10564() : String
      {
         return _2223._10564;
      }
      
      protected function get _10563() : String
      {
         return _2223._10563;
      }
      
      protected function get _2909() : _598
      {
         return _1407.getInstance(_598) as _598;
      }
   }
}

