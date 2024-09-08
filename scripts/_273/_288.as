package _273
{
   import _1404._1407;
   import _472._473;
   import _54._53;
   import _54._56;
   import _54._57;
   import _54._67;
   import _644._645;
   import _644._646;
   import _93._92;
   
   public class _288 extends _92
   {
      public function _288()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         _2223._3075 = this._2069.tweens.indexOf(this._2071);
         _2223._3074 = this._2070.tracks.indexOf(this._2069);
         _2223._3068 = this._1992._2062.indexOf(this._2070);
         _2223.tweenModelIndex = this._3077.tweens.indexOf(this._2071);
         _2223._3067 = this._3070.tracks.indexOf(this._3077);
         this._2069._2075(this._2071);
         if(this._2069.tweens.length == 0)
         {
            this._2070._2073(this._2069);
            if(this._2070.tracks.length == 0)
            {
               this._1992._2061(this._2070);
            }
         }
         this._3077._2075(this._2071);
         if(this._3077.tweens.length == 0)
         {
            this._3070._2073(this._3077);
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2069._2076(this._2071,_2223._3075);
         if(this._2069.tweens.length == 1)
         {
            this._2070._2074(this._2069,_2223._3074);
            if(this._2070.tracks.length == 1)
            {
               this._1992._2063(this._2070,_2223._3068);
            }
         }
         this._3077._2076(this._2071,_2223.tweenModelIndex);
         if(this._3077.tweens.length == 1)
         {
            this._3070._2074(this._3077,_2223._3067);
         }
         this._2894();
      }
      
      private function _2894() : void
      {
         this._3055._3063(this._1992);
      }
      
      private function get _1992() : _53
      {
         return _2223._1992 as _53;
      }
      
      private function get _2070() : _56
      {
         return _2223._2070 as _56;
      }
      
      public function get _2069() : _57
      {
         return _2223._2069 as _57;
      }
      
      public function get _2071() : _67
      {
         return _2223._2071 as _67;
      }
      
      public function get _3070() : _645
      {
         return _2223._3070 as _645;
      }
      
      public function get _3077() : _646
      {
         return _2223._3077 as _646;
      }
      
      public function get _3055() : _473
      {
         return _1407.getInstance(_473) as _473;
      }
   }
}

