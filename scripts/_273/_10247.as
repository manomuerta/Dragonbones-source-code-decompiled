package _273
{
   import _1404._1407;
   import _472._473;
   import _54._57;
   import _54._67;
   import _555._556;
   import _586._589;
   import _586._605;
   import _644._645;
   import _644._646;
   import _783.ComicNotification;
   import _93._92;
   
   public class _10247 extends _92
   {
      private var _10291:Vector.<_67>;
      
      private var _10290:Array;
      
      private var _10289:Array;
      
      public function _10247()
      {
         this._10291 = new Vector.<_67>();
         this._10290 = [];
         this._10289 = [];
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
      }
      
      override public function execute() : void
      {
         var _loc3_:_67 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:int = int(this._3077.tweens.indexOf(this._2071));
         var _loc2_:int = this._2071.index;
         for each(_loc3_ in this._2069.tweens)
         {
            if(_loc3_._1837 == this._3117._1837)
            {
               if(this._3117._10279 && _loc3_._10279 || this._3117._10280 && _loc3_._10280 || this._3117._10281 && _loc3_._10281 || this._3117._10282 && _loc3_._10282)
               {
                  if(_loc3_ != this._2071)
                  {
                     this._10291.push(_loc3_);
                     this._10290.push(_loc3_.index);
                     this._10289.push(this._3077.tweens.indexOf(_loc3_));
                  }
               }
            }
         }
         _loc4_ = 0;
         _loc5_ = int(this._10291.length);
         while(_loc4_ < _loc5_)
         {
            this._3077._2075(this._10291[_loc4_]);
            this._2069._2075(this._10291[_loc4_]);
            _loc4_++;
         }
         this._3077._2075(this._2071);
         this._2069._2075(this._2071);
         this._3077._2076(this._3117,_loc1_);
         this._2069._2076(this._3117,_loc2_);
         this._2894();
         this._3058._1567(new ComicNotification(ComicNotification.PREVIEW_TRACK,this._3077));
      }
      
      override public function revert() : void
      {
         var _loc1_:int = int(this._3077.tweens.indexOf(this._3117));
         var _loc2_:int = this._3117.index;
         this._3077._2075(this._3117);
         this._2069._2075(this._3117);
         this._3077._2076(this._2071,_loc1_);
         this._2069._2076(this._2071,_loc2_);
         var _loc3_:int = 0;
         var _loc4_:int = int(this._10291.length);
         while(_loc3_ < _loc4_)
         {
            this._3077._2076(this._10291[_loc3_],this._10289[_loc3_]);
            this._2069._2076(this._10291[_loc3_],this._10290[_loc3_]);
            _loc3_++;
         }
         this._2894();
      }
      
      private function _2894() : void
      {
         if(this._3070._10287)
         {
            this._3058._3076(this._3070._10287);
         }
         this._3058.refresh();
         this._3056.refresh();
         this._3055._2894();
         this._3113._3115();
      }
      
      private function get _2069() : _57
      {
         return _2223._2069 as _57;
      }
      
      public function get _2071() : _67
      {
         return _2223._2071 as _67;
      }
      
      public function get _3117() : _67
      {
         return _2223._3117 as _67;
      }
      
      private function get _3077() : _646
      {
         return _2223._3077 as _646;
      }
      
      public function get parent() : _57
      {
         return this._2071.parent;
      }
      
      public function get _3070() : _645
      {
         return this._3055._3058._3116(this._2071);
      }
      
      public function get _3055() : _473
      {
         return _1407.getInstance(_473) as _473;
      }
      
      private function get _3058() : _589
      {
         return _1407.getInstance(_589) as _589;
      }
      
      private function get _3056() : _556
      {
         return _1407.getInstance(_556) as _556;
      }
      
      protected function get _3113() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
   }
}

