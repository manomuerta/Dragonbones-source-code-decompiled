package _279
{
   import _1404._1407;
   import _472._473;
   import _521._523;
   import _54._53;
   import _54._56;
   import _54._57;
   import _54._67;
   import _586._589;
   import _586._605;
   import _644._645;
   import _644._646;
   import _73._72;
   import _81._91;
   import _93._92;
   
   public class _278 extends _92
   {
      protected var _3093:int;
      
      protected var _3094:int;
      
      protected var _3092:int;
      
      protected var _3079:Boolean;
      
      protected var _target:_91;
      
      public function _278()
      {
         super();
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this._3079)
         {
            this._3083();
         }
         if(this._2071._2081)
         {
            this._3084();
         }
      }
      
      override public function revert() : void
      {
         super.revert();
         if(this._3079)
         {
            this._3083(true);
         }
         if(this._2071._2081)
         {
            this._3084(true);
         }
      }
      
      protected function _2894() : void
      {
         if(this._3061._2889.length > 0)
         {
            if(this._target != null)
            {
               this._3061._2986(null,this._target);
            }
            else
            {
               this._3061._2986(null);
            }
         }
         this._3059._2064();
         this._3073._3063(this._3085);
         this._3058._3089();
         this._3058.refresh();
         this._3059._3060();
      }
      
      protected function deleteTween() : void
      {
         _2223._3075 = this._3090.tweens.indexOf(this._2071);
         _2223._3074 = this._3091.tracks.indexOf(this._3090);
         _2223._3068 = this._3085._2062.indexOf(this._3091);
         this._3090._2075(this._2071);
         if(this._3090.tweens.length == 0)
         {
            this._3091._2073(this._3090);
            if(this._3091.tracks.length == 0)
            {
               this._3085._2061(this._3091);
            }
         }
      }
      
      protected function _3082() : void
      {
         this._3090._2076(this._2071,_2223._3075);
         if(this._3090.tweens.length == 1)
         {
            this._3091._2074(this._3090,_2223._3074);
            if(this._3091.tracks.length == 1)
            {
               this._3085._2063(this._3091,_2223._3068);
            }
         }
      }
      
      protected function _3083(param1:Boolean = false) : void
      {
         if(!this._3088)
         {
            return;
         }
         if(!param1)
         {
            this._3093 = this._2071.easing;
            this._3094 = this._2071.delay;
            this._3092 = this._2071.during;
            this._2071.easing = this._3088.easing;
            this._2071.delay = this._3088.delay;
            this._2071.during = this._3088.during;
         }
         else
         {
            this._2071.easing = this._3093;
            this._2071.delay = this._3094;
            this._2071.during = this._3092;
         }
      }
      
      protected function _3084(param1:Boolean = false) : void
      {
         var _loc2_:Vector.<_72> = this._2056._2079;
         var _loc3_:int = int(_loc2_.indexOf(this._2071.type));
         if(!param1)
         {
            if(_loc3_ == -1)
            {
               this._2056._2079.push(this._2071.type);
            }
            this._2071.visible = false;
         }
         else
         {
            if(_loc3_ >= 0)
            {
               this._2056._2079.splice(_loc3_,1);
            }
            this._2071.visible = true;
         }
      }
      
      public function get _2071() : _67
      {
         return _2223._2071 as _67;
      }
      
      public function get _3090() : _57
      {
         return _2223._3090 as _57;
      }
      
      public function get _3091() : _56
      {
         return !!_2223._3091 ? _2223._3091 : this._3090.parent as _56;
      }
      
      public function get _3085() : _53
      {
         return !!_2223._3085 ? _2223._3085 : this._3091.parent as _53;
      }
      
      public function get _2056() : _67
      {
         return _2223._2056;
      }
      
      public function get _3088() : _67
      {
         this._3079 = !!_2223._3088;
         return _2223._3088;
      }
      
      protected function get _3087() : _646
      {
         return _2223._3087 as _646;
      }
      
      protected function get _3086() : _646
      {
         return _2223._3086 as _646;
      }
      
      protected function get _3070() : _645
      {
         return _2223._3070 as _645;
      }
      
      protected function get _3078() : int
      {
         return int(_2223._3078);
      }
      
      protected function get _3081() : int
      {
         return int(_2223._3081);
      }
      
      protected function get _3080() : int
      {
         return int(_2223._3080);
      }
      
      protected function get _3073() : _473
      {
         return _1407.getInstance(_473) as _473;
      }
      
      protected function get _3059() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
      
      protected function get _3058() : _589
      {
         return _1407.getInstance(_589) as _589;
      }
      
      protected function get _3061() : _523
      {
         return _1407.getInstance(_523) as _523;
      }
   }
}

