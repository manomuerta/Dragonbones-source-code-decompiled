package _273
{
   import _1404._1407;
   import _472._473;
   import _521._523;
   import _54._53;
   import _54._56;
   import _54._57;
   import _586._589;
   import _586._605;
   import _644._645;
   import _644._646;
   import _81._91;
   import _93._92;
   
   public class _286 extends _92
   {
      private var _3069:_91;
      
      public function _286()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.execute();
         this._3070._2073(this._3077);
         if(_2223.deleteStrip)
         {
            this._1992._2061(this._2070);
         }
         else if(_2223.deleteTrack)
         {
            this._2070._2073(this._2069);
         }
         else
         {
            _loc1_ = 0;
            _loc2_ = int(this._3077.tweens.length);
            while(_loc1_ < _loc2_)
            {
               this._2069._2075(this._3077.tweens[_loc1_]);
               _loc1_++;
            }
         }
         this._3069 = this._3077._1837;
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.revert();
         this._3070._2074(this._3077,this._3067);
         if(_2223.deleteStrip)
         {
            this._1992._1827(this._2070);
         }
         else if(_2223.deleteTrack)
         {
            this._2070._2074(this._2069,this._3074);
         }
         else
         {
            _loc1_ = 0;
            _loc2_ = int(this._3077.tweens.length);
            while(_loc1_ < _loc2_)
            {
               this._2069.addTween(this._3077.tweens[_loc1_]);
               _loc1_++;
            }
         }
         this._3069 = this._3077;
         this._2894();
      }
      
      private function _2894() : void
      {
         this._3061._2986(null,this._3069);
         this._3058._3065();
         this._3059._3060();
         this._3073._3063(this._1992);
         this._3073._3105();
         this._3073._3062();
      }
      
      private function get _1992() : _53
      {
         return _2223._1992 as _53;
      }
      
      private function get _2070() : _56
      {
         return _2223._2070 as _56;
      }
      
      public function get _3077() : _646
      {
         return _2223._3077 as _646;
      }
      
      public function get _2069() : _57
      {
         return _2223._2069 as _57;
      }
      
      public function get _3070() : _645
      {
         return _2223._3070 as _645;
      }
      
      private function get _3067() : int
      {
         return _2223._3067;
      }
      
      private function get _3074() : int
      {
         return _2223._3074;
      }
      
      private function get _3058() : _589
      {
         return _1407.getInstance(_589) as _589;
      }
      
      private function get _3061() : _523
      {
         return _1407.getInstance(_523) as _523;
      }
      
      private function get _3059() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
      
      public function get _3073() : _473
      {
         return _1407.getInstance(_473) as _473;
      }
   }
}

